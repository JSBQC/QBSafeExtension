//
//  NSMutableDictionary+Safe.m
//  test
//
//  Created by QB on 2020/5/29.
//

#import "NSMutableDictionary+QBSafe.h"
#import "NSObject+QBExchangeImp.h"

@implementation NSMutableDictionary (QBSafe)

+ (void)load {
    Class class = NSClassFromString(@"__NSDictionaryM");
    
    [self exchangeIMP_InstanceSelectorA:@selector(swizzling_setObject:forKey:) InstanceSelectorB:@selector(setObject:forKey:) WithClass:class];
    
    [self exchangeIMP_InstanceSelectorA:@selector(setObject:forKeyedSubscript:) InstanceSelectorB:@selector(swizzling_setObject:forKeyedSubscript:) WithClass:class];
    
    [self exchangeIMP_InstanceSelectorA:@selector(removeObjectForKey:) InstanceSelectorB:@selector(swizzling_removeObjectForKey:) WithClass:class];
}


- (void)swizzling_setObject:(id)value forKey:(NSString *)key
{
#ifdef DEBUG
    [self swizzling_setObject:value forKey:key];
#else
    if (!value || !key) {
        return;
    }
    
    [self swizzling_setObject:value forKey:key];
#endif
}

- (void)swizzling_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
#ifdef DEBUG
    [self swizzling_setObject:obj forKeyedSubscript:key];
#else
    if (!obj || !key) {
        return;
    }
    
    [self swizzling_setObject:obj forKeyedSubscript:key];
#endif
}

- (void)swizzling_removeObjectForKey:(id)aKey {
#ifdef DEBUG
    [self swizzling_removeObjectForKey:aKey];
#else
    if (aKey) {
        [self swizzling_removeObjectForKey:aKey];
    }
#endif
}

@end
