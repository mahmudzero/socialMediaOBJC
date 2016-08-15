//
//  IdeaModel.h
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/13/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IdeaModel : NSObject {
    NSString * text;
    NSString * name;
    NSString * imgUrl;
    int numOfComments;
    int numOfLikes;
    
}

@end
