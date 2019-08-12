//
//  TFJSON.h
//  TaoFang
//
//  Created by mxw on 15/11/26.
//  Copyright © 2015年 House365. All rights reserved.
//

#import "TFJSON.h"

@implementation TFJSON
+ (id)objectFromJSONString:(NSString*)string {
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    return [self objectFromJSONData:data];
}

+ (id)mutableObjectFromJSONString:(NSString*)string {
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    return [self mutableObjectFromJSONData:data];
}

+ (id)objectFromJSONData:(NSData*)data {
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

+ (id)mutableObjectFromJSONData:(NSData*)data {
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSString*)stringWithObject:(id)object {
    NSString *string=nil;
    NSData *data=[self dataWithObject:object];
    if (data) {
        string=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return string;
}
+ (NSData*)dataWithObject:(id)object {
    NSData *data=nil;
    if ([NSJSONSerialization isValidJSONObject:object]) {
        data=[NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        NSLog(@"--->>object %@ not a json object",object);
    }
    return data;
}

#pragma mark - JSON和NSString的相互转换

+ (NSString *)jsonStringFromString:(NSString *)string {
     NSString *jsonString = [string tfJSONString];
    return jsonString;
}

+ (NSString *)stringFromJsonString:(NSString *)string {
    NSString *tfstring = [string tfObjectFromJSONString];
    return tfstring;
}

#pragma mark - JSON和字典的相互转换

+ (NSString *)jsonStringFromDictionary:(NSDictionary *)dictionary {
    NSString *jsonString = [dictionary tfJSONString];
    return jsonString;
}

+ (NSDictionary *)dictionaryFromJsonString:(NSString *)string {
    NSDictionary *metaParams = [string tfObjectFromJSONString];
    return metaParams;
}

#pragma mark - JSON和NSArray的相互转换

+ (NSString *)jsonStringFromArray:(NSArray *)array {
    NSString *jsonString = [array tfJSONString];
    return jsonString;
}

+ (NSArray *)arrayFromJsonString:(NSString *)string {
    NSArray *array = [string tfObjectFromJSONString];
    return array;
}

@end


@implementation NSString (TFJSONDeserializing)
- (id)tfObjectFromJSONString {
    return [TFJSON objectFromJSONString:self];
}

- (id)tfMutableObjectFromJSONString {
    return [TFJSON mutableObjectFromJSONString:self];
}
@end

@implementation NSData (TFJSONDeserializing)
- (id)tfObjectFromJSONData {
    return [TFJSON objectFromJSONData:self];
}

- (id)tfMutableObjectFromJSONData {
    return [TFJSON mutableObjectFromJSONData:self];
}
@end


@implementation NSString (TFJSONSerializing)
- (NSData *)tfJSONData {
    return [TFJSON dataWithObject:self];
}
- (NSString *)tfJSONString {
    return [TFJSON stringWithObject:self];
}
@end

@implementation NSArray (TFJSONSerializing)
- (NSData *)tfJSONData {
    return [TFJSON dataWithObject:self];
}
- (NSString *)tfJSONString {
    return [TFJSON stringWithObject:self];
}
@end

@implementation NSDictionary (TFJSONSerializing)
- (NSData *)tfJSONData {
    return [TFJSON dataWithObject:self];
}
- (NSString *)tfJSONString {
    return [TFJSON stringWithObject:self];
}
@end

