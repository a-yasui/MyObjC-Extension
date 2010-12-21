//
//  NSArray+Map.h
//  kisa
//
//  Created by 安井 惇 on 10/11/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSObject* (^NSArrayMapBlock)(NSObject*);
typedef NSObject* (^NSArrayReduceBlock)(NSObject*,NSObject*);

@interface NSArray (Map)
- (NSArray*) map:(NSArrayMapBlock)mapblock;
- (NSObject*) reduce:(NSArrayReduceBlock)reduceblock;
@end
