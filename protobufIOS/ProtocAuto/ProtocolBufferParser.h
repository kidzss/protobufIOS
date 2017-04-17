//
//  ProtocolBufferParser.h

#import <Foundation/Foundation.h>

@interface ProtocolBufferParser : NSObject
{
    NSMutableDictionary *dic;
}

+ (ProtocolBufferParser *)shareProtocolBufferParser;

- (NSDictionary*) parseProtocolBuffer:(NSData*)data withURL:(NSString*)url; 

@end
