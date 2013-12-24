//
//  SSUIViewMiniMe.h
//  SSUIViewMiniMeDemo
//
//  Created by Segev on 12/13/13.
//  Copyright (c) 2013 Segev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSUIViewMiniMe;

@protocol SSUIViewMiniMeDelegate <NSObject>

@optional
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView willBeginDragging:(UIScrollView *)scrollView;
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didScroll:(UIScrollView *)scrollView;
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didEndDragging:(UIScrollView *)scrollView;
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView willBeginDecelerating:(UIScrollView *)scrollView;
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didEndDecelerating:(UIScrollView *)scrollView;
@end

@interface SSUIViewMiniMe : UIView <UIScrollViewDelegate>

@property (nonatomic, assign) id<SSUIViewMiniMeDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
-(SSUIViewMiniMe *)initWithView:(UIView *)viewToMap withRatio:(NSInteger)ratio;
@end
