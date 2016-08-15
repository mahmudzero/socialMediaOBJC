//
//  ExploreTabController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/14/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "ExploreTabController.h"

@interface ExploreTabController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
    @property (weak, nonatomic) IBOutlet UICollectionView *peopleCollection;
    @property (weak, nonatomic) IBOutlet UICollectionView *startupCollection;
@end

@implementation ExploreTabController {
    id peopleId;
    id startupId;
}

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        peopleId = @"peopleCell";
        startupId = @"startupCell";
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    #pragma mark CollectionViewDelegate Methods
    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 16;
    }

    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
        if(collectionView == _peopleCollection) {
            return [collectionView dequeueReusableCellWithReuseIdentifier:peopleId forIndexPath:indexPath];
        } else {
            return [collectionView dequeueReusableCellWithReuseIdentifier:startupId forIndexPath:indexPath];
        }
        
    }

    - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        //NSInteger position = indexPath.row;
        //CGRect *rect = [[text objectAtIndex:position] boundingRectWithSize:CGSizeMake(self.view.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: UIFontWeightThin}  context:nil];
        return CGSizeMake(self.view.frame.size.width, 400);
    }

@end
