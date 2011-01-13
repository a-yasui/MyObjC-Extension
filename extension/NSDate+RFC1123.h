//
//  NSDate+RFC1123.h
//  kisa
//
//  Created by 安井 惇 on 10/06/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
// see: http://blog.mro.name/2009/08/nsdateformatter-http-header/
//

#import <Foundation/Foundation.h>


/** Category on NSDate to support rfc1123 formatted date strings.
 http://blog.mro.name/2009/08/nsdateformatter-http-header/ and
 http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
 */
@interface NSDate (RFC1123)

/**
 Convert a RFC1123 'Full-Date' string
 (http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1)
 into NSDate.
 */
+(NSDate*)dateFromRFC1123:(NSString*)value_;

/**
 Convert NSDate into a RFC1123 'Full-Date' string
 (http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1).
 */
-(NSString*)rfc1123String;

@end

