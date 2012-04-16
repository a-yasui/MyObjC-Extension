//
//  NSRecursiveLock+NSRecursiveLock_block.m
//  objcextension
//
//  Created by Yasui At on 12/04/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSRecursiveLock+block.h"

@implementation NSRecursiveLock (NSRecursiveLock_block)
- (void) runLockBlock:(void(^)(void))block {
    while (YES) {
        if ([self tryLock]) {
            block();
            [self unlock];
            break;
        }
        else {
            [NSThread sleepForTimeInterval:0.01];
        }
    }
}

@end
