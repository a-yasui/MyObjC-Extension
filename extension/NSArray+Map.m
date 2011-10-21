//
//  NSArray+Map.m
//  kisa
//
//  Created by 安井 惇 on 10/11/28.
//  Copyright 2010 a.yasui <a.yasui+github@gmail.com>. All rights reserved.
//

#import "NSArray+Map.h"


@implementation NSArray (Map)
- (NSArray*) map:(NSArrayMapBlock)mapblock
{
    NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:[self count]];
    NSArray* result = nil;
    
    for (NSObject* obj in self)
    {
        NSObject* fn = mapblock(obj);
        if (fn != nil)
            [arr addObject:fn];
    }
    
    result = [NSArray arrayWithArray:arr];
    [arr release];
    return result;
}

- (NSObject*) reduce:(NSArrayReduceBlock)reduceblock
{
    NSInteger i = 2;
    NSObject* red = nil;
    
    if ([self count] == 0)
        return nil;
    
    if ([self count] == 1)
        return [self objectAtIndex:0];
    
    red = reduceblock([self objectAtIndex:0], [self objectAtIndex:1]);
    for (i = 2; i < [self count]; i++)
    {
        red = reduceblock(red, [self objectAtIndex:i]);
    }
    return red;
}
@end
