//
//  ViewController.m
//  XGYUISliderDemo
//
//  Created by xgy on 2017/4/4.
//  Copyright © 2017年 com.xgy.yzsd. All rights reserved.
//

#import "ViewController.h"
#import "XGYUISlider.h"
#define KScreenW [[UIScreen mainScreen] bounds].size.width // 屏幕宽度

@interface ViewController ()<UIGestureRecognizerDelegate>{
    NSArray *numbers;
}
@property (nonatomic, strong)XGYUISlider *mySlider;
@property (nonatomic, strong)UITapGestureRecognizer *tapGesture;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    numbers = @[@(500),@(600), @(700), @(800), @(900), @(1000)];
    
    _mySlider = [[XGYUISlider alloc] initWithFrame:CGRectMake(30, 100, KScreenW - 60, 30)];
    _mySlider.numberArr = numbers;
    [self.view addSubview:_mySlider];
    
    _mySlider.continuous = YES;
    NSInteger numberOfSteps = ((float)[numbers count] - 1);
    _mySlider.maximumValue = numberOfSteps;
    _mySlider.minimumValue = 0;
    
    //使用图片
//    [_mySlider setThumbImage:[UIImage imageNamed:@"fire"] forState:UIControlStateNormal];

    [_mySlider addTarget:self
                action:@selector(valueChanged:)
      forControlEvents:UIControlEventValueChanged];
}


- (void)valueChanged:(UISlider *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        NSUInteger index = (NSUInteger)(_mySlider.value + 0.5);
        [_mySlider setValue:index animated:YES];
    }];
}


@end
