//
//  NSDate+RFC1123.m
//  kisa
//
//  Created by 安井 惇 on 10/06/23.
//  Copyright 2010 Design Egg Co.,LTD. All rights reserved.
//

#import "NSDate+RFC1123.h"

@implementation NSDate (RFC1123)

+(NSDate*)dateFromRFC1123:(NSString*)value_
{
    if(value_ == nil)
        return nil;
    static NSDateFormatter *rfc1123 = nil;
    if(rfc1123 == nil)
    {
        rfc1123 = [[NSDateFormatter alloc] init];
        rfc1123.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
        rfc1123.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        rfc1123.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss z";
    }
    NSDate *ret = [rfc1123 dateFromString:value_];
    if(ret != nil)
        return ret;
    
    static NSDateFormatter *rfc850 = nil;
    if(rfc850 == nil)
    {
        rfc850 = [[NSDateFormatter alloc] init];
        rfc850.locale = rfc1123.locale;
        rfc850.timeZone = rfc1123.timeZone;
        rfc850.dateFormat = @"EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z";
    }
    ret = [rfc850 dateFromString:value_];
    if(ret != nil)
        return ret;
    
    static NSDateFormatter *iso8610 = nil;
    if (iso8610 == nil)
    {
        iso8610 = [[NSDateFormatter alloc] init];
        iso8610.locale = rfc1123.locale;
        iso8610.timeZone = rfc1123.timeZone;
        iso8610.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ";
    }
    ret = [iso8610 dateFromString:value_];
    if (ret != nil)
        return ret;
    
    static NSDateFormatter *asctime = nil;
    if(asctime == nil)
    {
        asctime = [[NSDateFormatter alloc] init];
        asctime.locale = rfc1123.locale;
        asctime.timeZone = rfc1123.timeZone;
        asctime.dateFormat = @"EEE MMM d HH':'mm':'ss yyyy";
    }
    return [asctime dateFromString:value_];
}

-(NSString*)rfc1123String
{
    static NSDateFormatter *df = nil;
    if(df == nil)
    {
        df = [[NSDateFormatter alloc] init];
        df.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
        df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        df.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    }
    return [df stringFromDate:self];
}
@end
