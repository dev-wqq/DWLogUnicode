//
//  NSObject+DWLogUnicode.h
//  DWUtilKit
//
//  Created by wangqiqi on 2017/3/31.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DWLogUnicode)

+ (NSString *)dw_stringByReplaceUnicode:(NSString *)string;

+ (BOOL)dw_swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector;

@end

@interface NSArray (DWLogUnicode)

@end

@interface NSDictionary (DWLogUnicode)

@end

@interface NSSet (DWLogUnicode)

@end

