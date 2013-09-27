//
//  KeyboardViewController.h
//  KeyboardThings
//
//  Created by bunny on 13-9-27.
//  Copyright (c) 2013年 bunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfield;
@property (weak, nonatomic) IBOutlet UITextView *tview;

@end
