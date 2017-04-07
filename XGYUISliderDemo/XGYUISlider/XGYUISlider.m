//
//  XGYUISlider.m
//  XGYUISliderDemo
//
//  Created by xgy on 2017/4/4.
//  Copyright © 2017年 com.xgy.yzsd. All rights reserved.
//

#import "XGYUISlider.h"
#define LABELWIDTH 60
#define LABELHEIGHT 24
#define LABELX -20
#define LABELY -36
#define KScreenW [[UIScreen mainScreen] bounds].size.width // 屏幕宽度

@interface XGYUISlider()<UIGestureRecognizerDelegate>

@end

@implementation XGYUISlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    _label.text = [NSString stringWithFormat:@"%@",self.numberArr[0]];

}

//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self setup];
//}

-(void)setup{
    self.clipsToBounds = NO;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(LABELX, LABELY, LABELWIDTH, LABELHEIGHT)];
//    _label.backgroundColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    NSLog(@"%@",self.numberArr);
    _label.text = [NSString stringWithFormat:@"%@",self.numberArr[0]];
    [self addSubview:_label];
//    [self setLabelPositionFromValue:self.value];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapGesture:)];
    _tapGesture.delegate = self;
    [self addGestureRecognizer:_tapGesture];

}


-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    BOOL flag = [super continueTrackingWithTouch:touch withEvent:event];
    [self setLabelPositionFromValue:self.value];
    return flag;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
}

-(void)setLabelPositionFromValue:(float)value {
    
    [UIView animateWithDuration:0.5 animations:^{
//        _label.text = [NSString stringWithFormat:@"%.2f",self.value];
        NSUInteger index = (NSUInteger)(self.value + 0.5);
        NSNumber *number = self.numberArr[index];
        _label.text = [NSString stringWithFormat:@"%@",number];

        _label.frame = CGRectMake(self.frame.size.width * (self.value / (self.maximumValue -  self.minimumValue)) - 30, LABELY, LABELWIDTH, LABELHEIGHT);
    }];
}


- (void)actionTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint touchPoint = [sender locationInView:self];
    CGFloat value = (self.maximumValue - self.minimumValue) * (touchPoint.x / self.frame.size.width );
    NSUInteger index = (NSUInteger)(value + 0.5);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self setValue:index animated:YES];
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        NSUInteger index = (NSUInteger)(self.value + 0.5);
        NSNumber *number = self.numberArr[index];
        _label.text = [NSString stringWithFormat:@"%@",number];//[NSString stringWithFormat:@"%.2f",self.value];
        
        _label.frame = CGRectMake(self.frame.size.width * (self.value / (self.maximumValue -  self.minimumValue)) - 30, LABELY, LABELWIDTH, LABELHEIGHT);
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //    [self setSliderPopupPositionFromValue:self.value];
}

// 控制slider的宽和高，这个方法才是真正的改变slider滑道的高的
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.3);
}

//-(UIImage*) OriginImage:(UIImage*)image scaleToSize:(CGSize)size
//{
//    UIGraphicsBeginImageContext(size);//size为CGSize类型，即你所需要的图片尺寸
//    
//    [image drawInRect:CGRectMake(0, 0, size.width * 0.5, size.height * 0.5)];
//    
//    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return scaledImage;
//}
//
//- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {
//    
//    
//}
@end

