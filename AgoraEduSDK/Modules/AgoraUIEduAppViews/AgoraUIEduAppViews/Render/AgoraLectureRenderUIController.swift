//
//  AgoraLectureRenderUIController.swift
//  AgoraUIEduAppViews
//
//  Created by LYY on 2021/7/19.
//

import Foundation
import AgoraUIEduBaseViews
import AgoraUIBaseViews
import AgoraEduContext

class AgoraLectureRenderUIController: AgoraSmallRenderUIController {
    let assistantView = AgoraUIUserView(frame: .zero)
    let assistantIndex = -2
    
    // DataSource
    var assistantInfo: AgoraEduContextUserDetailInfo? {
        didSet {
            updateUserView(assistantView,
                           oldUserInfo: oldValue,
                           newUserInfo: assistantInfo)
        }
    }
    
    override init(viewType: AgoraEduContextAppType,
                  contextProvider: AgoraControllerContextProvider,
                  eventRegister: AgoraControllerEventRegister,
                  delegate: AgoraSmallRenderUIControllerDelegate) {
        super.init(viewType: viewType,
                   contextProvider: contextProvider,
                   eventRegister: eventRegister,
                   delegate: delegate)
        initLectureView()
        initLectureLayout()
        observeLectureUI()
    }
    
    // MARK: AgoraUIUserViewDelegate
    override func userView(_ userView: AgoraUIUserView,
                           didPressAudioButton button: AgoraBaseUIButton,
                           indexOfUserList index: Int) {
        switch index {
        case teacherIndex:
            guard let info = teacherInfo,
                  info.isSelf else {
                return
            }
            
            button.isSelected.toggle()
            let isMuted = button.isSelected
            userContext?.muteAudio(isMuted)
        case assistantIndex:
            guard let info = assistantInfo,
                  info.isSelf else {
                return
            }
            
            button.isSelected.toggle()
            let isMuted = button.isSelected
            userContext?.muteAudio(isMuted)
        default:
            let studentInfo = coHosts[index].userInfo
            guard studentInfo.isSelf else {
                return
            }

            button.isSelected.toggle()
            let isMuted = button.isSelected
            userContext?.muteAudio(isMuted)
        }
    }

    override func userView(_ userView: AgoraUIUserView,
                           didPressVideoButton button: AgoraBaseUIButton,
                           indexOfUserList index: Int) {
        switch index {
        case teacherIndex:
            guard let info = teacherInfo,
                  info.isSelf else {
                return
            }
            
            button.isSelected.toggle()
            userContext?.muteVideo(button.isSelected)
        case assistantIndex:
            guard let info = assistantInfo,
                  info.isSelf else {
                return
            }
            
            button.isSelected.toggle()
            userContext?.muteVideo(button.isSelected)
        default:
            let studentInfo = coHosts[index].userInfo
            guard studentInfo.isSelf else {
                return
            }

            button.isSelected.toggle()
            userContext?.muteVideo(button.isSelected)
        }
    }

}


// MARK: AgoraEduUserHandler
extension AgoraLectureRenderUIController {
    override func onUpdateUserList(_ list: [AgoraEduContextUserDetailInfo]) {
        if let kitUserInfo = list.first(where: { $0.user.role == .teacher }) {
            teacherInfo = kitUserInfo
        } else {
            teacherInfo = nil
        }
        
        if let kitUserInfo = list.first(where: { $0.user.role == .assistant }) {
            assistantInfo = kitUserInfo
        } else {
            assistantInfo = nil
        }
    }
}

// MARK: private
private extension AgoraLectureRenderUIController {
    func initLectureView() {
        assistantView.index = assistantIndex
        containerView.addSubview(assistantView)
    }
    
    func initLectureLayout() {
        let isPad = AgoraKitDeviceAssistant.OS.isPad
        let ViewGap: CGFloat = 2
        
        let width: CGFloat = isPad ? 300 : 200
        let height: CGFloat = isPad ? 168 : 112
        
        assistantView.agora_y = 0
        assistantView.agora_right = width / 2
        assistantView.agora_width = width / 2
        assistantView.agora_height = height / 2
    }
    
    func observeLectureUI() {
        assistantView.delegate = self
    }
}
