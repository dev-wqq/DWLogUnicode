//
//  NSObject+DWLogUnicode.m
//  DWUtilKit
//
//  Created by wangqiqi on 2017/3/31.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "NSObject+DWLogUnicode.h"
#import <objc/runtime.h>

@implementation NSObject (DWLogUnicode)

+ (NSString *)dw_stringByReplaceUnicode:(NSString *)string {
    // http://stackoverflow.com/questions/21436956/objc-ios-how-to-retrieve-unicode-hex-code-for-character
    NSMutableString *convertedString = [string mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

+ (BOOL)dw_swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector {
    // http://stackoverflow.com/questions/34542316/does-method-load-need-to-call-super-load
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!originalMethod || !swizzledMethod) {
        return NO;
    }
    
    BOOL didAddMethod = class_addMethod(self,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    return YES;
}

@end

@implementation NSArray (DWLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self dw_swizzleInstanceMethod:@selector(description) with:@selector(_dw_description)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_dw_descriptionWithLocale:)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_dw_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_dw_description {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_description]];
}

- (NSString *)_dw_descriptionWithLocale:(nullable id)locale {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale]];
}

- (NSString *)_dw_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale indent:level]];
}

#endif

@end

@implementation NSDictionary (DWLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self dw_swizzleInstanceMethod:@selector(description) with:@selector(_dw_description)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_dw_descriptionWithLocale:)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_dw_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_dw_description {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_description]];
}

- (NSString *)_dw_descriptionWithLocale:(nullable id)locale {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale]];
}

- (NSString *)_dw_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale indent:level]];
}

#endif

@end

@implementation NSSet (DWLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self dw_swizzleInstanceMethod:@selector(description) with:@selector(_dw_description)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_dw_descriptionWithLocale:)];
        [self dw_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_dw_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_dw_description {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_description]];
}

- (NSString *)_dw_descriptionWithLocale:(nullable id)locale {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale]];
}

- (NSString *)_dw_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject dw_stringByReplaceUnicode:[self _dw_descriptionWithLocale:locale indent:level]];
}

#endif

@end
