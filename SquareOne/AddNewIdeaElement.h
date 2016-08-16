//
//  AddNewIdeaElement.h
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/15/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewIdeaElement : UIView

    @property (weak, nonatomic) IBOutlet UITextView *textField;
    @property (weak, nonatomic) IBOutlet UILabel *charactersRemaingLabelNumber;
    @property (weak, nonatomic) IBOutlet UILabel *charactersRemainingLabelText;
    @property (weak, nonatomic) IBOutlet UIButton *button;
    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
    @property (weak, nonatomic) IBOutlet UIImageView *imageLabel;
    @property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
