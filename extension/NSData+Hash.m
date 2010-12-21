//
//  NSData+MD5.m
//  kisa
//
//  Created by 安井 惇 on 10/05/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSData+Hash.h"

static NSString*
hexFromUnsigedChar (unsigned char* ptr, NSUInteger ptrLength)
{
    NSMutableString* hexStr = [[NSMutableString alloc] init];
    NSString* str = @"";

    for (NSUInteger i = 0; i < ptrLength; i++)
    {
        unsigned int hex = (unsigned int)ptr[i];
        [hexStr appendFormat:@"%02X", hex];
    }
#ifdef DEBUG
    NSLog(@"%s hexString:%@", __FUNCTION__, hexStr);
#endif
    str = [NSString stringWithString:hexStr];
    [hexStr release];
    return str;
}

@implementation NSData (Hash)
- (NSString*)md5HexString
{
    unsigned char mdpointer[CC_MD5_DIGEST_LENGTH];
    
    (void)CC_MD5([self bytes], [self length], mdpointer);
    
    return hexFromUnsigedChar(mdpointer, CC_MD5_DIGEST_LENGTH);
}

- (NSString*)sha256HexString
{
    unsigned char mdpointer[CC_SHA256_DIGEST_LENGTH];
    (void)CC_SHA256([self bytes], [self length], mdpointer);
    return hexFromUnsigedChar(mdpointer, CC_SHA256_DIGEST_LENGTH);
}

- (NSString*)sha512HexString
{
    unsigned char mdpointer[CC_SHA512_DIGEST_LENGTH];
    (void)CC_SHA512([self bytes], [self length], mdpointer);
    return hexFromUnsigedChar(mdpointer, CC_SHA512_DIGEST_LENGTH);
}

@end
