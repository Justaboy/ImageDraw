//
//  MyView.h
//  ImageDraw
//
//  Created by song on 13-7-11.
//  Copyright (c) 2013年 song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIScrollView
{
    NSMutableData *myData;
    UIImage *myImage;
    UIImageView *myView;
    CGFloat persent;
}
@end
