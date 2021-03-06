//
//  NSDictionary+Safe.m
//  test
//
//  Created by QB on 2020/5/29.
//

#import "NSDictionary+QBSafe.h"
#import "NSObject+QBExchangeImp.h"

@implementation NSDictionary (QBSafe)

+ (void)load {
//    [self exchangeIMP_InstanceSelectorA:@selector(swizzling_initWithObjects: forKeys:count:) InstanceSelectorB:@selector(initWithObjects:forKeys:count:) WithClass:NSClassFromString(@"__NSPlaceholderDictionary")];
}

- (instancetype)swizzling_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
#ifdef DEBUG
    return [self swizzling_initWithObjects:objects forKeys:keys count:cnt];
#else
    NSInteger j = 0;
    for (NSInteger i = 0; i < cnt; i++) {
        
        if(objects[i] == nil || keys[i] == nil) {
            break;;
        }
        j++;
    }
    return [self swizzling_initWithObjects:objects forKeys:keys count:j];
#endif
}

@end
