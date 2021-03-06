//
//  NSArray+random.m
//  kisa
//
//  Created by 安井 惇 on 10/04/04.
//  Copyright 2010 a.yasui <a.yasui+github@gmail.com>. All rights reserved.
//

#import "NSArray+random.h"


@implementation NSArray (Random)
- (id) getRandomObject
{
    if ([self count] == 0) return nil;
    if ([self count] == 1) return [self objectAtIndex:0];
    
    srandom([[NSDate date] timeIntervalSince1970]);
    
    NSInteger i = (NSInteger)(random() % [self count]);
    return [self objectAtIndex:i];
}
@end
