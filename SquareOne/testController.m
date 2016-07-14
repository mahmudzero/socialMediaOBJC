//
//  testFile.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/13/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "testController.h"
#import "elementParent.h"
@import UIKit.NSLayoutConstraint;

@interface testController ()

@end

@implementation testController

    - (void)viewWillLayoutSubviews {
        [super viewWillLayoutSubviews];
        
        //how to add subview from subclass of uiview
        //variable subview of type UIView, alloc ClassName, call initWithFrame and pass it a paramater of tpye CGRect
        UIView *subview = [[elementParent alloc] initWithFrame:self.view.frame];
        [self.view addSubview:subview];
        [subview setBackgroundColor:[UIColor blackColor]];
        
        
        //how to add subview from interface builder created element
        //variable loadedNib of type UIView = *get views from nib named IdeaElement, at index 0
        UIView *loadedNib = [[[NSBundle mainBundle] loadNibNamed:@"IdeaElement" owner:self options:nil] objectAtIndex:0];
        [self.view addSubview:loadedNib];
        [loadedNib setBackgroundColor:[UIColor blueColor]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:loadedNib attribute: NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeWidth multiplier:1.0 constant:-5]];
        
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

@end


/* HOW TO LOG TO CONSOLE
 NSLog(@"%s", "Frame {");
 NSLog(@"%@", NSStringFromCGRect(subview.frame));
 NSLog(@"%@", NSStringFromCGPoint(subview.center));
 NSLog(@"%s", "} Frame");
 */