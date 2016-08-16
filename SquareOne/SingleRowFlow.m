//
//  SingleRowFlow.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "SingleRowFlow.h"

@implementation SingleRowFlow

    - (id)initWithCoder:(NSCoder *)aDecoder {
        if ((self = [super initWithCoder:aDecoder])) {
            self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            self.minimumLineSpacing = 10000.0f;
        }
        return self;
    }

@end
