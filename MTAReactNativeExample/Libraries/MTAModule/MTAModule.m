#import "MTAModule.h"

#if __has_include(<React/RCTBridge.h>)
#import <React/RCTEventDispatcher.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

#elif __has_include("RCTBridge.h")
#import "RCTEventDispatcher.h"
#import "RCTRootView.h"
#import "RCTBridge.h"
#import "RCTLog.h"
#import "RCTConvert.h"
#elif __has_include("React/RCTBridge.h")
#import "React/RCTEventDispatcher.h"
#import "React/RCTRootView.h"
#import "React/RCTBridge.h"
#import "React/RCTLog.h"
#import "React/RCTConvert.h"
#endif

#import <UIKit/UIKit.h>


@implementation MTAModule

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(testmta)
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RN  MTA" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
  [alert show];
}

RCT_EXPORT_METHOD(startWithAppkey:(NSString *)appkey)
{
  [MTA startWithAppkey:appkey];
}

#pragma mark - 统计页面时长

RCT_EXPORT_METHOD(trackPageViewBegin:(NSString *)page appkey:(NSString *)appkey)
{
  if (appkey) {
    [MTA trackPageViewBegin:page appkey:appkey];
  } else {
    [MTA trackPageViewBegin:page];
  }
  
}


RCT_EXPORT_METHOD(trackPageViewEnd:(NSString *)page appkey:(NSString *)appkey isRealTime:(BOOL)isRealTime)
{
  if (appkey) {
    [MTA trackPageViewEnd:page appkey:appkey isRealTime:isRealTime];
  } else {
    [MTA trackPageViewEnd:page];
  }
  
}

#pragma mark - 错误统计

RCT_EXPORT_METHOD(trackError:(NSString *)error appkey:(NSString *)appkey isRealTime:(BOOL)isRealTime callback:(RCTResponseSenderBlock)callback)
{
  MTAErrorCode errorCode;
  if (appkey) {
    errorCode = [MTA trackError:error appkey:appkey isRealTime:isRealTime];
  } else {
    errorCode = [MTA trackError:error];
  }
  
  callback(@[@(errorCode)]);
  
}

#pragma mark - 自定义事件参数长度限制说明
RCT_EXPORT_METHOD(trackCustomKeyValueEvent:(NSString *)event_id props:(NSDictionary *)kvs callback:(RCTResponseSenderBlock)callback)
{
  MTAErrorCode errorCode = [MTA trackCustomKeyValueEvent:event_id props:kvs];
  callback(@[@(errorCode)]);
}

#pragma mark - session相关
RCT_EXPORT_METHOD(startNewSession)
{
  [MTA startNewSession];
}

RCT_EXPORT_METHOD(stopSession)
{
  [MTA stopSession];
}

#pragma mark - 使用时长

RCT_EXPORT_METHOD(trackActiveBegin)
{
  [MTA trackActiveBegin];
}

RCT_EXPORT_METHOD(trackActiveEnd)
{
  [MTA trackActiveEnd];
}



- (NSDictionary *)constantsToExport {
  return @{@"EC_OK":@(EC_OK),
           @"EC_SERVICE_DISABLE":@(EC_SERVICE_DISABLE),
           @"EC_ARGUMENT_INVALID":@(EC_ARGUMENT_INVALID),
           @"EC_INPUT_LENGTH_LIMIT":@(EC_INPUT_LENGTH_LIMIT)};
}

@end

@interface RCTConvert(ErrorCode)
@end

@implementation RCTConvert(ErrorCode)
RCT_ENUM_CONVERTER(MTAErrorCode, (@{@"EC_OK":@(EC_OK),
                                    @"EC_SERVICE_DISABLE":@(EC_SERVICE_DISABLE),
                                    @"EC_ARGUMENT_INVALID":@(EC_ARGUMENT_INVALID),
                                    @"EC_INPUT_LENGTH_LIMIT":@(EC_INPUT_LENGTH_LIMIT)
                                    }), EC_OK, integerValue)

@end
