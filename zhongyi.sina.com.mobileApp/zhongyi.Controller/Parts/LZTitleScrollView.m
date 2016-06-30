//
//  LZTitleScrollView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZTitleScrollView.h"
#import "LZClassModel.h"
@implementation LZTitleScrollView

-(instancetype) initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator=NO;
        

    }
    return  self;
}


//设置数据源
-(void) setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    CGFloat titleLabelWith = 0;
    if (titleArray.count==3) {
        titleLabelWith=[UIScreen mainScreen].bounds.size.width*1.0/3;
    }else
    {
         titleLabelWith  = [UIScreen mainScreen].bounds.size.width *1.0/ 7;
    }
    for (int i=0; i<_titleArray.count; i++) {
        
        LZClassModel *classModel=_titleArray[i];
        
        //算坐标
        CGFloat titleLableX=i*titleLabelWith;
        CGFloat titleLableY=0;
        CGFloat titleLableH=self.frame.size.height;
        
        
        UILabel *titleLable=[[UILabel alloc]init];
        titleLable.tag=i;
        titleLable.frame=CGRectMake(titleLableX, titleLableY, titleLabelWith, titleLableH);
        titleLable.text=classModel.title;
        titleLable.textColor=[UIColor redColor];
        titleLable.textAlignment=NSTextAlignmentCenter;
        titleLable.userInteractionEnabled=YES;//可交互
        [titleLable addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(classLableClick:)]];
        if (i==0) {
            titleLable.textColor = [UIColor colorWithRed:22.0/255.0 green:147.0/255.0 blue:114.0/255.0 alpha:1.0];
            titleLable.backgroundColor=[UIColor redColor];
        }
        [self addSubview:titleLable];
    }
    self.contentSize=CGSizeMake(_titleArray.count*titleLabelWith, self.frame.size.height);
    self.backgroundColor=[UIColor blackColor];
}




//点击事件
-(void)classLableClick:(UITapGestureRecognizer *)sender
{
    UILabel *currentLable=(UILabel *)sender.view;
    if ([self.titleDelegate respondsToSelector:@selector(titleScrollView:withLabel:)]) {
        [self.titleDelegate titleScrollView:self withLabel:currentLable];
    }
}



@end
