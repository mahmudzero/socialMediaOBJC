//
//  IdeaControllerCollectionViewCell.h
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/13/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IdeaControllerCollectionViewCell;

    @protocol IdeaControllerCollectionViewCellDelegate <NSObject>

    - (void)goToCommentsWasPressed:(IdeaControllerCollectionViewCell *)cellDelegate;

@end


@interface IdeaControllerCollectionViewCell : UICollectionViewCell

    @property (nonatomic,weak) id<IdeaControllerCollectionViewCellDelegate> cellDelegate;
    - (void)setIdeaValues:(NSString *)userId withUserNamed:(NSString *)name withUserTitle:(NSString *)title withText:(NSString *)text withImageURL:(NSString *)image withNumLikes:(int)numLikes withNumComments:(int)numComments;

@end
