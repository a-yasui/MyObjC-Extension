
My Objective-C Extension
========================

���̃t���[�����[�N�ɂ́AObjective-C�ɂ͂Ȃ��@�\��Category���g�p���Ċg�������܂��B

�g�������Ă��� Object �Ɠ��e�ꗗ


NSArray
-------

- `- (NSArray*) map:(NSArrayMapBlock)mapblock;` Map �֐����g�p����iMac OS 10.6�ȏ�/iOS4.0�ȏ�j
- `- (NSObject*) reduce:(NSArrayReduceBlock)reduceblock;` Reduce �֐����g�p����iMac OS 10.6�ȏ�/iOS4.0�ȏ�j
- `- (id) getRandomObject;` �z��ɂ���C�ӂ̃I�u�W�F�N�g���A�����_���ɕԂ��܂��B

### Map Example

	#import <OExtension.h>
	#define N(n) [NSNumber numberWithInt:(n)]
	�c
	NSArray* arr = [NSArray arrayWithObject:N(1),N(2),N(3),nil];
	NSNumber* sum = [arr map:^(NSObject*a){
		NSObject* result = nil;
		result = [NSNumber numberWithInt:[(NSNumber*)obj intValue]+1];
		return obj;
	}];

### Reduce Example

	#import <OExtension.h>
	#define N(n) [NSNumber numberWithInt:(n)]
	�c
	NSArray* arr = [NSArray arrayWithObject:N(1),N(2),N(3),nil];
	NSNumber* sum = [arr reduce:^(NSObject*a, NSObject*b){
		NSObject* obj = (NSObject*)[NSNumber numberWithInt:
			[(NSNumber*)a intValue] + [(NSNumber*)b intValue]];
		return obj;
	}];

NSData
------

- `- (NSString*)md5HexString` �f�[�^��MD5�n�b�V���l��Ԃ��܂��B
- `- (NSString*)sha256HexString;` �f�[�^��SHA256�n�b�V���l��Ԃ��܂��B
- `- (NSString*)sha512HexString;` �f�[�^��SHA512�n�b�V���l��Ԃ��܂��B

NSDate
------

- `+(NSDate*)dateFromRFC1123:(NSString*)value_;` RFC1123�t�H�[�}�b�g�̓��t��NSDate�^�ɂ��܂��B
- `-(NSString*)rfc1123String;` NSDate�I�u�W�F�N�g��RFC1123�t�H�[�}�b�g��NSString�^�ɂ��܂��B

NSDictionary
------------

- `- (NSData*) dictionaryForQueryData;` HTTP��Query������ɕϊ����܂��B
- `- (NSString*)xmlDescription;` NSDictionary��plist��XML�ɂ��ĕԂ��܂��B
- `+ (NSDictionary*) dictionaryWithXMLFile:(NSString*)path;` plist�Ő��`����Ă���XML�t�@�C����ǂݍ��݁ANSDictionary�^�ɂ��܂��B
- `+ (NSDictionary*) dictionaryWithFile:(NSString*)path;` plist�Ȃ�����xml�t�@�C����ǂݍ��݂܂��B

NSString
--------

- `+ (NSString*)strReplace:(NSString*)source replace:(NSString*)r to:(NSString*)t;` �������u�����܂�
- `+ (NSString*)stringFromRandomWithLength:(NSInteger)length;` �w�肵�������̃����_��������𐶐����܂��B
- `+ (NSString*) stringWithRandomUUID;` UUID4 �̕�������쐬���܂��B
- `- (BOOL) equalToString:(NSString*)str;` ������������Ȕ�r�����܂��B
- `- (BOOL) isNoneLiteralEqualToString:(NSString*)str;` �啶������������ʂ����ɔ�r���܂��B
- `- (NSString*) abstructPathFromBundle:(NSBundle*)bundle;` �t�@�C���������΃p�X�����܂�
- `- (NSString*) lastNameComponent;` �g���q���������t�@�C�������擾���܂��B
- `- (NSString*) urlEncoding;` URL Encode �����܂��B



LICENSE
-------
BSD-style open source license

Copyright (c) 2010, a.yasui
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
- Neither the name nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

