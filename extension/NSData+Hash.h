//
//  NSData+MD5.h
//  kisa
//
//  Created by 安井 惇 on 10/05/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
// see, http://stackoverflow.com/questions/652300/using-md5-hash-on-a-string-in-cocoa
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSData (Hash)
- (NSString*)md5HexString;
- (NSString*)sha256HexString;
- (NSString*)sha512HexString;
@end
