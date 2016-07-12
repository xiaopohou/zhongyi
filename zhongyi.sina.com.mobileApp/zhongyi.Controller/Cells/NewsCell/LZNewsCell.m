//
//  LZNewsCell.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/12.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZNewsCell.h"
#import "LZNews.h"

@interface LZNewsCell()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCreateTime;
@property (weak, nonatomic) IBOutlet UIImageView *ImgIcon;

@end

@implementation LZNewsCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) setNewsModel:(LZNews *)newsModel
{
    _newsModel=newsModel;
    self.lblTitle.text=_newsModel.title;
    self.lblCreateTime.font=[UIFont boldSystemFontOfSize:14];
    [self.lblCreateTime setTextColor:[UIColor lightGrayColor]];
    self.lblCreateTime.text=_newsModel.createTime;
    
    if (![_newsModel.imgUrl isEqualToString:@""]) {
        [self.ImgIcon sd_setImageWithURL:[NSURL URLWithString:_newsModel.imgUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                self.ImgIcon.image=[UIImage imageNamed:@"abs_pic_broken"];
            }
        }];
    }
}

@end
