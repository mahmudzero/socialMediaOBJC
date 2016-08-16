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

    - (IBAction)goToComments:(id)sender {
        
        if (self.cellDelegate && [self.cellDelegate respondsToSelector:@selector(goToCommentsWasPressed:)]) {
            [self.cellDelegate goToCommentsWasPressed:self];
        }
    }

    - (void)setIdeaValues:(NSString *)userId withUserNamed:(NSString *)name withUserTitle:(NSString *)title withText:(NSString *)text withImageURL:(NSString *)image withNumLikes:(int)numLikes withNumComments:(int)numComments {
        [_ideaElement assignValuesForElements:userId withUserNamed:name withText:text withImageURL:image withNumLikes:numLikes withNumComments:numComments withTitle:title];
    }

@end
