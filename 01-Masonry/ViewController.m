//
//  ViewController.m
//  01-Masonry
//
//  Created by Mac on 16/6/6.
//  Copyright © 2016年 www.ZXZ123.com. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@property (strong, nonatomic)UIView *v1;
@property (strong, nonatomic)UIView *v2;
@property (strong, nonatomic)UIView *v3;
@property (strong, nonatomic)MASConstraint *cons ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo01];
}

- (void)demo01{

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    self.v1 = view1;

    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    self.v2 = view2;

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];


    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    self.v3 = view3;

    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
        self.cons = make.left.mas_equalTo(view1);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}


// MARK: 我们使用 mas_updateConstraints
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:2 animations:^{
        [self.v3 mas_updateConstraints:^(MASConstraintMaker *make) {
            [self.cons uninstall];
            self.cons = make.left.equalTo(self.v2.mas_left);
        }];
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {

        [UIView animateWithDuration:2 animations:^{
            [self.v3 mas_updateConstraints:^(MASConstraintMaker *make) {
                [self.cons uninstall];
                self.cons = make.left.equalTo(self.v1.mas_left);
            }];

            [self.view layoutIfNeeded];
            
        }];
        
    }];
    
}




// MARK: 我们使用 mas_remakeConstraints
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    [self.v3 mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_equalTo(self.v1.mas_bottom).offset(10);
//        self.cons = make.left.mas_equalTo(self.v2);
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//    }];
//
//
//    [UIView animateWithDuration:2 animations:^{
//        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
//
//        [UIView animateWithDuration:2 animations:^{
//
//            [self.v3 mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.top.mas_equalTo(self.v1.mas_bottom).offset(10);
//                self.cons = make.left.mas_equalTo(self.v1);
//                make.size.mas_equalTo(CGSizeMake(100, 100));
//            }];
//
//            [self.view layoutIfNeeded];
//        }];
//    }];
//
//}









@end
