//
//  PersonCollectionViewCell.h
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/15/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExploreTabControllerPersonCollectionViewCellDelegate;

    @protocol ExploreTabControllerPersonCollectionViewCellDelegate <NSObject>

@end

@interface PersonCollectionViewCell : UICollectionViewCell

    @property (nonatomic, weak) id<ExploreTabControllerPersonCollectionViewCellDelegate> personCellDelegate;
        - (void)setIdeaValues:(NSString *)userId withUserNamed:(NSString *)name withUserTitle:(NSString *)title withText:(NSString *)text withImageURL:(NSString *)imageName withSkillImage:(NSString *)skillImageName;

@end
