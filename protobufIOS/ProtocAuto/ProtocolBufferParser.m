//
//  ProtocolBufferParser.m


#import "ProtocolBufferParser.h"
#import "CommonProtoBufResult.pbobjc.h"
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import "GPBProtocolBuffers.h"

#define LOGIN_SUCCESS       101
#define LOGIN_FAILURE       102
#define REGISTER_SUCCESS    103
#define REGISTER_FAILURE    104
#define ALERT_COIN          333

static ProtocolBufferParser *shareProtocolBufferParser = nil;

@interface ProtocolBufferParser()

+ (NSDictionary*) parseCommonProtoBufResult:(NSData*)data;

@end


@implementation ProtocolBufferParser


+ (ProtocolBufferParser *)shareProtocolBufferParser {
    @synchronized(self) {
        if (shareProtocolBufferParser == nil) {
            shareProtocolBufferParser = [[self alloc] init];
        }
        return shareProtocolBufferParser;
    }
}


- (id)init{
    
    self = [super init];
    if (self) {
        // Initialization code.
		dic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc {

}


- (NSDictionary*) parseProtocolBuffer:(NSData*)data withURL:(NSString*)url
{
    if (nil == data || [data length] == 0 || nil == url || [url length] == 0) {
        return nil;
    }
    if (url) {
        NSDictionary *tmpDic = [ProtocolBufferParser parseCommonProtoBufResult:data];
        [dic removeAllObjects];
        [dic addEntriesFromDictionary: tmpDic];    
        return tmpDic;
    }
    else {
        return nil;
    }
}


+ (NSDictionary*) parseCommonProtoBufResult:(NSData*)data
{
    //rs *result = [rs parseFromData: data];
    rs *result;
    NSError *error;
    @try {
        result = [rs parseFromData:data error:&error];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        
    }
    
    NSMutableDictionary *rsDic = [NSMutableDictionary dictionaryWithCapacity: 0];
    
    //resultCode
    if (result.hasResultCode) {
        int resultCode = [result resultCode];
        [rsDic setObject:[NSString stringWithFormat:@"%d", resultCode] forKey: @"resultCode"];
    }
    
    //infoMap
    if (result.hasInfoMap) {
        Map *infoMapKeyValue = (Map*)[result infoMap];
        if (infoMapKeyValue.itemsArray_Count) {
            NSMutableDictionary *infoMapDic = [NSMutableDictionary dictionaryWithCapacity:0];
            
            for (int i = 0; i < infoMapKeyValue.itemsArray_Count; i++) {
                KeyValue *ky = (KeyValue*)[infoMapKeyValue.itemsArray objectAtIndex:i];
                if (nil != ky && nil != ky.value) {
                    [infoMapDic setObject:ky.value forKey: ky.key];
                }
            }
            [rsDic setObject: infoMapDic forKey: @"infoMap"];
        }
    }

    //resultList
    if (result.resultListArray_Count) {
        NSMutableArray *resultList = [result resultListArray];
        NSMutableArray *resultListAry = [NSMutableArray arrayWithCapacity:0];
        
        for (int i = 0; i < resultList.count; i++) {
            NSArray *kyAry = (NSArray*)[resultList objectAtIndex:i];
            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity:0];
            for (int i = 0; i < kyAry.count; i++) {
                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
                if (nil != ky && nil != ky.value) {
                    [resultListItemDic setObject:ky.value forKey: ky.key];
                }
            }
            [resultListAry addObject: resultListItemDic];
        }
        [rsDic setObject: resultListAry forKey: @"resultList"];
    }
    
    //optInfoMap
    if (result.hasOptInfoMap) {
        Map *optInfoMapKeyValue = (Map*)[result optInfoMap];
        if (optInfoMapKeyValue.itemsArray_Count > 0) {
            NSMutableDictionary *optInfoMapDic = [NSMutableDictionary dictionaryWithCapacity: 0];
            
            for (int i = 0; i < optInfoMapKeyValue.itemsArray_Count; i++) {
                KeyValue *ky = (KeyValue*)[optInfoMapKeyValue.itemsArray objectAtIndex: i];
                if (nil != ky && nil != ky.value) {
                    [optInfoMapDic setObject:ky.value forKey: ky.key];
                }
            }
            [rsDic setObject: optInfoMapDic forKey: @"optInfoMap"];
        }
    }
    


//        
//    //optResultList
//    PBArray *optResultList = [result optResultList];
//    if (optResultList.count > 0) {
//        NSMutableArray *optResultListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < optResultList.count; i++) {
//            OptMap *omap = (OptMap*)[optResultList objectAtIndex: i];
//            NSMutableDictionary *optResultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            NSMutableArray *values = [NSMutableArray arrayWithCapacity: 0];
//            for (int i = 0; i < omap.value.count; i++) {
//                Map *map = (Map*)[omap.value objectAtIndex: i];
//                PBArray *ary = [map items];
//                
//                NSMutableDictionary *optkyDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//                for (int i = 0; i < ary.count; i++) {
//                    KeyValue *ky = (KeyValue*)[ary objectAtIndex: i];
//                    if (nil != ky && nil != ky.value) {
//                        [optkyDic setObject:ky.value forKey: ky.key];
//                    }
//                }
//                [values addObject: optkyDic];
//            }
//            [optResultListItemDic setObject:values forKey: omap.key];
//            [optResultListAry addObject: optResultListItemDic];
//        }
//        [rsDic setObject: optResultListAry forKey: @"optResultList"];
//    }
//    
//    //extTwoRsList
//    PBArray *extTwoRsList = [result extTwoRsList];
//    if (extTwoRsList.count > 0) {
//        NSMutableArray *extTwoRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extTwoRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extTwoRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extTwoRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extTwoRsListAry forKey: @"extTwoRsList"];
//    }
//    
//    //extThrRsList
//    PBArray *extThrRsList = [result extThrRsList];
//    if (extThrRsList.count > 0) {
//        NSMutableArray *extThrRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extThrRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extThrRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extThrRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extThrRsListAry forKey: @"extThrRsList"];
//    }
//    //extFiveRsList
//    PBArray *extFiveRsList = [result extFiveRsList];
//    if (extFiveRsList.count > 0) {
//        NSMutableArray *extFiveRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extFiveRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extFiveRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extFiveRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extFiveRsListAry forKey: @"extFiveRsList"];
//    }
//    
//    //extSixRsList
//    PBArray *extSixRsList = [result extSixRsList];
//    if (extSixRsList.count > 0) {
//        NSMutableArray *extSixRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extSixRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extSixRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extSixRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extSixRsListAry forKey: @"extSixRsList"];
//    }
//    
//    //extSevenRsList
//    PBArray *extSevenRsList = [result extSevenRsList];
//    if (extSevenRsList.count > 0) {
//        NSMutableArray *extSevenRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extSevenRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extSevenRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extSevenRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extSevenRsListAry forKey: @"extSevenRsList"];
//    }
//    
//    //extEightRsList
//    PBArray *extEightRsList = [result extEightRsList];
//    if (extEightRsList.count > 0) {
//        NSMutableArray *extEightRsListAry = [NSMutableArray arrayWithCapacity: 0];
//        for (int i = 0; i < extEightRsList.count; i++) {
//            PBArray *kyAry = (PBArray*)[[extEightRsList objectAtIndex: i] items];
//            NSMutableDictionary *resultListItemDic = [NSMutableDictionary dictionaryWithCapacity: 0];
//            for (int i = 0; i < kyAry.count; i++) {
//                KeyValue *ky = (KeyValue*)[kyAry objectAtIndex: i];
//                if (nil != ky && nil != ky.value) {
//                    [resultListItemDic setObject:ky.value forKey: ky.key];
//                }
//            }
//            [extEightRsListAry addObject: resultListItemDic];
//        }
//        [rsDic setObject: extEightRsListAry forKey: @"extEightRsList"];
//    }
//    
    return rsDic;
}

@end
