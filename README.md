# ZZToggleButton

A custom subclass of UIButton, provide toggle style and funcion.

You can tweak backgroundColor and cornerRadius for different State just as normal UIButton properties (text, color, backgroundImage, etc), in both programmetic or Interface Builder.

## Demo

![Demo](https://raw.githubusercontent.com/zzdjk6/ZZToggleButton/master/Stuff/Demo.gif)

## Installation

ZZToggleButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ZZToggleButton"
```

## How To Use

### ObjC

```ObjC
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
```

### Swift
```Swift
//
//  SwiftViewController.swift
//  ZZToggleButton-Example
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

import UIKit
import ZZToggleButton

class SwiftViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: ZZToggleButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weak var weakBtn = self.toggleButton
        self.toggleButton.onToggle = { (isOn:Bool) in
            let strongBtn = weakBtn
            let stateString = isOn ? "State: ON" : "State: OFF"
            self.stateLabel.text = stateString
            print("\(strongBtn) \(stateString)")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.toggleButton.toggle()
    }
}
```

## Parameters You Can Tweak

### ObjC
```ObjC
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
```
### Swift

```swift
import UIKit

//
//  ZZToggleButton.h
//  ZZToggleButton
//
//  Created by 陈圣晗 on 15/12/26.
//  Copyright © 2015年 Shenghan Chen. All rights reserved.
//

/**
 *  A custom subclass of UIButton, provide toggle style and funcion.
 */
public class ZZToggleButton : UIButton {
    
    /**
     *  Indicate whether this toggle button is On
     */
    public var isOn: Bool
    
    /**
     * Indicate the corner radius of this button.
     * Negative number will be regard as "corner radius is half the hight of button".
     */
    public var cornerRadius: Float
    
    /**
     *  Indicate background color when this toggle button is On
     */
    public var backgroundColorOn: UIColor!
    
    /**
     *  Indicate background color when this toggle button is Off
     */
    public var backgroundColorOff: UIColor!
    
    /**
     *  Block function will be executed when this toggle button is toggled.
     */
    public var onToggle: ((Bool) -> Void)!
    
    /**
     * Toggle button state
     */
    public func toggle()
}
```

Give "ZZToggleButton-Example" project a closer look.

## Author

Shenghan Chen, zzdjk6@gmail.com

## License

ZZToggleButton is available under the MIT license. See the LICENSE file for more info.