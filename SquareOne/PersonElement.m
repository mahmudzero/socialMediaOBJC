//
//  PersonElement.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//


#import "PersonElement.h"

@interface PersonElement()
    @property (weak, nonatomic) IBOutlet UITextView *textView;
    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *personTitleLable;
    @property (weak, nonatomic) IBOutlet UIImageView *profileImage;
    @property(weak, nonatomic) IBOutlet UIImageView *skillImage;
@end

@implementation PersonElement {
    NSString *userID;
    NSString *userName;
    NSString *status;
    NSString *userTitle;
    UIImage *userImage;
    UIImage *skillImageImage;
}

    - (void)assignValuesForElements:(NSString *)userId withUserNamed:(NSString *)name withUserTitle:(NSString *)title withText:(NSString *)text withImageURL:(NSString *)imageName withSkillImage:(NSString *)skillImageName {
        userID = userId;
        userName = name;
        userTitle = title;
        status = text;
        userImage = [UIImage imageNamed:imageName];
        skillImageImage= [UIImage imageNamed:skillImageName];
        
        [self setValuesToElements];
    }

    - (void)setValuesToElements {
        _nameLabel.text = userName;
        _personTitleLable.text = userTitle;
        _textView.text = status;
        _profileImage.image = userImage;
        _skillImage.image = skillImageImage;
    }


    - (id)initWithCoder:(NSCoder *)aDecoder {
        
        self = [super initWithCoder:aDecoder];
        
        return self;
    }

    - (id)initWithFrame:(CGRect)frameToBe {
        
        self = [super initWithFrame:frameToBe];
        
        return self;
    }


@end