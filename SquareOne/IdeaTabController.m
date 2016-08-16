//
//  IdeaTabController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/26/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "IdeaTabController.h"
#import "IdeaControllerCollectionViewCell.h"
#import "AddNewIdeaElement.h"

@interface IdeaTabController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, IdeaControllerCollectionViewCellDelegate>
    @property (weak, nonatomic) IBOutlet UIView *menuBar;
    @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
    @property (weak, nonatomic) IBOutlet UIView *superView;
@end

@implementation IdeaTabController {
    id cellId;
    NSMutableArray *names;
    NSMutableArray *text;
    NSMutableArray *title;
    NSArray *comments;
    NSArray *commenters;
    NSMutableArray *imageURLs;
    NSMutableArray *numLikes;
    NSMutableArray *numComments;
    AddNewIdeaElement *view;
}

    - (void)loadView {
        [super loadView];
        cellId = @"cellId";
        [self initData];
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        [self setNeedsStatusBarAppearanceUpdate];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    - (void)addConstraintToNewIdeaController:(UIView *)viewForConstraint {
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewForConstraint attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewForConstraint attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
        NSLayoutConstraint *x = [NSLayoutConstraint constraintWithItem:viewForConstraint attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        NSLayoutConstraint *y = [NSLayoutConstraint constraintWithItem:viewForConstraint attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.view addConstraint:width];
        [self.view addConstraint:height];
        [self.view addConstraint:x];
        [self.view addConstraint:y];
                                                                                                                                                 
    }

    - (void)updateArraysAndAddNewIdea {
        [names insertObject:view.nameLabel.text atIndex:0];
        [text insertObject:view.textField.text atIndex:0];
        [imageURLs insertObject:@"1" atIndex:0];
        [numLikes insertObject:@0 atIndex:0];
        [numComments insertObject:@0 atIndex:0];
        [_collectionView reloadData];
        [self removeViewFromSuperViewWithAnimation:view withTimeInterval:1.0];
    }

    - (void)removeViewFromSuperViewWithAnimation:(UIView *)viewToRemove withTimeInterval:(double)timeInterval {
        NSTimeInterval *nsInterval = &timeInterval;
        [UIView animateWithDuration:*nsInterval
                         animations:^{viewToRemove.alpha = 0.0;}
                         completion:^(BOOL finished){ [viewToRemove removeFromSuperview]; }];
    }

    - (void)removeViewFromSuperView {
        [self removeViewFromSuperViewWithAnimation:view withTimeInterval:1.0];
    }

    - (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
    }

    #pragma mark IBActions
    - (IBAction)addNewIdea:(id)sender {
        UINib *nib = [UINib nibWithNibName:@"AddNewIdea" bundle:nil];
        view = [[nib instantiateWithOwner:self.view options:nil] lastObject];
        [view.nameLabel setText:@"John Smith"];
        [self.view addSubview:view];
        [[view button] addTarget:self action:@selector(updateArraysAndAddNewIdea) forControlEvents:UIControlEventTouchUpInside];
        [[view closeButton] addTarget:self action:@selector(removeViewFromSuperView) forControlEvents:UIControlEventTouchUpInside];
        [self addConstraintToNewIdeaController:view];
        
    }

    #pragma mark IdeaControllerCollectionViewCellDelegate
    - (void)goToCommentsWasPressed:(IdeaControllerCollectionViewCell *)cellDelegate {
        [self performSegueWithIdentifier:@"goToComments" sender:self];
    }


    #pragma mark UICollectionViewDelegate & DataSource Methods

    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return text.count;
    }

    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
        IdeaControllerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        NSInteger position = indexPath.row;
        [cell setIdeaValues:@"1" withUserNamed:[names objectAtIndex:position] withUserTitle:[title objectAtIndex:position] withText:[text objectAtIndex:position] withImageURL:[imageURLs objectAtIndex:position] withNumLikes:[[numLikes objectAtIndex:position] intValue] withNumComments:[[numComments objectAtIndex:position] intValue]];
        return cell;
    }

    - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        NSInteger position = indexPath.row;
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        CGRect rect = [[text objectAtIndex:position] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 46, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font}  context:nil];
        NSLog(@"%f", rect.size.height);
        return CGSizeMake(self.view.frame.size.width - 16, 60 + rect.size.height);
    }


    #pragma mark TestData

    -(void)initData {
        names = [NSMutableArray arrayWithObjects: @"Josh Walker", @"Emily Lane", @"Laura Wilson", @"Josh Walker", @"Jaime Sanchez", @"Aaron Wong", @"Evelyn Jackson", @"Christine Hunter", @"Jack Murphy", @"Thoman Bennet", @"Stephen Jones", @"David Cruz", @"Hannah Nguyen", @"Josh Walker", @"Evelyn Jackson", @"Emily Lane", nil ];
        text = [NSMutableArray arrayWithObjects:
                            @"Laundry and dry cleaning service for students that picks up and delivers their clothes",
                            @"A YouTube Channel showing creative ways to use and apply makeup",
                            @"An app that allows college students to connect to create businesses",
                            @"Dining hall delivery service that delivers dining hall food directly to your dorm",
                            @"Pre-workout supplement using only organic ingredients",
                            @"A water bottle that filters out contaminants using a sand-based filter",
                            @"YouTube talk show based on celebrities daily lives",
                            @"An Indian food stand in the middle of campus!",
                            @"A chic clothing line for pregnant women and their babies",
                            @"Over-ear headphones that you can wear even when sleeping!",
                            @"App helping parents find tutors in their area",
                            @"A fitness app that helps students keep track of what they eat and recommends healthy foods",
                            @"A national beer pong tournament for fraternities",
                            @"Dorm move-in/move-out service for college student",
                            @"Mobile house recycling service that comes to your house and removes unwanted items for free and uses the items to create new products",
                            @"Wedding dress line for low income women",
                            nil
                          ];
        title = [NSMutableArray arrayWithObjects:@"Athlete", @"Chef", @"Graphic Designer", @"Athlete", @"Stylist", @"Artist", @"Musician", @"Creative Writer", @"Photographer", @"Professional Gamer", @"Mechanic", @"Barber", @"Developer", @"Athlete", @"Musician", @"Chef", nil];
        
        imageURLs = [NSMutableArray arrayWithObjects: @"Josh Walker.png", @"Emily Lane.png", @"Laura Wilson.png", @"Josh Walker.png", @"Jamie Sanchez.png", @"Aaron Wong.png", @"Evelyn Jackson.png", @"Christine Hunter.png", @"Jack Murphy.png", @"Thomas Bennet.png", @"Stephen Jones.png", @"David Cruz.png", @"Hannah Nguyen.png", @"Josh Walker.png", @"Evelyn Jackson.png", @"Emily Lane.png", nil ];
        numLikes= [NSMutableArray arrayWithObjects: @31, @58, @272, @12, @18, @82, @22, @38, @42, @34, @10, @21, @34, @54, @11, @25, nil ];
        numComments = [NSMutableArray arrayWithObjects: @7, @22, @81, @0, @3, @17, @3, @25, @7, @8, @4, @14, @12, @17, @2, @8, nil ];
        
    }

@end




