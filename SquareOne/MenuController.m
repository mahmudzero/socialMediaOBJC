//
//  MenuController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "MenuController.h"

@interface MenuController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MenuController

    - (void)loadView {
        [super loadView];
        for(int i = 0; i < 10; i++) {
            //UICollectionViewCell *collectionView = CGRectZero;
            NSLog(@"%s", "lol");
        }
    }


    - (void)viewDidLoad {
        [super viewDidLoad];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
    }
@end
