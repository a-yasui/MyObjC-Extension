//
//  NSArray+Map.h
//  kisa
//
//  Created by 安井 惇 on 10/11/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSObject* (^NSArrayMap)(NSObject*);
@interface NSArray (Map)
- (NSArray*) map:(NSArrayMap)mapblock;
@end
