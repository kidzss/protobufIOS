// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: CommonProtoBufResult.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "CommonProtoBufResult.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - CommonProtoBufResultRoot

@implementation CommonProtoBufResultRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - CommonProtoBufResultRoot_FileDescriptor

static GPBFileDescriptor *CommonProtoBufResultRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto2];
  }
  return descriptor;
}

#pragma mark - KeyValue

@implementation KeyValue

@dynamic hasKey, key;
@dynamic hasValue, value;

typedef struct KeyValue__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  NSString *value;
} KeyValue__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = KeyValue_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(KeyValue__storage_, key),
        .flags = GPBFieldRequired,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = KeyValue_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(KeyValue__storage_, value),
        .flags = GPBFieldRequired,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[KeyValue class]
                                     rootClass:[CommonProtoBufResultRoot class]
                                          file:CommonProtoBufResultRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(KeyValue__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - Map

@implementation Map

@dynamic itemsArray, itemsArray_Count;

typedef struct Map__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *itemsArray;
} Map__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "itemsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(KeyValue),
        .number = Map_FieldNumber_ItemsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Map__storage_, itemsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Map class]
                                     rootClass:[CommonProtoBufResultRoot class]
                                          file:CommonProtoBufResultRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Map__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - OptMap

@implementation OptMap

@dynamic hasKey, key;
@dynamic valueArray, valueArray_Count;

typedef struct OptMap__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  NSMutableArray *valueArray;
} OptMap__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = OptMap_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(OptMap__storage_, key),
        .flags = GPBFieldRequired,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "valueArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = OptMap_FieldNumber_ValueArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(OptMap__storage_, valueArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[OptMap class]
                                     rootClass:[CommonProtoBufResultRoot class]
                                          file:CommonProtoBufResultRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(OptMap__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - onlyMap

@implementation onlyMap

@dynamic onlyYylistArray, onlyYylistArray_Count;

typedef struct onlyMap__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *onlyYylistArray;
} onlyMap__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "onlyYylistArray",
        .dataTypeSpecific.className = GPBStringifySymbol(OptMap),
        .number = onlyMap_FieldNumber_OnlyYylistArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(onlyMap__storage_, onlyYylistArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[onlyMap class]
                                     rootClass:[CommonProtoBufResultRoot class]
                                          file:CommonProtoBufResultRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(onlyMap__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\000onlyYYList\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - rs

@implementation rs

@dynamic hasInfoMap, infoMap;
@dynamic resultListArray, resultListArray_Count;
@dynamic hasOptInfoMap, optInfoMap;
@dynamic optResultListArray, optResultListArray_Count;
@dynamic hasResultCode, resultCode;
@dynamic extTwoRsListArray, extTwoRsListArray_Count;
@dynamic extThrRsListArray, extThrRsListArray_Count;
@dynamic extForRsListArray, extForRsListArray_Count;
@dynamic extFiveRsListArray, extFiveRsListArray_Count;
@dynamic extSixRsListArray, extSixRsListArray_Count;
@dynamic extSevenRsListArray, extSevenRsListArray_Count;
@dynamic extEightRsListArray, extEightRsListArray_Count;

typedef struct rs__storage_ {
  uint32_t _has_storage_[1];
  int32_t resultCode;
  Map *infoMap;
  NSMutableArray *resultListArray;
  Map *optInfoMap;
  NSMutableArray *optResultListArray;
  NSMutableArray *extTwoRsListArray;
  NSMutableArray *extThrRsListArray;
  NSMutableArray *extForRsListArray;
  NSMutableArray *extFiveRsListArray;
  NSMutableArray *extSixRsListArray;
  NSMutableArray *extSevenRsListArray;
  NSMutableArray *extEightRsListArray;
} rs__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "infoMap",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_InfoMap,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(rs__storage_, infoMap),
        .flags = (GPBFieldFlags)(GPBFieldRequired | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "resultListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ResultListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, resultListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "optInfoMap",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_OptInfoMap,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(rs__storage_, optInfoMap),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "optResultListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(OptMap),
        .number = rs_FieldNumber_OptResultListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, optResultListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "resultCode",
        .dataTypeSpecific.className = NULL,
        .number = rs_FieldNumber_ResultCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(rs__storage_, resultCode),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasDefaultValue | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "extTwoRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtTwoRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extTwoRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extThrRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtThrRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extThrRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extForRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(onlyMap),
        .number = rs_FieldNumber_ExtForRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extForRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extFiveRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtFiveRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extFiveRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extSixRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtSixRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extSixRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extSevenRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtSevenRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extSevenRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "extEightRsListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Map),
        .number = rs_FieldNumber_ExtEightRsListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(rs__storage_, extEightRsListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[rs class]
                                     rootClass:[CommonProtoBufResultRoot class]
                                          file:CommonProtoBufResultRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(rs__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\014\001\007\000\002\000resultList\000\003\n\000\004\000optResultList\000\005\n\000\006"
        "\000extTwoRsList\000\007\000extThrRsList\000\010\000extForRsL"
        "ist\000\t\000extFiveRsList\000\n\000extSixRsList\000\013\000ext"
        "SevenRsList\000\014\000extEightRsList\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
