//
//  IdeaElement.h
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdeaElement : UIView

    - (void)checkHeight:(int)height;

    - (void)assignValuesForElements:(NSString *)userId withUserNamed:(NSString *)name withText:(NSString *)text withImageURL:(NSString *)imageName withNumLikes:(int)numLikes withNumComments:(int)numComments;

@end