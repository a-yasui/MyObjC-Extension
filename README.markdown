
My Objective-C Extension
========================

このフレームワークには、Objective-Cにはない機能をCategoryを使用して拡張をします。

拡張をしている Object と内容一覧


NSArray
-------

- `- (NSArray*) map:(NSArrayMapBlock)mapblock;` Map 関数を使用する（Mac OS 10.6以上/iOS4.0以上）
- `- (NSObject*) reduce:(NSArrayReduceBlock)reduceblock;` Reduce 関数を使用する（Mac OS 10.6以上/iOS4.0以上）
- `- (id) getRandomObject;` 配列にある任意のオブジェクトを、ランダムに返します。

### Map Example

	#import <OExtension.h>
	#define N(n) [NSNumber numberWithInt:(n)]
	…
	NSArray* arr = [NSArray arrayWithObject:N(1),N(2),N(3),nil];
	NSNumber* sum = [arr map:^(NSObject*a){
		NSObject* result = nil;
		result = [NSNumber numberWithInt:[(NSNumber*)obj intValue]+1];
		return obj;
	}];

### Reduce Example

	#import <OExtension.h>
	#define N(n) [NSNumber numberWithInt:(n)]
	…
	NSArray* arr = [NSArray arrayWithObject:N(1),N(2),N(3),nil];
	NSNumber* sum = [arr reduce:^(NSObject*a, NSObject*b){
		NSObject* obj = (NSObject*)[NSNumber numberWithInt:
			[(NSNumber*)a intValue] + [(NSNumber*)b intValue]];
		return obj;
	}];

NSData
------

- `- (NSString*)md5HexString` データのMD5ハッシュ値を返します。
- `- (NSString*)sha256HexString;` データのSHA256ハッシュ値を返します。
- `- (NSString*)sha512HexString;` データのSHA512ハッシュ値を返します。

NSDate
------

- `+(NSDate*)dateFromRFC1123:(NSString*)value_;` RFC1123フォーマットの日付をNSDate型にします。
- `-(NSString*)rfc1123String;` NSDateオブジェクトをRFC1123フォーマットのNSString型にします。

NSDictionary
------------

- `- (NSData*) dictionaryForQueryData;` HTTPのQuery文字列に変換します。
- `- (NSString*)xmlDescription;` NSDictionaryをplistのXMLにして返します。
- `+ (NSDictionary*) dictionaryWithXMLFile:(NSString*)path;` plistで整形されているXMLファイルを読み込み、NSDictionary型にします。
- `+ (NSDictionary*) dictionaryWithFile:(NSString*)path;` plistないしはxmlファイルを読み込みます。

NSString
--------

- `+ (NSString*)strReplace:(NSString*)source replace:(NSString*)r to:(NSString*)t;` 文字列を置換します
- `+ (NSString*)stringFromRandomWithLength:(NSInteger)length;` 指定した長さのランダム文字列を生成します。
- `+ (NSString*) stringWithRandomUUID;` UUID4 の文字列を作成します。
- `- (BOOL) equalToString:(NSString*)str;` 文字列を厳密な比較をします。
- `- (BOOL) isNoneLiteralEqualToString:(NSString*)str;` 大文字小文字を区別せずに比較します。
- `- (NSString*) abstructPathFromBundle:(NSBundle*)bundle;` ファイル名から絶対パスを作ります
- `- (NSString*) lastNameComponent;` 拡張子を消したファイル名を取得します。
- `- (NSString*) urlEncoding;` URL Encode をします。



LICENSE
-------
BSD-style open source license

Copyright (c) 2010,2011 a.yasui <a.yasui+github@gmail.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
- Neither the name nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

