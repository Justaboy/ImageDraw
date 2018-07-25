//
//  MyView.m
//  ImageDraw
//
//  Created by song on 13-7-11.
//  Copyright (c) 2013年 song. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        myData = [[NSMutableData alloc] init];
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.cocoachina.com/cms/uploads/allimg/130709/11412TO7-0.png"]];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        NSLog(@"test1");
        [conn start];
        
        
        myView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 497, 542)];
        [self addSubview:myView];
        self.contentSize = CGSizeMake(500, 600);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    [myImage drawAtPoint:CGPointMake(0, 0)];
}



#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [myData appendData:data];
    myImage = [UIImage imageWithData:myData];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    persent = 0.000;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(redrawPersent) userInfo:nil repeats:YES];
}

-(void)redrawPersent
{
    persent = persent + 0.05;
    if (persent>1) {
        persent = 1;
    }
    NSUInteger totalLength = [myData length];
    NSUInteger currentLength = totalLength*persent;

    NSData *currentData = [NSData dataWithBytes:[myData bytes] length:currentLength];
    myImage = [UIImage imageWithData:currentData];
    myView.image = myImage;
    [myView setNeedsDisplay];
//    [self setNeedsDisplay];
}




@end
