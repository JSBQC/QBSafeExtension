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
}


- (instancetype)swizzling_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        // 这里只做value 为nil的处理 对key为nil不做处理
        if (objects[i] == nil) {
                QBLog(@"NSArray+QBSafe  添加的 Obj 有nil数据");
            break;
        }
        j++;
    }
    
    return [self swizzling_initWithObjects:objects count:j];
}
@end
