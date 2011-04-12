//
//  NSDate+RFC1123.m
//  kisa
//
//  Created by 安井 惇 on 10/06/23.
//  Copyright 2010,2011 __MyCompanyName__. All rights reserved.
//

#import "NSDate+RFC1123.h"

static NSDateFormatter* rfcFormatter = nil;

@implementation NSDate (RFC1123)

+(NSDate*)dateFromRFC1123:(NSString*)value_
{
    NSString* _v = [value_ copy];
    NSDate* result = nil;
    
    if(value_ == nil)
        goto result;
    
    if (rfcFormatter == nil)
    {
        rfcFormatter = [[NSDateFormatter alloc] init];
        rfcFormatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
    }
    
    NSArray* dates = [NSArray arrayWithObjects:@"EEE',' dd MMM yyyy HH':'mm':'ss z",
                      @"EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z",
                      @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ",
                      @"EEE MMM d HH':'mm':'ss yyyy",
                      nil];
    
    for (NSString* dataformat in dates)
    {
        rfcFormatter.dateFormat = dataformat;
        result = [rfcFormatter dateFromString:_v];
        if (result)
        {
            goto result;
        }
    }
    
result:
    [_v release], _v = nil;
    return result;
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
