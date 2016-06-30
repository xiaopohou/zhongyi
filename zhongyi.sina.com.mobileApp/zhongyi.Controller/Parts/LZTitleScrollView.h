//
//  LZTitleScrollView.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZTitleScrollView;
@protocol LZTitleScrollTitleDelegate <NSObject>
-(void) titleScrollView:(LZTitleScrollView *) sender withLabel:(UILabel *) lable;
@end

@interface LZTitleScrollView : UIScrollView

@property (nonatomic,strong)  NSArray *titleArray;
@property (nonatomic,strong) id<LZTitleScrollTitleDelegate> titleDelegate;

@end
