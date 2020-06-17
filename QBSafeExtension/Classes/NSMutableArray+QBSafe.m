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
    [self exchangeIMP_InstanceSelectorA:@selector(objectAtIndex:) InstanceSelectorB:@selector(swizzed_objectAtIndex:) WithClass:class];
    
    [self exchangeIMP_InstanceSelectorA:@selector(removeObjectsInRange:) InstanceSelectorB:@selector(swizzed_removeObjectsInRange:) WithClass:class];
}


- (void)swizzed_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        [self swizzed_insertObject:anObject atIndex:index];
    }
    else {
        QBLog(@"NSMutableArray+QBSafe  添加的anObject为空");
    }
}

- (id)swizzed_objectAtIndex:(NSUInteger)index {
    if(index < self.count) {
        return [self swizzed_objectAtIndex:index];
    }
    else {
        QBLog(@"NSMutableArray 数组越界");
        return nil;
    }
}

- (void)swizzed_removeObjectsInRange:(NSRange)range {
    if (range.location < self.count && (range.length+range.location <= self.count)) {
        [self swizzed_removeObjectsInRange:range];
    }
    else {
        QBLog(@"NSMutableArray range越界");
    }
}



@end
