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
    [self exchangeIMP_ClassSelectorA: @selector(fileURLWithPath:) ClassSelectorB:@selector(swizzing_fileURLWithPath:)];
    [self exchangeIMP_InstanceSelectorA:@selector(initFileURLWithPath:isDirectory:) InstanceSelectorB:@selector(swizzing_initFileURLWithPath:isDirectory:)];
    [self exchangeIMP_ClassSelectorA: @selector(fileURLWithPath:isDirectory:) ClassSelectorB:@selector(swizzing_fileURLWithPath:isDirectory:)];
    [self exchangeIMP_InstanceSelectorA:@selector(initFileURLWithPath:) InstanceSelectorB:@selector(swizzing_initFileURLWithPath:)];
}


- (instancetype)swizzing_initFileURLWithPath:(NSString *)path
{
#ifdef DEBUG
    return [self swizzing_initFileURLWithPath:path];
#else
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_initFileURLWithPath:@""];
    }
    return [self swizzing_initFileURLWithPath:path];
#endif
}

- (instancetype)swizzing_initFileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir
{
#ifdef DEBUG
    return [self swizzing_initFileURLWithPath:path isDirectory:isDir];
#else
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_initFileURLWithPath:@"" isDirectory:isDir];
    }
    return [self swizzing_initFileURLWithPath:path isDirectory:isDir];
#endif
}


+ (NSURL *)swizzing_fileURLWithPath:(NSString *)path
{
#ifdef DEBUG
    return [self swizzing_fileURLWithPath:path];
#else
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_fileURLWithPath:@""];
    }
    return [self swizzing_fileURLWithPath:path];
#endif
    
}

+ (NSURL *)swizzing_fileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir
{
#ifdef DEBUG
    return [self swizzing_fileURLWithPath:path isDirectory:isDir];
#else
    if (!path || ![path isKindOfClass:[NSString class]]) {
        return [self swizzing_fileURLWithPath:@"" isDirectory:isDir];
    }
    return [self swizzing_fileURLWithPath:path isDirectory:isDir];
#endif
}

@end
