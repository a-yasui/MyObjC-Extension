//
//  NSDate+RFC1123.m
//  kisa
//
//  Created by 安井 惇 on 10/06/23.
//  Copyright 2010,2011 a.yasui <a.yasui+github@gmail.com>. All rights reserved.
//

#import "NSDate+RFC1123.h"

static NSDateFormatter* rfcFormatter = nil;

@implementation NSDate (RFC1123)

+(NSDate*)dateFromRFC1123:(NSString*)value_
{
    NSDateFormatter* rfcFormatter = nil;
    NSString* _v = [[NSString alloc] initWithString:value_];
    NSDate* result = nil;
    
    if(value_ == nil)
        goto _result;
    
    if (rfcFormatter == nil)
    {
        NSLocale* locale = nil;
        locale  = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        
        rfcFormatter = [[NSDateFormatter alloc] init];
        rfcFormatter.locale = locale;
        [locale release], locale = nil;
    }
    
    NSArray* dates = [NSArray arrayWithObjects:
                      @"EEE',' dd MMM yyyy HH':'mm':'ss z",    // RFC1123
                      @"EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z", // RFC850
                      @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ",     // ISO8610
                      @"EEE MMM d HH':'mm':'ss yyyy",          // asctime
                      nil];
    
    for (NSString* dataformat in dates)
    {
        rfcFormatter.dateFormat = dataformat;
        result = [rfcFormatter dateFromString:_v];
        if (result)
        {
            goto _result;
        }
    }
    
_result:
    [rfcFormatter release], rfcFormatter = nil;
    [_v release], _v = nil;
    return result;
}

-(NSString*)rfc1123String
{
    NSDateFormatter* rfcFormatter = nil;
    NSString* result = nil;
    
    if (rfcFormatter == nil)
    {
        NSLocale* locale = nil;
        locale  = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        
        rfcFormatter = [[NSDateFormatter alloc] init];
        rfcFormatter.locale = locale;
        [locale release], locale = nil;
    }
    
    rfcFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    rfcFormatter.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    
    result = [rfcFormatter stringFromDate:self];
    
    [rfcFormatter release], rfcFormatter = nil;
    return result;
}
@end
