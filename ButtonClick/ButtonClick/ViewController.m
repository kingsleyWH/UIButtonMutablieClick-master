//
//  ViewController.m
//  ButtonClick
//
//  Created by hehe on 2017/3/14.
//  Copyright © 2017年 transfar. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+MutablieClick.h"
@interface ViewController ()
@property (nonatomic, strong) UIButton   *mutibleButton;
@property (nonatomic, strong) UIButton   *commonButton;
@property (nonatomic, strong) UIView     *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    colorView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:colorView];
    self.colorView = colorView;
    
    UIButton *mutibleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:mutibleButton];
    [mutibleButton setBackgroundColor:[UIColor grayColor]];
    mutibleButton.frame = CGRectMake(300, 100, 80, 44);
    [mutibleButton setTitle:@"runTime" forState:UIControlStateNormal];
    [mutibleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mutibleButton addTarget:self action:@selector(runTimeAction) forControlEvents:UIControlEventTouchUpInside];
    
    mutibleButton.hw_ignoreEvent = NO;
    mutibleButton.hw_acceptEventInterval = 3.0;
    
    self.mutibleButton = mutibleButton;
    
    UIButton *commonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:commonButton];
    commonButton.frame = CGRectMake(300, 200, 80, 44);
    [commonButton setBackgroundColor:[UIColor brownColor]];
    [commonButton setTitle:@"common" forState:UIControlStateNormal];
    [commonButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [commonButton addTarget:self action:@selector(nomalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.commonButton = commonButton;
    
}

- (void)nomalButtonAction {
    NSLog(@"------comm click");
    [UIView animateWithDuration:3 animations:^{
        
        self.colorView.center = CGPointMake(200, 500);
        
    } completion:^(BOOL finished) {
        
        self.colorView.center = CGPointMake(95, 85);
        
    }];
}
- (void)runTimeAction {
    NSLog(@"----run click");
    [UIView animateWithDuration:3 animations:^{
        
        self.colorView.center = CGPointMake(200, 500);
        
    } completion:^(BOOL finished) {
        
        self.colorView.center = CGPointMake(95, 85);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
