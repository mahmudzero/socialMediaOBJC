//
//  PersonCollectionViewCell.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/15/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "PersonCollectionViewCell.h"
#import "PersonElement.h"

@interface PersonCollectionViewCell()
@property (weak, nonatomic) IBOutlet PersonElement *personElement;

@end

@implementation PersonCollectionViewCell

    - (void)setIdeaValues:(NSString *)userId withUserNamed:(NSString *)name withUserTitle:(NSString *)title withText:(NSString *)text withImageURL:(NSString *)imageName withSkillImage:(NSString *)skillImageName {
        [_personElement assignValuesForElements:userId withUserNamed:name withUserTitle:title withText:text withImageURL:imageName withSkillImage:skillImageName];
    }

@end
