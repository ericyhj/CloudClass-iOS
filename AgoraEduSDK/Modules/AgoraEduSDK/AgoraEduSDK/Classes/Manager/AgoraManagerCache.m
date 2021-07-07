//
//  AgoraManagerCache.m
//  AgoraEduSDK
//
//  Created by SRS on 2021/2/8.
//

#import "AgoraManagerCache.h"

static AgoraManagerCache *manager = nil;

@implementation AgoraManagerCache
+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AgoraManagerCache alloc] init];
        manager.sdkReady = NO;
        manager.differTime = 0;
        manager.lan = AgoraEduChatTranslationLanAUTO;
        manager.coursewares = @[];
    });
    return manager;
}

- (void)setRoomStateInfoModel:(AgoraRoomStateInfoModel *)roomStateInfoModel {
    if (!roomStateInfoModel.board.boardRegion) {
        roomStateInfoModel.board.boardRegion = @"us-sv";
    }
    if (!roomStateInfoModel.rtcRegion) {
        roomStateInfoModel.rtcRegion = @"AREA_NA";
    }
    if (!roomStateInfoModel.rtmRegion) {
        roomStateInfoModel.rtmRegion = @"AREA_NA";
    }
    _roomStateInfoModel = roomStateInfoModel;
}

+ (void)releaseResource {
    AgoraManagerCache.share.classroom = nil;
//    AgoraManagerCache.share.replay = nil;
    AgoraManagerCache.share.classroomDelegate = nil;
    
    AgoraManagerCache.share.sdkReady = NO;
    
    AgoraManagerCache.share.boardAppId = @"";
    AgoraManagerCache.share.coursewares = @[];
    AgoraManagerCache.share.extApps = nil;
    
    AgoraManagerCache.share.mediaOptions = nil;
}
@end
