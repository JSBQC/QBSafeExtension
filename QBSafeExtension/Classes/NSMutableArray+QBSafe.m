//
//  NSMutableArray+Safe.m
//  test
//
//  Created by QB on 2020/5/29.
//

#import "NSMutableArray+QBSafe.h"
#import "NSObject+QBExchangeImp.h"


@implementation NSMutableArray (QBSafe)
+ (void)load {
    Class class = NSClassFromString(@"__NSArrayM");
    [self exchangeIMP_InstanceSelectorA:@selector(insertObject:atIndex:) InstanceSelectorB:@selector(swizzed_insertObject:atIndex:) WithClass:class];
}


- (void)swizzed_insertObject:(id)anObject atIndex:(NSUInteger)index
{
//    NSLog(@"");
    if (!anObject) {
         QBLog(@"NSMutableArray+QBSafe  添加的anObject为空");
        return;
    }
    [self swizzed_insertObject:anObject atIndex:index];
}

@end
