//
//  LZNewsListItemCell.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZNewsListItemCell.h"
@interface LZNewsListItemCell()
@property (nonatomic,strong) UIImageView *imgBox;
@property (nonatomic,strong) UILabel *lblTitle;
@property (nonatomic,strong) UILabel *lblDescripitoin;
@property (nonatomic,strong) UILabel *lblCreateTime;
@end
@implementation LZNewsListItemCell

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withItemModel:(LZNews *)model
{
    if (model==nil) {
        return nil;
    }
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.lblTitle.frame=CGRectMake(0, 0, KScreenWidth, 300);
        self.lblTitle.text=model.title;
    }
    return self;
}
#pragma 懒加载模式
-(UILabel *) lblTitle
{
    if (_lblTitle==nil) {
        _lblTitle=[UILabel init];
    }
    return _lblTitle;
}
-(UILabel *) lblDescripitoin
{
    if (_lblDescripitoin==nil) {
        _lblDescripitoin=[UILabel init];
    }
    return _lblDescripitoin;
}
-(UIImageView *) imgBox
{
    if (_imgBox==nil) {
        _imgBox=[UIImageView init];
    }
    return _imgBox;
}
-(UILabel *) lblCreateTime
{
    if (_lblCreateTime==nil) {
        _lblCreateTime=[UILabel init];
    }
    return _lblCreateTime;
}
@end
