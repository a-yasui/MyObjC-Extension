//
//  NSDictionary+PropertyList.h
//  kisa
//
//  Created by 安井 惇 on 10/07/30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (PropertyList)

- (NSString*)xmlDescription;
+ (NSDictionary*) dictionaryWithXMLFile:(NSString*)path;
+ (NSDictionary*) dictionaryWithFile:(NSString*)path;

@end
