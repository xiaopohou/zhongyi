//
//  LZCollectionViewCell.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/1.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZCollectionViewCell.h"
#import "LZCollectionViewContentTableView.h"

@interface LZCollectionViewCell()
@property (nonatomic,strong) LZCollectionViewContentTableView *CollectionViewContentTableView;
@end


@implementation LZCollectionViewCell
-(LZCollectionViewContentTableView *) CollectionViewContentTableView
{
    if (_CollectionViewContentTableView==nil) {
        _CollectionViewContentTableView=[[LZCollectionViewContentTableView alloc]init];
    }
    return  _CollectionViewContentTableView;
}

-(void) setUrl:(NSString *)url
{
    _url=url;
}
-(void) setTitle:(NSString *)title
{
    _title=title;
    self.CollectionViewContentTableView.title=_title;
    self.CollectionViewContentTableView.url=_url;
    self.CollectionViewContentTableView.tableView.frame=self.bounds;
    [self.contentView addSubview:self.CollectionViewContentTableView];
}
@end