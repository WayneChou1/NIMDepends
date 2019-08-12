//
//  TFJSON.h
//  TaoFang
//
//  Created by mxw on 15/11/26.
//  Copyright © 2015年 House365. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFJSON : NSObject

#pragma mark - JSON和NSString的相互转换

/**
 *  NSString转换为JSON
 *
 *  @param string NSString
 *
 *  @return NSString(JSON)
 */
+ (NSString *)jsonStringFromString:(NSString *)string;

/**
 *  JSON转换为NSString
 *
 *  @param string NSString
 *
 *  @return NSString
 */
+ (NSString *)stringFromJsonString:(NSString *)string;

#pragma mark - JSON和字典的相互转换
/**
 *  字典转换为JSON
 *
 *  @param dictionary 字典
 *
 *  @return NSString(JSON)
 */
+ (NSString *)jsonStringFromDictionary:(NSDictionary *)dictionary;

/**
 *  JSON转换为字典
 *
 *  @param string NSString
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryFromJsonString:(NSString *)string;

#pragma mark - JSON和NSArray的相互转换

/**
 *  数组转换为JSON
 *
 *  @param  array 数组
 *
 *  @return NSString(JSON)
 */
+ (NSString *)jsonStringFromArray:(NSArray *)array;

/**
 *  JSON转换为数组
 *
 *  @param string NSString
 *
 *  @return NSArray
 */
+ (NSArray *)arrayFromJsonString:(NSString *)string;
@end


@interface NSString (TFJSONDeserializing)
- (id)tfObjectFromJSONString;
- (id)tfMutableObjectFromJSONString;
@end

@interface NSData (TFJSONDeserializing)
- (id)tfObjectFromJSONData;
- (id)tfMutableObjectFromJSONData;
@end


@interface NSString (TFJSONSerializing)
- (NSData *)tfJSONData;
- (NSString *)tfJSONString;
@end

@interface NSArray (TFJSONSerializing)
- (NSData *)tfJSONData;
- (NSString *)tfJSONString;
@end

@interface NSDictionary (TFJSONSerializing)
- (NSData *)tfJSONData;
- (NSString *)tfJSONString;
@end
