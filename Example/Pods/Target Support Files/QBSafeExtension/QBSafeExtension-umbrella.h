#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+QBSafe.h"
#import "NSDictionary+QBSafe.h"
#import "NSMutableArray+QBSafe.h"
#import "NSMutableDictionary+QBSafe.h"
#import "NSObject+QBExchangeImp.h"
#import "QBSafeExtension.h"

FOUNDATION_EXPORT double QBSafeExtensionVersionNumber;
FOUNDATION_EXPORT const unsigned char QBSafeExtensionVersionString[];

