//
//  OEUnittest.m
//  objcextension
//
//  Created by 安井 惇 on 10/12/21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OEUnittest.h"
#import "NSArray+Map.h"
#import "NSArray+random.h"
#import "NSData+Hash.h"
#import "NSDate+RFC1123.h"
#import "NSDictionary+HTTPQuery.h"
#import "NSDictionary+PropertyList.h"
#import "NSString+Addition.h"

#define N(n) [NSNumber numberWithInt:(n)]

@implementation OEUnittest

- (void) testNsArrayMap
{
    NSArray *arrtest1, *arrtest1result, *arrtest1ptr;
    NSArray *arrtest2, *arrtest2result, *arrtest2ptr;
    NSArray *arrtest3, *arrtest3result, *arrtest3ptr;
    
    arrtest1       = [NSArray arrayWithObjects:N(1),N(2),N(3),N(4),nil];
    arrtest1result = [NSArray arrayWithObjects:N(2),N(3),N(4),N(5),nil];
    arrtest1ptr    = [arrtest1 map:^(NSObject*obj)
    {
        NSObject* result = nil;
        if ([obj isKindOfClass:[NSNumber class]])
            result = [NSNumber numberWithInt:[(NSNumber*)obj intValue]+1];
        return result;
    }];
    STAssertEqualObjects(arrtest1ptr, arrtest1result,
                         @"Not equal to map");
    
    arrtest2 =       [NSArray arrayWithObjects:N(1),N(2),N(3),N(4),nil];
    arrtest2result = [NSArray arrayWithObjects:N(2),N(3),N(5),nil];
    arrtest2ptr    = [arrtest2 map:^(NSObject*obj)
    {
        NSObject* result = nil;
        if ([obj isKindOfClass:[NSNumber class]])
        {
            result = ([obj isEqual:N(3)]) ? nil :\
                [NSNumber numberWithInt:[(NSNumber*)obj intValue]+1];
        }
        return result;
    }];
    STAssertEqualObjects(arrtest2ptr, arrtest2result,
                         @"Not nil leave out map function.");
    
    arrtest3       = [NSArray arrayWithObjects:nil];
    arrtest3result = [NSArray arrayWithObjects:nil];
    arrtest3ptr    = [arrtest3 map:^(NSObject*obj)
    {
        NSObject* result = nil;
        if ([obj isKindOfClass:[NSNumber class]])
            result = [NSNumber numberWithInt:[(NSNumber*)obj intValue]+1];
        return result;
    
    }];
    
    STAssertEqualObjects(arrtest3ptr, arrtest3result,
                         @"Not equal to zero array map function.");
    
}

- (void) testNsArrayReduce
{
    NSArray *arrtest1;
    NSArray *arrtest2;
    NSArray *arrtest3;
    NSArray *arrtest4;
    NSNumber *arrtest1result, *arrtest2result, *arrtest3result;
    NSArrayReduceBlock sum = ^(NSObject* a, NSObject* b)
    {
        NSObject* obj = (NSObject*)[NSNumber numberWithInt:
                           [(NSNumber*)a intValue] + [(NSNumber*)b intValue]];
        return obj;
    };
    
    arrtest1 = [NSArray arrayWithObjects:N(1),N(2),N(3),N(4),nil];
    arrtest1result = [arrtest1 reduce:sum];
    STAssertEqualObjects(arrtest1result, N(10), @"Not equalt to sum(1,2,3,4)");
    
    arrtest2 = [NSArray arrayWithObjects:N(1),N(2), nil];
    arrtest2result = [arrtest2 reduce:sum];
    STAssertEqualObjects(arrtest2result, N(3), @"Not equalt to sum(1,2)");
    
    arrtest3 = [NSArray arrayWithObjects:N(1), nil];
    arrtest3result = [arrtest3 reduce:sum];
    STAssertEqualObjects(arrtest3result, N(1), @"Not equalt to sum(1,2)");
    
    arrtest4 = [NSArray array];
    STAssertEqualObjects([arrtest4 reduce:sum],nil, @"nil check");
}


- (void) testNsDataHash
{
    NSString* s = @"test";
    NSData* data = nil;
    
    data = [NSData dataWithBytes:[s cStringUsingEncoding:NSUTF8StringEncoding]
                          length:[s length]];
    STAssertEqualObjects([data md5HexString],
                         [@"098f6bcd4621d373cade4e832627b4f6" uppercaseString],
                         @"Not match to md5");
    
    STAssertEqualObjects([data sha256HexString],
                         [@"9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd1"\
                          @"5d6c15b0f00a08" uppercaseString],
                         @"Not match to md5");
    
    STAssertEqualObjects([data sha512HexString],
                         [@"ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8"\
                          @"819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b1437"\
                          @"32c304cc5fa9ad8e6f57f50028a8ff" uppercaseString],
                         @"Not match to md5");
}


- (void) testNsDataRFC1123
{

}


- (void) testNsStringURLEscapes
{
}

@end
