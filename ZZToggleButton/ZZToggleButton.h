//
//  ZZToggleButton.h
//  ZZToggleButton
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

/**
 *  A custom subclass of UIButton, provide toggle style and funcion.
 */
@interface ZZToggleButton : UIButton

/**
 *  Indicate whether this toggle button is On
 */
@property(nonatomic, assign) IBInspectable BOOL isOn;

/**
 * Indicate the corner radius of this button.
 * Negative number will be regard as "corner radius is half the hight of button".
 */
@property(nonatomic, assign) IBInspectable float cornerRadius;

/**
 *  Indicate background color when this toggle button is On
 */
@property(nonatomic, strong) IBInspectable UIColor *backgroundColorOn;

/**
 *  Indicate background color when this toggle button is Off
 */
@property(nonatomic, strong) IBInspectable UIColor *backgroundColorOff;

/**
 *  Block function will be executed when this toggle button is toggled.
 */
@property(nonatomic, copy) void (^onToggle)(BOOL);

/**
 * Toggle button state
 */
- (void)toggle;

@end