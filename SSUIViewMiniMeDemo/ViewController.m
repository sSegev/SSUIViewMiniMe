//
//  ViewController.m
//  SSUIViewMiniMeDemo
//
//  Created by i7Mac on 12/15/13.
//  Copyright (c) 2013 Segev. All rights reserved.
//

#import "ViewController.h"
#import "SSUIViewMiniMe.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height
#define BUTTON_SIZE 10

@interface ViewController () <SSUIViewMiniMeDelegate>

@end

@implementation ViewController
{
    SSUIViewMiniMe *ssMiniMeView;
    NSInteger row;
    NSInteger col;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *tempView = [[UIView alloc]initWithFrame:self.view.frame];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BigPic"]];
    imgView.frame = tempView.frame;
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [tempView addSubview:imgView];
    row=0;
    col=0;
    
	for(int i=0;i<ceil((HEIGHT/BUTTON_SIZE)) * (WIDTH/BUTTON_SIZE);i++)
    {
        UIButton *seatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        seatButton.frame = CGRectMake(col*BUTTON_SIZE, row*BUTTON_SIZE, BUTTON_SIZE, BUTTON_SIZE);
        [seatButton addTarget:self
                       action:@selector(aMethod:)
             forControlEvents:UIControlEventTouchUpInside];
        seatButton.tag = i;
        [tempView addSubview:seatButton];
        if(WIDTH<=seatButton.frame.origin.x + BUTTON_SIZE)
        {
            col = 0;
            row++;
        }
        else
        {
            col++;
        }
    }
    ssMiniMeView = [[SSUIViewMiniMe alloc]initWithView:tempView withRatio:4];
    ssMiniMeView.delegate = self;
    [self.view addSubview:ssMiniMeView];
}

- (void)aMethod:(UIButton *)sender
{
    NSLog(@"Button #%d Selected",sender.tag);
    if(sender.isSelected)
    {
        sender.selected = NO;
        [sender setBackgroundColor:[UIColor clearColor]];
        
    }
    
    else
    {
        sender.selected = YES;
        [sender setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
    }
}

- (void)enlargedView:(SSUIViewMiniMe *)enlargedView willBeginDragging:(UIScrollView *)scrollView
{
    //Delegate Example
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
