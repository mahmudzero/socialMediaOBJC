//
//  IdeaElement.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "IdeaElement.h"

@interface IdeaElement()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *personTitleLable;
@property (weak, nonatomic) IBOutlet UIButton *commentsButton;
@property (weak, nonatomic) IBOutlet UIButton *messageUserButton;
@property (weak, nonatomic) IBOutlet UILabel *numberOfComments;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation IdeaElement {
    NSString *userID;
    NSString *userName;
    NSString *postText;
    UIImage *userImage;
    int numOfLikes;
    int numOfComments;
    BOOL isLiked;
}

    - (IBAction)liked:(id)sender {
        if(!isLiked) {
            isLiked = YES;
            numOfLikes += 1;
            [_likesLabel setTextColor:[UIColor colorWithRed:0.0f/255.0f green:165.0f/255.0f blue:172.0f/255.0f alpha:1]];
        } else {
            isLiked = NO;
            numOfLikes -= 1;
            [_likesLabel setTextColor:[UIColor colorWithRed:152.0f/255.0f green:165.0f/255.0f blue:172.0f/255.0f alpha:1]];
        }
        [self setValuesToElements];
    }

    - (IBAction)messageClicked:(id)sender {
        NSLog(@"message");
    }

    - (void)assignValuesForElements:(NSString *)userId withUserNamed:(NSString *)name withText:(NSString *)text withImageURL:(NSString *)imageName withNumLikes:(int)numLikes withNumComments:(int)numComments {
        userID = userId;
        userName = name;
        postText = text;
        userImage = [UIImage imageNamed:imageName];
        
        numOfLikes = numLikes;
        numOfComments = numComments;
        [self setValuesToElements];
    }

    - (void)setValuesToElements {
        _nameLabel.text = userName;   //hidden because no title for test data
        //_personTitleLable.text = @""; //_personTitleLable.hidden = YES;
        _numberOfComments.text = [NSString stringWithFormat:@"%i", numOfComments];
        _likesLabel.text = [NSString stringWithFormat:@"%i", numOfLikes];
        _textView.text = postText;
        _profileImage.image = userImage;
    }

    - (IBAction)commentsClicked:(id)sender {
        NSLog(@"comment");
    }

    - (void)hideItems {
        [_nameLabel setHidden:YES];
        [_profileImage setHidden:YES];
        [_personTitleLable setHidden:YES];
        [_commentsButton setHidden:YES];
        [_messageUserButton setHidden:YES];
        [_numberOfComments setHidden:YES];
    }

    - (void)unhideItems {
        [_nameLabel setHidden:NO];
        [_profileImage setHidden:NO];
        [_personTitleLable setHidden:NO];
        [_commentsButton setHidden:NO];
        [_messageUserButton setHidden:NO];
        [_numberOfComments setHidden:NO];
    }

    - (void)checkHeight:(int)height {
        NSLog(@"ideaChecked");
        if(height < 210) {
            [self hideItems];
        } else {
            [self unhideItems];
        }
    }

    - (id)initWithCoder:(NSCoder *)aDecoder {
        [_textView setScrollEnabled:NO];
        
        self = [super initWithCoder:aDecoder];
        
        [_textView setScrollEnabled:YES];
        [_textView setContentOffset:CGPointZero animated:NO];
        
        return self;
    }

    - (id)initWithFrame:(CGRect)frameToBe {
        [_textView setScrollEnabled:NO];
        self = [super initWithFrame:frameToBe];
        
        [_textView setScrollEnabled:YES];
        [_textView setContentOffset:CGPointZero animated:NO];
        
        return self;
    }


@end