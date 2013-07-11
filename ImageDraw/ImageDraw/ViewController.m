//
//  ViewController.m
//  ImageDraw
//
//  Created by song on 13-7-11.
//  Copyright (c) 2013年 song. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    myview = [[UIImageView alloc] initWithImage:<#(UIImage *)#>]
    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:view];
    
    

}





@end
