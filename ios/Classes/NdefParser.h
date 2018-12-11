//
//  NdefParser.h
//  flutter_nfc
//
//  Created by Lee Higgitt on 11/12/2018.
//

#import <Foundation/Foundation.h>
#import "NdefResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface NdefParser : NSObject
+ (NdefResult *)getNdefUrnContent:(NSData *)data;
+ (NdefResult *)getNdefTextContent:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
