//
//  ExploreTabController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/14/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "ExploreTabController.h"
#import "PersonCollectionViewCell.h"

@interface ExploreTabController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ExploreTabControllerPersonCollectionViewCellDelegate, UIScrollViewDelegate>
    @property (weak, nonatomic) IBOutlet UICollectionView *peopleCollection;
    @property (weak, nonatomic) IBOutlet UICollectionView *startupCollection;
    @property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
    @property (weak, nonatomic) IBOutlet UILabel *startupLabel;

@end

@implementation ExploreTabController {
    id peopleId;
    id startupId;
    NSDictionary *dataDict;
    NSDictionary *startupDict;
    int numberOfCells;
    int numberOfStartups;
    NSString *jsonpath;
    NSData *data;
    id jsonData;
}

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        peopleId = @"peopleCell";
        startupId = @"startupCell";
        numberOfCells = 12;
        [self deserializeJSON];
        [self deserializeStartupJson];
        [self setNeedsStatusBarAppearanceUpdate];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    - (void)deserializeJSON {
        jsonpath = [[NSBundle mainBundle] pathForResource:@"exploreTab-data" ofType:@"json"];
        data = [NSData dataWithContentsOfFile:jsonpath];
        NSError *error = nil;
        jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        dataDict = jsonData;
        numberOfCells = (int)[[dataDict objectForKey:@"data"] count];
    }

    - (void)deserializeStartupJson {
        jsonpath = [[NSBundle mainBundle] pathForResource:@"startups" ofType:@"json"];
        data = [NSData dataWithContentsOfFile:jsonpath];
        NSError *error = nil;
        jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        startupDict = jsonData;
        numberOfStartups = (int)[[startupDict objectForKey:@"data"] count];
    }

    - (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
    }

    #pragma mark ScrollViewDelegate
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
        CGFloat pageWidth = scrollView.bounds.size.width;
        NSInteger pageNumber = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        switch (pageNumber) {
            case 0:
                [_peopleLabel setTextColor:[UIColor colorWithRed:51.0f/255.0f green:199.0/255.0 blue:205.0f/255.0f alpha:1]];
                [_startupLabel setTextColor:[UIColor blackColor]];
                break;
            case 1:
                [_peopleLabel setTextColor:[UIColor blackColor]];
                [_startupLabel setTextColor:[UIColor colorWithRed:51.0f/255.0f green:199.0f/255.0f blue:205.0f/255.0f alpha:1]];
                break;
            default:
                break;
        };
    }


    #pragma mark CollectionViewDelegate Methods
    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        if(collectionView == _peopleCollection) {
                return numberOfCells;
        } else {
            return numberOfStartups;
        }
    }

    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
        if(collectionView == _peopleCollection) {
            PersonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:peopleId forIndexPath:indexPath];
            NSInteger position = indexPath.row;
            [cell setIdeaValues:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"userID"] withUserNamed:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"name"] withUserTitle:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"title"] withText:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"status"] withImageURL:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"profilePic"] withSkillImage:[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"skillPic"]];
            return cell;
        } else {
            PersonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:startupId forIndexPath:indexPath];
            NSInteger position = indexPath.row;
            [cell setIdeaValues:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"userID"] withUserNamed:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"name"] withUserTitle:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"title"] withText:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"status"] withImageURL:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"profilePic"] withSkillImage:[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"skillPic"]];
            return cell;
        }
        
    }

    - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        if(collectionView == _peopleCollection) {
            NSInteger position = indexPath.row;
            UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
            CGRect rect = [[[[dataDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"status"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font}  context:nil];
            return CGSizeMake(self.view.frame.size.width, 352 + rect.size.height);
        } else {
            NSInteger position = indexPath.row;
            UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
            CGRect rect = [[[[startupDict objectForKey:@"data"] objectAtIndex:position] objectForKey:@"status"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font}  context:nil];
            return CGSizeMake(self.view.frame.size.width, 352 + rect.size.height);
        }
    }

@end
