//
//  NSObject+ExchangeImp.h
//  test
//
//  Created by QB on 2020/5/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (QBExchangeImp)

/**
 *  实例方法aSelector 与 实例方法bSelector 进行方法交互
 */
+ (BOOL)exchangeIMP_InstanceSelectorA:(SEL)aSelector InstanceSelectorB:(SEL)bSelector;
+ (BOOL)exchangeIMP_InstanceSelectorA:(SEL)aSelector InstanceSelectorB:(SEL)bSelector WithClass:(Class)cls;

/**
*  类方法aSelector 与 类方法bSelector 进行方法交互
*/
+ (BOOL)exchangeIMP_ClassSelectorA:(SEL)aSelector ClassSelectorB:(SEL)bSelector;
+ (BOOL)exchangeIMP_ClassSelectorA:(SEL)aSelector ClassSelectorB:(SEL)bSelector WithClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
