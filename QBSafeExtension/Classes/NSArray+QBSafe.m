//
//  NSArray+Safe.m
//  test
//
//  Created by QB on 2020/5/29.
//

#import "NSArray+QBSafe.h"
#import "NSObject+QBExchangeImp.h"

@implementation NSArray (QBSafe)
+ (void)load {
    
    [self exchangeIMP_InstanceSelectorA:@selector(initWithObjects: count:) InstanceSelectorB:@selector(swizzling_initWithObjects:count:) WithClass:NSClassFromString(@"__NSPlaceholderArray")];
    
    [self exchangeIMP_InstanceSelectorA:@selector(objectAtIndex:) InstanceSelectorB:@selector(swizzling_NSArray0_objectAtIndex:) WithClass:NSClassFromString(@"__NSArray0")];
    [self exchangeIMP_InstanceSelectorA:@selector(objectAtIndex:) InstanceSelectorB:@selector(swizzling_NSSingleObjectArrayI_objectAtIndex:) WithClass:NSClassFromString(@"__NSSingleObjectArrayI")];
    [self exchangeIMP_InstanceSelectorA:@selector(objectAtIndex:) InstanceSelectorB:@selector(swizzling_NSArrayI_objectAtIndex:) WithClass:NSClassFromString(@"__NSArrayI")];

}


- (instancetype)swizzling_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
#ifdef DEBUG
    return [self swizzling_initWithObjects:objects count:cnt];
#else
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        // 这里只做value 为nil的处理 对key为nil不做处理
        if (objects[i] == nil) {
            break;
        }
        j++;
    }
    
    return [self swizzling_initWithObjects:objects count:j];
#endif
    
}

- (id)swizzling_NSArray0_objectAtIndex:(NSUInteger)index {
#ifdef DEBUG
    return [self swizzling_NSArray0_objectAtIndex:index];
#else
    if (index < self.count) {
        return [self swizzling_NSArray0_objectAtIndex:index];
    }
    else {
        return nil;
    }
#endif
    
}

- (id)swizzling_NSSingleObjectArrayI_objectAtIndex:(NSUInteger)index {
#ifdef DEBUG
    return [self swizzling_NSSingleObjectArrayI_objectAtIndex:index];
#else
    if (index < self.count) {
        return [self swizzling_NSSingleObjectArrayI_objectAtIndex:index];
    }
    else {
        return nil;
    }
#endif
    
}

- (id)swizzling_NSArrayI_objectAtIndex:(NSUInteger)index {
#ifdef DEBUG
    return [self swizzling_NSArrayI_objectAtIndex:index];
#else
    if (index < self.count) {
        return [self swizzling_NSArrayI_objectAtIndex:index];
    }
    else {
        return nil;
    }
#endif
}

@end
