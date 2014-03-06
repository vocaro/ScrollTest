//
//  ViewController.m
//  ScrollTest
//
//  Created by Harmon, Trevor on 2/20/14.
//  Copyright (c) 2014 MyTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView *topSpacer;
@property (nonatomic, weak) IBOutlet UIView *bottomSpacer;
@property (nonatomic, weak) IBOutlet UIView *topPurple;
@property (nonatomic, weak) IBOutlet UIView *bottomPurple;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topSpacer
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomSpacer
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:3
                                                           constant:0]];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.textField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.textField.frame animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

@end
