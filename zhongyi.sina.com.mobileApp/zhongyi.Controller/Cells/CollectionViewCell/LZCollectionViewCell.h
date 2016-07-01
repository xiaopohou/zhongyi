//
//  LZCollectionViewCell.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/1.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZClassModel.h"

@interface LZCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) LZClassModel *model;
@end
