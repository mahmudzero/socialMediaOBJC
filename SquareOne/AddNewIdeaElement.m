//
//  AddNewIdeaElement.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/15/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "AddNewIdeaElement.h"
#import <QuartzCore/QuartzCore.h>

@interface AddNewIdeaElement() <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *defaultLabel;

@end

@implementation AddNewIdeaElement {
    int currentCharacters;
}

    - (void)textViewDidBeginEditing:(UITextView *)textView {
        _defaultLabel.hidden = YES;
    }

    - (void)textViewDidChange:(UITextView *)txtView {
        _defaultLabel.hidden = ([txtView.text length] > 0);
    }

    - (void)textViewDidEndEditing:(UITextView *)txtView {
        _defaultLabel.hidden = ([txtView.text length] > 0);
    }

    - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
        [self updateLabel];
        return YES;
    }

    - (void)updateLabel {
        currentCharacters = (int)_textField.text.length;
        [self allowSubmit:currentCharacters];
        [_charactersRemaingLabelNumber setText:[NSString stringWithFormat:@"%i", 140 - (currentCharacters + 1)]];
    }

    - (void)allowSubmit:(int)numChars {
        if(numChars > 140) {
            _button.userInteractionEnabled = NO;
        } else {
            _button.userInteractionEnabled = YES;
        }
    }

    - (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
        self = [super awakeAfterUsingCoder:aDecoder];
        [_nameLabel setText:@"John Smith"];
        return self;
    }

    - (id)initWithCoder:(NSCoder *)aDecoder {
        self = [super initWithCoder:aDecoder];
        [_nameLabel setText:@"John Smith"];
        return self;
    }

    - (id)initWithFrame:(CGRect)frameToBe {
        
        self = [super initWithFrame:frameToBe];
        [_nameLabel setText:@"John Smith"];
        
        return self;
    }

@end
