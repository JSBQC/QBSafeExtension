//
//  NSURL+Extension.m
//  test
//
//  Created by QB on 2020/9/23.
//

#import "NSURL+Extension.h"
#import "NSObject+QBExchangeImp.h"

@implementation NSURL (Extension)
+ (void)load
{
    [NSObject exchangeIMP_InstanceSelectorA:@selector(initFileURLWithPath:) InstanceSelectorB:@selector(swizzing_initFileURLWithPath:)];
    [NSObject exchangeIMP_InstanceSelectorA:@selector(initFileURLWithPath:isDirectory:) InstanceSelectorB:@selector(swizzing_initFileURLWithPath:isDirectory:)];
    [NSObject exchangeIMP_ClassSelectorA: @selector(fileURLWithPath:) ClassSelectorB:@selector(swizzing_fileURLWithPath:)];
    [NSObject exchangeIMP_ClassSelectorA: @selector(fileURLWithPath:isDirectory:) ClassSelectorB:@selector(swizzing_fileURLWithPath:isDirectory:)];
}


- (instancetype)swizzing_initFileURLWithPath:(NSString *)path
{
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_initFileURLWithPath:@""];
    }
    return [self swizzing_initFileURLWithPath:path];
}

- (instancetype)swizzing_initFileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir
{
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_initFileURLWithPath:@"" isDirectory:isDir];
    }
    return [self swizzing_initFileURLWithPath:path isDirectory:isDir];
}


+ (NSURL *)swizzing_fileURLWithPath:(NSString *)path
{
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_fileURLWithPath:@""];
    }
    return [self swizzing_fileURLWithPath:path];
}

+ (NSURL *)swizzing_fileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir
{
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_fileURLWithPath:@"" isDirectory:isDir];
    }
    return [self swizzing_fileURLWithPath:path isDirectory:isDir];
}



@end
