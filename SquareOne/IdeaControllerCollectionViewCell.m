//
//  IdeaControllerCollectionViewCell.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/13/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "IdeaControllerCollectionViewCell.h"
#import "IdeaElement.h"

@interface IdeaControllerCollectionViewCell ()

@property (strong, nonatomic) IBOutlet IdeaElement *ideaElement;

@end

@implementation IdeaControllerCollectionViewCell

    - (void)setIdeaValues:(NSString *)userId withUserNamed:(NSString *)name withText:(NSString *)text withImageURL:(NSString *)imageNamed withNumLikes:(int)numLikes withNumComments:(int)numComments {
        [_ideaElement assignValuesForElements:userId withUserNamed:name withText:text withImageURL:imageNamed withNumLikes:numLikes withNumComments:numComments];
    }

@end
