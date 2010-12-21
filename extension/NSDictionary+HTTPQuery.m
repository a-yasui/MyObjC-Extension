//
//  NSDictionary+HTTPQuery.m
//  kisa
//
//  Created by 安井 惇 on 10/04/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+HTTPQuery.h"


@implementation NSDictionary (HTTPQuery)
- (NSData*) dictionaryForQueryData
{
    NSMutableArray *arr = [NSMutableArray new];
    
    
    for (NSString* key in self)
    {
        [arr addObject:[NSString stringWithFormat:@"%@=%@",
                        key, [self objectForKey:key], nil]];
    }
    
    NSData* data = [[NSData alloc] initWithData:
                    [[arr componentsJoinedByString:@"&"]
                     dataUsingEncoding:NSASCIIStringEncoding]];
    [arr release];
    return [data autorelease];
}
@end
