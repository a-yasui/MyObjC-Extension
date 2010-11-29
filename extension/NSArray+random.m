//
//  NSArray+random.m
//  kisa
//
//  Created by 安井 惇 on 10/04/04.
//  Copyright 2010 Design Egg Co.,LTD. All rights reserved.
//

#import "NSArray+random.h"


@implementation NSArray (Random)
- (id) getRandomObject
{
    srandom([[NSDate date] timeIntervalSince1970]);
    
    NSInteger i = (NSInteger)(random() % [self count]);
    return [self objectAtIndex:i];
}
@end
