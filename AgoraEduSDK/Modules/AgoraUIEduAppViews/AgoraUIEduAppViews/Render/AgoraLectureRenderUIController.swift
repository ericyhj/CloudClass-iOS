//
//  AgoraLectureRenderUIController.swift
//  AgoraUIEduAppViews
//
//  Created by LYY on 2021/6/2.
//

import AgoraUIEduBaseViews
import AgoraUIBaseViews
import AgoraEduContext
import AudioToolbox

class AgoraLectureRenderUIController: AgoraRenderUIController {
    private(set) var teacherViewSize: CGSize = CGSize.zero
    
    private weak var contextProvider: AgoraControllerContextProvider?
    private weak var eventRegister: AgoraControllerEventRegister?
    
    // 距离上面的值， 等于navView的高度
    let renderTop: CGFloat = AgoraKitDeviceAssistant.OS.isPad ? 44 : 34
    
    // Views
    let teacherSmallView = AgoraUIUserView(frame: .zero)
    private lazy var largeCanvas: AgoraUIVideoCanvas = {
        let canvas = AgoraUIVideoCanvas()
        canvas.backgroundColor = UIColor(r: 249,
                                         g: 249,
                                         b: 252)
        
        canvas.addSubview(imgViewOnCanvas)
        canvas.bringSubviewToFront(imgViewOnCanvas)
        imgViewOnCanvas.agora_x = 0
        imgViewOnCanvas.agora_y = 0
        imgViewOnCanvas.agora_right = 0
        imgViewOnCanvas.agora_bottom = 0
        imgViewOnCanvas.isHidden = true
        
        return canvas
    }()
    
    
    private lazy var imgViewOnCanvas: AgoraBaseUIImageView = {
        let imgViewOnCanvas = AgoraBaseUIImageView(frame: .zero)
        imgViewOnCanvas.contentMode = .center
        imgViewOnCanvas.backgroundColor = UIColor(r: 249,
                                                  g: 249,
                                                  b: 252)
        setImg(imgViewOnCanvas,
               "large_offline")
        return imgViewOnCanvas
    }()
    
    var rewardImageView: AgoraFLAnimatedImageView?
    
    // DataSource
    var teacherInfo: AgoraEduContextUserDetailInfo? {
        didSet {
            updateView(oldUserInfo: oldValue)
        }
    }
    
    private var largeRenderFlag: Bool = false {
        didSet {
            updateView()
            }
        }
    
    override init(viewType: AgoraEduContextAppType,
         contextProvider: AgoraControllerContextProvider,
         eventRegister: AgoraControllerEventRegister) {
        
        super.init(viewType: viewType,
                   contextProvider: contextProvider,
                   eventRegister: eventRegister)
        
        initViews()
        initLayout()
        observeEvent(register: eventRegister)
    }
    
    func updateRenderView(_ isFullScreen: Bool) {
        UIView.animate(withDuration: TimeInterval.agora_animation) {
            self.teacherSmallView.alpha = isFullScreen ? 0 : 1
            self.largeCanvas.agora_safe_right = isFullScreen ? 0 : self.containerView.agora_safe_right + self.teacherViewSize.width + 2
        } completion: { (_) in
            self.teacherSmallView.isHidden = isFullScreen
        }
    }
}

// MARK: AgoraEduUserHandler
extension AgoraLectureRenderUIController: AgoraEduUserHandler {
    
    func onUpdateUserList(_ list: [AgoraEduContextUserDetailInfo]) {
        guard let teacherDetailInfo = list.first(where: { $0.user.role == .teacher }) else {
            return
        }
        teacherInfo = teacherDetailInfo
    }
    // 自己被踢出
    public func onKickedOut() {
        let btnLabel = AgoraAlertLabelModel()
        btnLabel.text = AgoraKitLocalizedString("SureText")
        let btnModel = AgoraAlertButtonModel()
        
        btnModel.titleLabel = btnLabel
        btnModel.tapActionBlock = { [weak self] (index) -> Void in
            self?.roomContext?.leaveRoom()
        }
        
        AgoraUtils.showAlert(imageModel: nil,
                             title: AgoraKitLocalizedString("KickOutNoticeText"),
                             message: AgoraKitLocalizedString("KickOutText"),
                             btnModels: [btnModel])
    }
    
    // 音量提示
    public func onUpdateAudioVolumeIndication(_ value: Int,
                                              streamUuid: String) {
        if let info = teacherInfo,
           info.streamUuid == streamUuid {
            teacherSmallView.updateAudio(effect: value)
        }
    }
    
    /* 显示提示信息
     * 你的摄像头被关闭了
     * 你的麦克风被关闭了
     * 你的摄像头被打开了
     * 你的麦克风被打开了
     */
    public func onShowUserTips(_ message: String) {
        AgoraUtils.showToast(message: message)
    }
    
    // 收到奖励（自己或者其他学生）
    public func onShowUserReward(_ user: AgoraEduContextUserInfo) {
        rewardAnimation()
    }
}

// MARK: AgoraEduRoomHandler
extension AgoraLectureRenderUIController: AgoraEduRoomHandler {
    func onFlexRoomPropertiesInitialize(_ properties: [String : Any]) {
        if let renderMode = properties["teacherRenderMode"] as? Int {
            largeRenderFlag = (renderMode == 1)
        } else if let renderMode = properties["teacherRenderMode"] as? String {
            largeRenderFlag = (renderMode == "1")
        }
    }
    
