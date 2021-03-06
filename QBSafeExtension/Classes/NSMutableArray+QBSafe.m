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
    
    [self exchangeIMP_InstanceSelectorA:@selector(exchangeObjectAtIndex: withObjectAtIndex:) InstanceSelectorB:@selector(swizzed_exchangeObjectAtIndex: withObjectAtIndex:) WithClass:class];
}


- (void)swizzed_insertObject:(id)anObject atIndex:(NSUInteger)index
{
#ifdef DEBUG
    [self swizzed_insertObject:anObject atIndex:index];
#else
    if (anObject) {
        [self swizzed_insertObject:anObject atIndex:index];
    }
#endif
}

- (id)swizzed_objectAtIndex:(NSUInteger)index {
#ifdef DEBUG
    return [self swizzed_objectAtIndex:index];
#else
    if(index < self.count) {
        return [self swizzed_objectAtIndex:index];
    }
    else {
        return nil;
    }
#endif
}

- (void)swizzed_removeObjectsInRange:(NSRange)range {
    
#ifdef DEBUG
    [self swizzed_removeObjectsInRange:range];
#else
    if (range.location < self.count && (range.length+range.location <= self.count)) {
        [self swizzed_removeObjectsInRange:range];
    }
#endif
    
}

- (void)swizzed_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
#ifdef DEBUG
    return [self swizzed_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
#else
    NSInteger count = self.count;
    if(idx1!=idx2 && idx1<(count-1) && idx2<(count-1)) {
        [self swizzed_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    }
#endif
    
}


@end
