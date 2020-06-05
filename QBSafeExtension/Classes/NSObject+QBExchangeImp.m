//
//  NSObject+ExchangeImp.m
//  test
//
//  Created by QB on 2020/5/29.
//

#import "NSObject+QBExchangeImp.h"
#import <objc/runtime.h>

@implementation NSObject (QBExchangeImp)

+ (BOOL)exchangeIMP_InstanceSelectorA:(SEL)aSelector InstanceSelectorB:(SEL)bSelector
{
   return [self exchangeIMP_InstanceSelectorA:aSelector InstanceSelectorB:bSelector WithClass:[self class]];
}

+ (BOOL)exchangeIMP_InstanceSelectorA:(SEL)aSelector InstanceSelectorB:(SEL)bSelector WithClass:(Class)cls
{
    Method aMethod = class_getInstanceMethod([cls class], aSelector);
    Method bMethod = class_getInstanceMethod([cls class], bSelector);
    if (!aMethod || !bMethod) {
        return NO;
    }
    method_exchangeImplementations(aMethod, bMethod);
    return YES;
}

+ (BOOL)exchangeIMP_ClassSelectorA:(SEL)aSelector ClassSelectorB:(SEL)bSelector
{
    return [self exchangeIMP_ClassSelectorA:aSelector ClassSelectorB:bSelector WithClass:[self class]];
}

+ (BOOL)exchangeIMP_ClassSelectorA:(SEL)aSelector ClassSelectorB:(SEL)bSelector WithClass:(Class)cls
{
    Method aMethod = class_getClassMethod([cls class], aSelector);
    Method bMethod = class_getClassMethod([cls class], bSelector);
    if (!aMethod || !bMethod) {
        return NO;
    }
    method_exchangeImplementations(aMethod, bMethod);
    return YES;
}

@end
