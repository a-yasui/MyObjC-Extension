//
//  NSString+Addition.h
//  kisa
//
//  Created by 安井 惇 on 10/04/07.
//  Copyright 2010 Design Egg Co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSStringAddition)

// 文字列置換
// [NSString strReplace:@"aabbcc" replace:@"cc" to:@"ccdd"];
//   => aabbccdd
+ (NSString*)strReplace:(NSString*)source replace:(NSString*)r to:(NSString*)t;

// 指定した長さのランダム文字列を生成する
// [NSString stringFromRandomWithLength:10];
//    => a4bd24gz3k
+ (NSString*)stringFromRandomWithLength:(NSInteger)length;

// randomUUIDを生成
+ (NSString*) stringWithRandomUUID;

// 厳密な比較をする
- (BOOL) equalToString:(NSString*)str;

// 大文字小文字を区別せずに比較
- (BOOL) isNoneLiteralEqualToString:(NSString*)str;

// ファイル名を絶対パスにする
// [@"icon.png" abstructPathFromBundle:[NSBundle mainBundle]]
//    => /var/.../~~.app/icon.png
- (NSString*) abstructPathFromBundle:(NSBundle*)bundle;

// 拡張子を消したファイル名を取得する
// [@"icon.png" lastNameComponent];
//    => icon
// [@"icon" lastNameComponent];
//    => icon
- (NSString*) lastNameComponent;

// URL Encode
- (NSString*) urlEncoding;
@end
