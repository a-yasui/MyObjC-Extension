//
//  NSString+Addition.m
//  kisa
//
//  Created by 安井 惇 on 10/04/07.
//  Copyright 2010 Design Egg Co.,LTD. All rights reserved.
//

#import "NSString+Addition.h"


@implementation NSString (NSStringAddition)
+ (NSString*) stringFromRandomWithLength:(NSInteger)length
{
    srandom([[NSDate date] timeIntervalSince1970]);
    NSMutableString* str = [[NSMutableString alloc] initWithCapacity:length];
    
    while ([str length] < length)
    {
        NSInteger rand = (NSInteger)(random()%0x7f);
        if ((0x30 <= rand && rand <= 0x39) || // 0-9
            (0x41 <= rand && rand <= 0x5a) || // A-Z
            (0x61 <= rand && rand <= 0x7a))   // a-z
        {
            [str appendFormat:@"%c", rand,nil];
        }
    }
    
    NSString* s = [NSString stringWithString:str];
    [str release];
    return s;
}

// see: http://sson.jp/blog/archives/201.html
+ (NSString*)strReplace:(NSString*)source replace:(NSString*)r to:(NSString*)t
{
	NSMutableString *str = [NSMutableString stringWithString:source];
	[ str replaceOccurrencesOfString:r
                          withString:t
                             options:0
                               range:NSMakeRange(0, [str length])
     ];
	return str;
}

// same as isEqualToString:
- (BOOL) equalToString:(NSString*)str
{
    if (NSOrderedSame == [self compare:str])
        return YES;
    return NO;
}

- (BOOL) isNoneLiteralEqualToString:(NSString*)str
{
    if (NSOrderedSame == [self compare:str
                               options:NSCaseInsensitiveSearch])
        return YES;
    return NO;
}


// randomUUIDを生成
+ (NSString*) stringWithRandomUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString *uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return [uuidString autorelease];
}

// 拡張子を消したファイル名を取得する
- (NSString*) lastNameComponent
{
    NSString* path = [self lastPathComponent];
    return [path stringByDeletingPathExtension];
}

// ファイル名を絶対パスにする
- (NSString*) abstructPathFromBundle:(NSBundle*)bundle
{
    NSString* _name = [self stringByDeletingPathExtension];
    NSString* _type = [self pathExtension];
    NSString* _lastp = [_name stringByDeletingLastPathComponent];
    NSString* _path = nil;
    
    if ([_lastp isEqualToString:@""])
    {
        _path = [bundle pathForResource:[_name lastPathComponent]
                                 ofType:_type];
    }
    else
    {
        _path = [bundle pathForResource:[_name lastPathComponent]
                                 ofType:_type
                            inDirectory:_lastp]; 
    }
    return _path;
}

- (NSString*) urlEncoding
{
    return (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
            (CFStringRef) self,NULL, NULL,kCFStringEncodingUTF8);
}

@end
