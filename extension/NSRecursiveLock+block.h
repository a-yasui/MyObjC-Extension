//
//  NSRecursiveLock+NSRecursiveLock_block.h
//  objcextension
//
//  Created by Yasui At on 12/04/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRecursiveLock (NSRecursiveLock_block)
- (void) runLockBlock:(void(^)(void))block;
@end
