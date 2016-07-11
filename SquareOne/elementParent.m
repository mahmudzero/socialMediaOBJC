//
//  elementParent.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/11/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "elementParent.h"

@implementation elementParent

    -(id) initWithCoder:(NSCoder *)aDecoder {
        
        self = [super initWithCoder:aDecoder];
        
        CGRect superView = self.superview.frame;
        float width = superView.size.width;
        
        CGRect frameToUse = self.frame;
        frameToUse.size = CGSizeMake(width - 10, 50);
        
        if(self) {
            
            self.frame = frameToUse;
            self.center = CGPointMake(width / 2, 50);
            
        }
        
        return self;
    }

    -(id) initWithFrame:(CGRect)frameToBe {
    
        self = [super initWithFrame:frameToBe];
    
        CGRect superView = self.superview.frame;
        float width = superView.size.width;
    
        CGRect frameToUse = self.frame;
        frameToUse.size = CGSizeMake(600, 50);
    
        if(self) {
        
            self.frame = frameToUse;
            self.center = CGPointMake(width / 2, 50);
        
        }
    
        return self;
    }


@end