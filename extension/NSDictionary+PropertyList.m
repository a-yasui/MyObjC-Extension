//
//  NSDictionary+PropertyList.m
//  kisa
//
//  Created by 安井 惇 on 10/07/30.
//  Copyright 2010 a.yasui <a.yasui+github@gmail.com>. All rights reserved.
//
// ex: http://homepage.mac.com/mkino2/cocoaProg/Foundation/NSDictionary/NSDictionary.html
//

#import "NSDictionary+PropertyList.h"


@implementation NSDictionary (PropertyList)

- (NSString*)xmlDescription
{
    NSData*	xmlData;
    
    xmlData = (NSData*)CFPropertyListCreateXMLData(kCFAllocatorSystemDefault, 
                                                   (CFPropertyListRef)self);
    
    return [[[NSString alloc] 
             initWithData:xmlData 
                 encoding:NSUTF8StringEncoding] autorelease];
}

+ (NSDictionary*) dictionaryWithXMLFile:(NSString*)path
{
    CFPropertyListRef ref = NULL;
    NSString* errorString = nil;
    NSData* data = nil;
    
    data = [[NSData alloc] initWithContentsOfFile:path];
    ref = CFPropertyListCreateFromXMLData(NULL, (CFDataRef)data,
                    kCFPropertyListMutableContainersAndLeaves,
                    (CFStringRef*)(&(errorString)));
    [data release];
    
    if (ref == NULL)
    {
        NSLog(@"%s Error: %@", __FUNCTION__, errorString);
        NSLog(@"%@", [NSString stringWithUTF8String:[data bytes]]);
        return nil;
    }
    
    return (NSDictionary*)ref;
}

+ (NSDictionary*) dictionaryWithFile:(NSString*)path
{
    NSString* ext = [path pathExtension];
    NSDictionary* dict = nil;
    
    if ([ext isEqualToString:@"plist"])
    {
        dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        [dict autorelease];
    }
    else if ([ext isEqualToString:@"xml"])
    {
        dict = [NSDictionary dictionaryWithXMLFile:path];
    }
    else
    {
        NSLog(@"Unknown format: %@", path);
    }
    
    return dict;
}
@end