    func onFlexRoomPropertiesChanged(_ changedProperties: [String : Any],
                                     properties: [String : Any],
                                     cause: [String : Any]?,
                                     operator: AgoraEduContextUserInfo?) {
        if let renderMode = properties["teacherRenderMode"] as? Int {
            largeRenderFlag = (renderMode == 1)
        } else if let renderMode = properties["teacherRenderMode"] as? String {
            largeRenderFlag = (renderMode == "1")
        }
    }
}

// MARK: - Private
private extension AgoraLectureRenderUIController {
    func initViews() {
        teacherSmallView.index = -1
        containerView.backgroundColor = .clear

        containerView.addSubview(teacherSmallView)
        containerView.addSubview(largeCanvas)
        containerView.isUserInteractionEnabled = false
        largeCanvas.isHidden = true
    }

    func initLayout() {
        let isPad = AgoraKitDeviceAssistant.OS.isPad
        let ViewGap: CGFloat = 2

        let width: CGFloat = isPad ? 300 : 200
        let height: CGFloat = isPad ? 168 : 112
        
        teacherSmallView.agora_y = 0
        teacherSmallView.agora_right = 0
        teacherSmallView.agora_width = width
        teacherSmallView.agora_height = height
        
        largeCanvas.agora_safe_x = 0
        largeCanvas.agora_y = 0
        largeCanvas.agora_safe_bottom = 0
        largeCanvas.agora_safe_right = width + ViewGap
        
        teacherViewSize = CGSize(width: width, height: height)
    }
    
    func updateView(oldUserInfo: AgoraEduContextUserDetailInfo? = nil) {
        updateUserView(teacherSmallView,
                       oldUserInfo: oldUserInfo,
                       newUserInfo: teacherInfo,
                       largeRenderFlag: largeRenderFlag)
        largeCanvas.isHidden = !largeRenderFlag
        
        guard let `teacherInfo` = teacherInfo else {
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_offline")
            return
        }

        if largeRenderFlag {
            userContext?.renderView(largeCanvas,
                                    streamUuid: teacherInfo.streamUuid)
            teacherCameraCoverDispatch()
        } else {
            
            userContext?.renderView(teacherSmallView.videoCanvas,
                                    streamUuid: teacherInfo.streamUuid)
        }
    }

    func teacherCameraCoverDispatch() {
        guard let `teacherInfo` = teacherInfo,
                teacherInfo.onLine else {
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_offline")
            return
        }

        switch (teacherInfo.cameraState,teacherInfo.enableVideo) {
        case var (cameraState,enableVideo) where cameraState == .close:
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_close")
        case var (cameraState,enableVideo) where cameraState == .notAvailable:
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_unavailable")
        case (.available,true):
            imgViewOnCanvas.isHidden = true
        case (.available,false):
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_disable")
            largeCanvas.bringSubviewToFront(imgViewOnCanvas)
        default:
            imgViewOnCanvas.isHidden = false
            setImg(imgViewOnCanvas,
                   "large_unavailable")
        }
    }
    
    func setImg(_ imgView: AgoraBaseUIImageView,
                _ name: String) {
        imgView.image = AgoraKitImage(object: self,
                                   resource: "AgoraUIEduAppViews",
                                   name: name)
    }
    
    func observeEvent(register: AgoraControllerEventRegister) {
        register.controllerRegisterRoomEvent(self)
        register.controllerRegisterUserEvent(self)
    }
    
    internal func rewardAnimation() {
        // Gif
        rewardImageView = rewardImage()
        
        guard let `rewardImageView` = rewardImageView,
              let keyWindow = UIApplication.shared.keyWindow else {
            fatalError()
        }
        
        let isPad = AgoraKitDeviceAssistant.OS.isPad
        
        keyWindow.addSubview(rewardImageView)
        rewardImageView.translatesAutoresizingMaskIntoConstraints = false
        rewardImageView.agora_center_x = 0
        rewardImageView.agora_center_y = 0
        rewardImageView.agora_width = isPad ? 300 : 200
        rewardImageView.agora_height = isPad ? 300 : 200

        // Audio effect
        rewardAudioEffect()
    }
    
    func rewardImage() -> AgoraFLAnimatedImageView {
        guard let bundle = Bundle.agora_bundle(object: self,
                                               resource: "AgoraUIEduAppViews"),
              let url = bundle.url(forResource: "reward",
                                   withExtension: "gif"),
              let data = try? Data(contentsOf: url) else {
            fatalError()
        }
            
        let animatedImage = AgoraFLAnimatedImage(animatedGIFData: data)
        animatedImage?.loopCount = 1
        
        let imageView = AgoraFLAnimatedImageView()
        imageView.animatedImage = animatedImage
        imageView.loopCompletionBlock = { (count) in
            imageView.removeFromSuperview()
        }
        
        return imageView
    }
    
    func rewardAudioEffect() {
        guard let bundle = Bundle.agora_bundle(object: self,
                                               resource: "AgoraUIEduAppViews"),
              let url = bundle.url(forResource: "reward",
                                   withExtension: "mp3") else {
            fatalError()
        }
        
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL,
                                         &soundId);
        
        AudioServicesAddSystemSoundCompletion(soundId,
                                              nil,
                                              nil, { (soundId, clientData) -> Void in
                                                AudioServicesDisposeSystemSoundID(soundId)
                                              }, nil)
        
        AudioServicesPlaySystemSound(soundId);
    }
}
