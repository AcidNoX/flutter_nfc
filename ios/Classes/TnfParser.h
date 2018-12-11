//
//  TnfParser.h
//  flutter_nfc
//
//  Created by Lee Higgitt on 11/12/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TnfParser : NSObject
+ (NSString *)getType:(NSData *)NDEFData;
@end

NS_ASSUME_NONNULL_END
