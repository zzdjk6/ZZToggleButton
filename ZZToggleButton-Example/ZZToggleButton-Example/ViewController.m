//
//  ViewController.m
//  ZZToggleButton-Example
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

#import "ViewController.h"
#import "ZZToggleButton.h"

@interface ViewController ()

@property(weak, nonatomic) IBOutlet ZZToggleButton *toggleButton;
@property(weak, nonatomic) IBOutlet UILabel        *stateLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    __weak typeof(self.toggleButton) weakBtn = self.toggleButton;
    self.toggleButton.onToggle = ^(BOOL isOn) {
        __strong typeof(weakBtn) strongBtn    = weakBtn;
        NSString                 *stateString = isOn ? @"ON" : @"OFF";
        self.stateLabel.text = [NSString stringWithFormat:@"State: %@", stateString];
        NSLog(@"%@ state: %@", strongBtn, stateString);
    };
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.toggleButton toggle];
}

@end
