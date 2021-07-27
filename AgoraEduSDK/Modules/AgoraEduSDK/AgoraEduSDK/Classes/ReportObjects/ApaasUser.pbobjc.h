// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ApaasUser.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

//#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
//#else
// #import "GPBProtocolBuffers.h"
//#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ApaasUserRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface ApaasUserRoot : GPBRootObject
@end

#pragma mark - AgoraApaasUserJoin

typedef GPB_ENUM(AgoraApaasUserJoin_FieldNumber) {
  AgoraApaasUserJoin_FieldNumber_Lts = 1,
  AgoraApaasUserJoin_FieldNumber_Vid = 2,
  AgoraApaasUserJoin_FieldNumber_Ver = 3,
  AgoraApaasUserJoin_FieldNumber_Scenario = 4,
  AgoraApaasUserJoin_FieldNumber_ErrorCode = 5,
  AgoraApaasUserJoin_FieldNumber_Uid = 6,
  AgoraApaasUserJoin_FieldNumber_UserName = 7,
  AgoraApaasUserJoin_FieldNumber_StreamUid = 8,
  AgoraApaasUserJoin_FieldNumber_StreamSuid = 9,
  AgoraApaasUserJoin_FieldNumber_Role = 10,
  AgoraApaasUserJoin_FieldNumber_StreamSid = 11,
  AgoraApaasUserJoin_FieldNumber_RtmSid = 12,
  AgoraApaasUserJoin_FieldNumber_RoomId = 13,
  AgoraApaasUserJoin_FieldNumber_RoomCreateTs = 14,
};

GPB_FINAL @interface AgoraApaasUserJoin : GPBMessage

/** 时间戳，必须存在 */
@property(nonatomic, readwrite) int64_t lts;

@property(nonatomic, readwrite) BOOL hasLts;
/** vid */
@property(nonatomic, readwrite) int32_t vid;

@property(nonatomic, readwrite) BOOL hasVid;
/** apaas版本号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ver;
/** Test to see if @c ver has been set. */
@property(nonatomic, readwrite) BOOL hasVer;

/** apaas场景，如education/meeting/entertainment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *scenario;
/** Test to see if @c scenario has been set. */
@property(nonatomic, readwrite) BOOL hasScenario;

/** 异常码，若有 */
@property(nonatomic, readwrite) int32_t errorCode;

@property(nonatomic, readwrite) BOOL hasErrorCode;
/** apaas用户id，同RTM uid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uid;
/** Test to see if @c uid has been set. */
@property(nonatomic, readwrite) BOOL hasUid;

/** 用户名，用于显示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userName;
/** Test to see if @c userName has been set. */
@property(nonatomic, readwrite) BOOL hasUserName;

/** rtc流id */
@property(nonatomic, readwrite) int64_t streamUid;

@property(nonatomic, readwrite) BOOL hasStreamUid;
/** rtc流id */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSuid;
/** Test to see if @c streamSuid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSuid;

/** apaas角色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *role;
/** Test to see if @c role has been set. */
@property(nonatomic, readwrite) BOOL hasRole;

/** rtc sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSid;
/** Test to see if @c streamSid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSid;

/** rtm sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *rtmSid;
/** Test to see if @c rtmSid has been set. */
@property(nonatomic, readwrite) BOOL hasRtmSid;

/** apaas房间id，与rtc/rtm channelName相同 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomId;
/** Test to see if @c roomId has been set. */
@property(nonatomic, readwrite) BOOL hasRoomId;

/** 房间创建时间 */
@property(nonatomic, readwrite) int64_t roomCreateTs;

@property(nonatomic, readwrite) BOOL hasRoomCreateTs;
@end

#pragma mark - AgoraApaasUserLeave

typedef GPB_ENUM(AgoraApaasUserLeave_FieldNumber) {
  AgoraApaasUserLeave_FieldNumber_Lts = 1,
  AgoraApaasUserLeave_FieldNumber_Vid = 2,
  AgoraApaasUserLeave_FieldNumber_Ver = 3,
  AgoraApaasUserLeave_FieldNumber_Scenario = 4,
  AgoraApaasUserLeave_FieldNumber_ErrorCode = 5,
  AgoraApaasUserLeave_FieldNumber_Uid = 6,
  AgoraApaasUserLeave_FieldNumber_UserName = 7,
  AgoraApaasUserLeave_FieldNumber_StreamUid = 8,
  AgoraApaasUserLeave_FieldNumber_StreamSuid = 9,
  AgoraApaasUserLeave_FieldNumber_Role = 10,
  AgoraApaasUserLeave_FieldNumber_StreamSid = 11,
  AgoraApaasUserLeave_FieldNumber_RtmSid = 12,
  AgoraApaasUserLeave_FieldNumber_RoomId = 13,
  AgoraApaasUserLeave_FieldNumber_RoomCreateTs = 14,
};

GPB_FINAL @interface AgoraApaasUserLeave : GPBMessage

/** 时间戳，必须存在 */
@property(nonatomic, readwrite) int64_t lts;

@property(nonatomic, readwrite) BOOL hasLts;
/** vid */
@property(nonatomic, readwrite) int32_t vid;

