//
//  XGYUISlider.h
//  XGYUISliderDemo
//
//  Created by xgy on 2017/4/4.
//  Copyright © 2017年 com.xgy.yzsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XGYUISlider : UISlider
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UIGestureRecognizer *tapGesture;
@property (nonatomic, strong)NSArray *numberArr;
@end
