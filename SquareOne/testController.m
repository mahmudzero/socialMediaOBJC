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
#import "IdeaElement.h"

@interface testController ()

@end

@implementation testController {
    //UIView *subViewX;
    UINib *loadedNib;
    IdeaElement *loadedNibView;
    NSLayoutConstraint *heightConstraint;
    CGFloat height;
}

    - (void)viewWillLayoutSubviews {
        [super viewWillLayoutSubviews];
    }

    - (void)setUpGesture {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeHeight)];
        [loadedNibView addGestureRecognizer:tap];
    }

    - (void)changeHeight {
        NSLog(@"change height clikce");
        if(heightConstraint.constant == 115) {
            height = 210;
            [heightConstraint setConstant:height];
        } else {
            height = 115;
            [heightConstraint setConstant:height];
        }
        [loadedNibView checkHeight:height];
    }

    - (void)loadView {
        [super loadView];
        //how to add subview from interface builder created element
        //variable loadedNib [declared above] of type UIView = *get views from nib named IdeaElement, at index 0
        //loadedNib = [[[NSBundle mainBundle] loadNibNamed:@"IdeaElement" owner:self options:nil] objectAtIndex:0];
        //[loadedNib setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        height = 115;
        
        loadedNib = [UINib nibWithNibName:@"IdeaElement" bundle:nil];
        loadedNibView = [[loadedNib instantiateWithOwner:self.view options:nil] lastObject];

        [loadedNibView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        //how to add subview from subclass of uiview
        //variable subview of type UIView [declared aboce], alloc ClassName, call initWithFrame and pass it a paramater of tpye CGRect
        //subViewX = [[elementParent alloc] initWithFrame:self.view.frame];
        //[subViewX setBackgroundColor:[UIColor blackColor]];
        
        //Adding the views to the superview, and adding constraints
        //[self.view addSubview:subViewX];
        
        [self.view addSubview:loadedNibView];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
        
        NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:75];
        
        heightConstraint = [NSLayoutConstraint constraintWithItem:loadedNibView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
        
        [self.view addConstraint:widthConstraint];
        [self.view addConstraint:centerXConstraint];
        [self.view addConstraint:heightConstraint];
        [self.view addConstraint:centerYConstraint];
        [self setUpGesture];
        
        
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