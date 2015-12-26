//
//  ZZToggleButton.m
//  ZZToggleButton-Example
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

#import "ZZToggleButton.h"

@implementation ZZToggleButton

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }

    return self;
}

#pragma mark - Accessor

- (void)setIsOn:(BOOL)isOn
{
    _isOn = isOn;
    [self updateState];
}

- (void)setBackgroundColorOn:(UIColor *)backgroundColorOn
{
    _backgroundColorOn = backgroundColorOn;
    [self updateState];
}

- (void)setBackgroundColorOff:(UIColor *)backgroundColorOff
{
    _backgroundColorOff = backgroundColorOff;
    [self updateState];
}

- (void)setCornerRadius:(float)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self updateState];
}

#pragma mark - Public

- (void)toggle
{
    self.isOn = !self.isOn;
    if (self.onToggle) {
        self.onToggle(self.isOn);
    }
}

#pragma mark - Private

- (void)commonInit
{
    self.isOn         = NO;
    self.cornerRadius = 0;
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateState
{
    // Change Button Selected State
    [self setSelected:self.isOn];

    // Change Background color
    do {
        if (self.isOn && self.backgroundColorOn) {
            [self setBackgroundColor:self.backgroundColorOn];
            break;
        }

        if (!self.isOn && self.backgroundColorOff) {
            [self setBackgroundColor:self.backgroundColorOff];
            break;
        }
    } while (NO);

    // Change Corner Radius
    self.layer.masksToBounds = YES;

    if (self.cornerRadius >= 0) {
        self.layer.cornerRadius = self.cornerRadius;
    } else {
        self.layer.cornerRadius = self.frame.size.height / 2.0f;
    }
}

- (void)buttonPressed:(id)sender
{
    [self toggle];
}

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    [self updateState];
}

@end
