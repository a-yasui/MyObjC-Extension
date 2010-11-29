//
//  NSArray+Map.m
//  kisa
//
//  Created by 安井 惇 on 10/11/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Map.h"


@implementation NSArray (Map)
- (NSArray*) map:(NSArrayMap)mapblock
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
@end
