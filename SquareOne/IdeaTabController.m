//
//  IdeaTabController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/26/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "IdeaTabController.h"
#import "IdeaControllerCollectionViewCell.h"

@interface IdeaTabController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, IdeaControllerCollectionViewCellDelegate>
    @property (weak, nonatomic) IBOutlet UIView *menuBar;
    @property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IdeaTabController {
    id cellId;
    NSArray *names;
    NSArray *text;
    NSArray *comments;
    NSArray *commenters;
    NSArray *imageURLs;
    NSArray *numLikes;
    NSArray *numComments;
}

    - (void)loadView {
        [super loadView];
        cellId = @"cellId";
        [self initData];
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        [_collectionView reloadData];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


    #pragma mark UICollectionViewDelegate & DataSource Methods

    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 16;
    }

    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
        IdeaControllerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        NSInteger position = indexPath.row;
        [cell setIdeaValues:@"1" withUserNamed:[names objectAtIndex:position] withText:[text objectAtIndex:position] withImageURL:@"1" withNumLikes:[[numLikes objectAtIndex:position] intValue] withNumComments:[[numComments objectAtIndex:position] intValue]];
        return cell;
    }

    - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        //NSInteger position = indexPath.row;
        //CGRect *rect = [[text objectAtIndex:position] boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: UIFontWeightThin}  context:nil];
        return CGSizeMake(self.view.frame.size.width - 16, 155);
    }


    #pragma mark TestData

    -(void)initData {
        names = [NSArray arrayWithObjects: @"John Smith", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", nil ];
        text = [NSArray arrayWithObjects:
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
        comments = @[
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               @[],
                               
                               @[@"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this",
                                 @"Great idea! I know some people that can benefit from something like this"]
                               ];
        commenters = @[
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[],
                                 @[@"",
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   @""]
                                 ];
        
        imageURLs = [NSArray arrayWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", nil ];
        numLikes= @[ @31, @58, @272, @12, @18, @82, @22, @38, @42, @34, @10, @21, @34, @54, @11, @25 ];
        numComments = @[ @7, @22, @81, @0, @3, @17, @3, @25, @7, @8, @4, @14, @12, @17, @2, @8 ];
        
    }

@end




