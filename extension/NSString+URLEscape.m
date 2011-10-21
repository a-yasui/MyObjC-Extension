//
//  NSString+URLEscape.m
//  kisa
//
//  Created by 安井 惇 on 10/12/08.
//  Copyright 2010 a.yasui <a.yasui+github@gmail.com>. All rights reserved.
//

#import "NSString+URLEscape.h"

@implementation NSString (URLEscape)
- (NSString*) urlEscape
{
    CFStringRef ref = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                              (CFStringRef)self,
                                                              NULL, NULL, kCFStringEncodingUTF8);
    return [(NSString*)ref autorelease];
}
@end
