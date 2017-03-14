//
//  UIControl+MutablieClick.m
//  UIButtonMutablieClick
//
//  Created by hehe on 2017/3/13.
//  Copyright © 2017年 transfar. All rights reserved.
//

#import "UIControl+MutablieClick.h"
#import <objc/runtime.h>

@implementation UIControl (MutablieClick)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";

- (void)setHw_acceptEventInterval:(NSTimeInterval)hw_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(hw_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)hw_acceptEventInterval {
    
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
    
}

- (void)setHw_ignoreEvent:(BOOL)hw_ignoreEvent {
    
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(hw_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (BOOL)hw_ignoreEvent {
    return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent) boolValue];
}

+ (void)load {
    
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    
    Method b = class_getInstanceMethod(self, @selector(__hw_sendAction:to:forEvent:));
    
    method_exchangeImplementations(a, b);
    
}

- (void)__hw_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.hw_ignoreEvent) return;
    
    if (self.hw_acceptEventInterval > 0) {
        
        self.hw_ignoreEvent = YES;
        
        [self performSelector:@selector(setHw_ignoreEvent:) withObject:@(NO) afterDelay:self.hw_acceptEventInterval];
        
    }
    
    [self __hw_sendAction:action to:target forEvent:event];
    
}
@end
