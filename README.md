UIBarButtonItem-DefaultBackButton
==================================

Category to create iOS 7 UIBarButtonItem like the back button.

First make sure that you have ``init`` and ``updated`` the submodule form marius-.

Include this category in your *-Prefix.pch file:

```objc
#ifdef __OBJC__
    #import <UIKit/UIKit.h>
    #import <Foundation/Foundation.h>
    #import "UINavigationItem+iOS7Spacing.h"
#endif
```

Then import the category in any class you want to use it:
```objc
#import "UIBarButtonItem+DefaultBackButton.h"
```

At least create the custom leftBarButtonItem and hide the backBarButtonItem:
```objc
self.navigationItem.hidesBackButton = NO;
self.navigationItem.leftBarButtonItem = [self.navigationItem.leftBarButtonItem backButtonWith:@"Mainmenu"
tintColor:[UIColor colorWithRed:1.0/255.0 green:136.0/255.0 blue:185.0/255.0 alpha:1.0]
andAction:@selector(backAction)];
```

The result:

![alt text](http://www.fudgecode.de/wp-content/uploads/2013/10/backBarItem-624x216.png "Back Button")

Fully tested on iOS 6 & 7.

A german tutorial can be found under: [FudgeCode.de]


[FudgeCode.de]: www.fudgecode.de/2013/10/ios-7-back-button-aus-uinavigationbar-nachbauen/