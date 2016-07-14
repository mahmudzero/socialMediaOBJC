//
//  elementParent.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/11/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "elementParent.h"

@implementation elementParent

    -(id)initWithCoder:(NSCoder *)aDecoder {
        
        //self = [super initWithCoder:aDecoder];
        
        if(self = [super initWithCoder:aDecoder]) {
            
            CGRect frameToUse = self.bounds;
            frameToUse.size = CGSizeMake(self.superview.bounds.size.width, 50);
            
            self.bounds = frameToUse;
            self.center = CGPointMake(self.superview.bounds.size.width / 2, 50);
            
        }
        
        return self;
    }

    -(id)initWithFrame:(CGRect)frameToBe {
    
        self = [super initWithFrame:frameToBe];
    
        if(self) {
            
            CGRect frameToUse = self.frame;
            frameToUse.size = CGSizeMake(frameToBe.size.width - 10, 50);
            
            self.frame = frameToUse;
            self.center = CGPointMake(frameToBe.size.width / 2, 50);
            
        }
    
        return self;
    }


@end