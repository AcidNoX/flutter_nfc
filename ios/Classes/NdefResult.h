//
//  NdefResult.h
//  flutter_nfc
//
//  Created by Lee Higgitt on 11/12/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NdefResult : NSObject
@property (assign, nonatomic) NSString *data;
@property (assign, nonatomic) NSString *scheme;
@property (assign, nonatomic) NSString *language;

-(id) initWithData:(NSString *)data andScheme:(NSString *)scheme;
-(id) initWithData:(NSString *)data andLanguage:(NSString *)language;
-(NSString *) toString;
@end

NS_ASSUME_NONNULL_END
