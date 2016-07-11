//
//  ViewController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/5/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "ViewController.h"
#import "elementParent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    //how to add subview from subclass of uiview
//    //variable subview of type UIView, alloc ClassName, call initWithFrame and pass it a paramater of tpye CGRect
//    UIView *subview = [[elementParent alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:subview];
//    [subview setBackgroundColor:[UIColor blackColor]];
//    NSLog(@"%@", self.view.subviews);
//    
//    //how to add subview from interface builder created element
//    //variable loadedNib of type UIView = *get views from nib named IdeaElement, at index 0
//    UIView *loadedNib = [[[NSBundle mainBundle] loadNibNamed:@"IdeaElement" owner:self options:nil] objectAtIndex:0];
//    loadedNib.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
//    [self.view addSubview:loadedNib];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
