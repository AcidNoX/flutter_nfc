//
//  NdefResult.m
//  flutter_nfc
//
//  Created by Lee Higgitt on 11/12/2018.
//

#import "NdefResult.h"

@implementation NdefResult

- (id)initWithData:(NSString *)data andScheme:(nonnull NSString *)scheme {
    self = [super init];
    if(self) {
        self.data = data;
        self.scheme = scheme;
    }
    return self;
}

- (id)initWithData:(NSString *)data andLanguage:(NSString *)language {
    self = [super init];
    if(self) {
        self.data = data;
        self.language = language;
    }
    return self;
}

- (NSString *)toString {
    return [NSString stringWithFormat:@"{\"data\":\"%@\", \"scheme\":%@, \"language\":%@ }",
            self.data,
            self.scheme == NULL ? @"null" : [NSString stringWithFormat:@"\"%@\"", self.scheme],
            self.language == NULL ? @"null" : [NSString stringWithFormat:@"\"%@\"", self.language]];
}

@end