@property(nonatomic, readwrite) BOOL hasVid;
/** apaas版本号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ver;
/** Test to see if @c ver has been set. */
@property(nonatomic, readwrite) BOOL hasVer;

/** apaas场景，如education/meeting/entertainment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *scenario;
/** Test to see if @c scenario has been set. */
@property(nonatomic, readwrite) BOOL hasScenario;

/** 异常码，若有 */
@property(nonatomic, readwrite) int32_t errorCode;

@property(nonatomic, readwrite) BOOL hasErrorCode;
/** apaas用户id，同RTM uid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uid;
/** Test to see if @c uid has been set. */
@property(nonatomic, readwrite) BOOL hasUid;

/** 用户名，用于显示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userName;
/** Test to see if @c userName has been set. */
@property(nonatomic, readwrite) BOOL hasUserName;

/** rtc流id */
@property(nonatomic, readwrite) int64_t streamUid;

@property(nonatomic, readwrite) BOOL hasStreamUid;
/** rtc流id */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSuid;
/** Test to see if @c streamSuid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSuid;

/** apaas角色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *role;
/** Test to see if @c role has been set. */
@property(nonatomic, readwrite) BOOL hasRole;

/** rtc sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSid;
/** Test to see if @c streamSid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSid;

/** rtm sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *rtmSid;
/** Test to see if @c rtmSid has been set. */
@property(nonatomic, readwrite) BOOL hasRtmSid;

/** apaas房间id，与rtc/rtm channelName相同 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomId;
/** Test to see if @c roomId has been set. */
@property(nonatomic, readwrite) BOOL hasRoomId;

/** 房间创建时间 */
@property(nonatomic, readwrite) int64_t roomCreateTs;

@property(nonatomic, readwrite) BOOL hasRoomCreateTs;
@end

#pragma mark - AgoraApaasUserReconnect

typedef GPB_ENUM(AgoraApaasUserReconnect_FieldNumber) {
  AgoraApaasUserReconnect_FieldNumber_Lts = 1,
  AgoraApaasUserReconnect_FieldNumber_Vid = 2,
  AgoraApaasUserReconnect_FieldNumber_Ver = 3,
  AgoraApaasUserReconnect_FieldNumber_Scenario = 4,
  AgoraApaasUserReconnect_FieldNumber_ErrorCode = 5,
  AgoraApaasUserReconnect_FieldNumber_Uid = 6,
  AgoraApaasUserReconnect_FieldNumber_UserName = 7,
  AgoraApaasUserReconnect_FieldNumber_StreamUid = 8,
  AgoraApaasUserReconnect_FieldNumber_StreamSuid = 9,
  AgoraApaasUserReconnect_FieldNumber_Role = 10,
  AgoraApaasUserReconnect_FieldNumber_StreamSid = 11,
  AgoraApaasUserReconnect_FieldNumber_RtmSid = 12,
  AgoraApaasUserReconnect_FieldNumber_RoomId = 13,
  AgoraApaasUserReconnect_FieldNumber_RoomCreateTs = 14,
};

GPB_FINAL @interface AgoraApaasUserReconnect : GPBMessage

/** 时间戳，必须存在 */
@property(nonatomic, readwrite) int64_t lts;

@property(nonatomic, readwrite) BOOL hasLts;
/** vid */
@property(nonatomic, readwrite) int32_t vid;

@property(nonatomic, readwrite) BOOL hasVid;
/** apaas版本号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *ver;
/** Test to see if @c ver has been set. */
@property(nonatomic, readwrite) BOOL hasVer;

/** apaas场景，如education/meeting/entertainment */
@property(nonatomic, readwrite, copy, null_resettable) NSString *scenario;
/** Test to see if @c scenario has been set. */
@property(nonatomic, readwrite) BOOL hasScenario;

/** 异常码，若有 */
@property(nonatomic, readwrite) int32_t errorCode;

@property(nonatomic, readwrite) BOOL hasErrorCode;
/** apaas用户id，同RTM uid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uid;
/** Test to see if @c uid has been set. */
@property(nonatomic, readwrite) BOOL hasUid;

/** 用户名，用于显示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *userName;
/** Test to see if @c userName has been set. */
@property(nonatomic, readwrite) BOOL hasUserName;

/** rtc流id */
@property(nonatomic, readwrite) int64_t streamUid;

@property(nonatomic, readwrite) BOOL hasStreamUid;
/** rtc流id */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSuid;
/** Test to see if @c streamSuid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSuid;

/** apaas角色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *role;
/** Test to see if @c role has been set. */
@property(nonatomic, readwrite) BOOL hasRole;

/** rtc sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *streamSid;
/** Test to see if @c streamSid has been set. */
@property(nonatomic, readwrite) BOOL hasStreamSid;

/** rtm sid */
@property(nonatomic, readwrite, copy, null_resettable) NSString *rtmSid;
/** Test to see if @c rtmSid has been set. */
@property(nonatomic, readwrite) BOOL hasRtmSid;

/** apaas房间id，与rtc/rtm channelName相同 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomId;
/** Test to see if @c roomId has been set. */
@property(nonatomic, readwrite) BOOL hasRoomId;

/** 房间创建时间 */
@property(nonatomic, readwrite) int64_t roomCreateTs;

@property(nonatomic, readwrite) BOOL hasRoomCreateTs;
@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
