//
//  AgoraBaseViewController+User.m
//  AgoraEduSDK
//
//  Created by SRS on 2021/3/15.
//

#import "AgoraBaseViewController+User.h"

@implementation AgoraBaseViewController (User)

#pragma mark VCProcessDelegate
- (void)onUpdateUserList:(NSArray<AgoraEduContextUserDetailInfo*> *)list {
    [self.eventDispatcher onUpdateUserList: list];
}

- (void)onUpdateCoHostList:(NSArray<AgoraEduContextUserDetailInfo*> *)list {
    [self.eventDispatcher onUpdateCoHostList: list];
}

- (void)onKickedOut {
    [self.eventDispatcher onKickedOut];
}

- (void)onUpdateAudioVolumeIndication:(NSInteger)value
                           streamUuid:(NSString *)streamUuid {
    [self.eventDispatcher onUpdateAudioVolumeIndication:value
                                             streamUuid:streamUuid];
}

- (void)onShowUserTips:(NSString *)message {
    if (message == nil || message.length == 0) {
        return;
    }
    [self.eventDispatcher onShowUserTips:message];
}

#pragma mark AgoraEduUserContext
// 切换摄像头
- (void)switchCamera {
    [AgoraEduManager.shareManager.studentService switchCamera];
}

- (void)muteVideo:(BOOL)mute successBlock:(void (^)(void))successBlock failureBlock: (void (^)(void))failureBlock {
    AgoraWEAK(self);
    [self.userVM updateLocalVideoStream:mute
                           successBlock:^(AgoraRTEStream *stream) {
        successBlock();
    } failureBlock:^(AgoraEduContextError *error) {
        [weakself onShowErrorInfo:error];
        failureBlock();
    }];
}

- (void)muteAudio:(BOOL)mute successBlock:(void (^)(void))successBlock failureBlock: (void (^)(void))failureBlock {
    AgoraWEAK(self);
    [self.userVM updateLocalAudioStream:mute
                           successBlock:^(AgoraRTEStream *stream) {
        successBlock();
    } failureBlock:^(AgoraEduContextError *error) {
        [weakself onShowErrorInfo:error];
        failureBlock();
    }];
}

- (void)renderView:(UIView * _Nullable)view
        streamUuid:(NSString *)streamUuid {
    
    AgoraWEAK(self);
    [self.userVM getStreamInfoWithStreamUuid:streamUuid
                                successBlock:^(AgoraRTEStream *stream) {
        AgoraRTERenderConfig *config = [AgoraRTERenderConfig new];
        config.renderMode = AgoraRTERenderModeHidden;
        
        if (stream.sourceType == AgoraRTEVideoSourceTypeScreen) {
            config.renderMode = AgoraRTERenderModeFit;
        }
        
        AgoraRTESubscribeOptions *options = [[AgoraRTESubscribeOptions alloc] init];
        options.subscribeAudio = stream.hasAudio;
        options.subscribeVideo = view ? YES : NO;
        
        [AgoraEduManager.shareManager.studentService subscribeStream:stream
                                                             options:options
                                                             success:^{
            
        } failure:^(NSError * _Nonnull error) {
            
        }];
        
        [AgoraEduManager.shareManager.studentService setStreamView:view
                                                            stream:stream
                                                      renderConfig:config];
    } failureBlock:^(AgoraEduContextError *error) {
        [weakself onShowErrorInfo:error];
    }];
}
- (void)registerEventHandler:(id<AgoraEduUserHandler>)handler {
    [self.eventDispatcher registerWithObject:handler];
}
@end
