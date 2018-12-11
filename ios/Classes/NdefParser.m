//
//  NdefParser.m
//  flutter_nfc
//
//  Created by Lee Higgitt on 11/12/2018.
//

#import "NdefParser.h"
#import "TnfParser.h"
#import "NdefResult.h"

@implementation NdefParser

+ (NdefResult *)getNdefUrnContent:(NSData *)data {
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [[NdefResult alloc]initWithData:[dataString substringFromIndex:1] andScheme:[TnfParser getType:data]];
}

+ (NdefResult *)getNdefTextContent:(NSData *)data {
    NSUInteger length = [data length];
    Byte *bytes = (Byte*)malloc(length);
    memcpy(bytes, [data bytes], length);
    
    NSInteger langLength = bytes[0] & 0x03F;
    NSInteger textLength = length - 1 - langLength;
    
    NSString *lang = [[NSString alloc] initWithBytes:bytes + 1 length:langLength encoding:NSASCIIStringEncoding];
    NSString *text = [[NSString alloc] initWithBytes:bytes + 1 + langLength length:textLength encoding:NSUTF8StringEncoding];
    
    return [[NdefResult alloc] initWithData:text andLanguage:lang];
}

+ (NSString *)getType:(NSData *)NDEFData {
    return [TnfParser getType:NDEFData];
}

@end
