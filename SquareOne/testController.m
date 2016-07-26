//
//  testFile.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/13/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//


// HOW TO LOG TO CONSOLE
// NSLog(@"%s", "Frame {");
// NSLog(@"%@", NSStringFromCGRect(subview.frame));
// NSLog(@"%@", NSStringFromCGPoint(subview.center));
// NSLog(@"%s", "} Frame");


//CONVERTED UIView *loadedNib to UINib, used commented out code before, now using loadedNib = [UINib with name...]  and rootView = [[....
 

#import "testController.h"
#import "elementParent.h"

@interface testController ()

@end

@implementation testController

    UIView *subViewX;
    UINib *loadedNib;

    - (void)viewWillLayoutSubviews {
        [super viewWillLayoutSubviews];
    }

    - (void)loadView {
        [super loadView];
        NSLog(@"%f", self.view.frame.size.width);
        //how to add subview from interface builder created element
        //variable loadedNib [declared above] of type UIView = *get views from nib named IdeaElement, at index 0
        //loadedNib = [[[NSBundle mainBundle] loadNibNamed:@"IdeaElement" owner:self options:nil] objectAtIndex:0];
        //[loadedNib setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        loadedNib = [UINib nibWithNibName:@"NotificationElement" bundle:nil];
        UIView *loadedNibView = [[loadedNib instantiateWithOwner:self.view options:nil] lastObject];

        [loadedNibView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        //how to add subview from subclass of uiview
        //variable subview of type UIView [declared aboce], alloc ClassName, call initWithFrame and pass it a paramater of tpye CGRect
        subViewX = [[elementParent alloc] initWithFrame:self.view.frame];
        [subViewX setBackgroundColor:[UIColor blackColor]];
        
        //Adding the views to the superview, and adding constraints
        [self.view addSubview:subViewX];
        
        [self.view addSubview:loadedNibView];
        [loadedNibView viewWithTag:1].layer.cornerRadius = self.view.frame.size.width * 0.125 * .5;
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:75];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeWidth multiplier:0.125 constant:10];
        
        [self.view addConstraint:widthConstraint];
        [self.view addConstraint:centerXConstraint];
        [self.view addConstraint:heightConstraint];
        [self.view addConstraint:centerYConstraint];
        
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