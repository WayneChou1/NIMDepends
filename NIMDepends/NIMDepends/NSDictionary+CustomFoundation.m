//
//  NSDictionary+CustomFoundation.m
//  TaoFang
//
//  Created by mxw on 16/6/20.
//  Copyright © 2016年 House365. All rights reserved.
//

#import "NSDictionary+CustomFoundation.h"

@implementation NSDictionary (CustomFoundation)

- (NSString *)stringValueForKey:(NSString *)key {
    NSString *string = nil;
    id obj=[self objectForKey:key];
//    NSLog(@"obj类型-------%@", NSStringFromClass([obj class])); 
    if (obj) {
        if([obj isKindOfClass:[NSString class]]) {
            string = obj;
        }else if ([obj isKindOfClass:[NSNumber class]]) {
            string = [NSString stringWithFormat:@"%@", obj];
        }
    }
    return string;
}
@end
