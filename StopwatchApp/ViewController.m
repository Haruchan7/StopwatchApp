//
//  ViewController.m
//  StopwatchApp
//
//  Created by Haruka on 2016/01/25.
//  Copyright © 2016年 Haruka.Shida. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UILabel *timelabel;
    UIImageView *background;
    NSTimer *stopwatch;
    NSInteger countNumber;
    UIButton *startstop;
    
    //start/stop切り替え条件用
    BOOL condition;
}

@end

@implementation ViewController

-(void)setupParts{
    background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    background.image = [UIImage imageNamed:@"image1.JPG"];
    [self.view addSubview:background];
    
    timelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    timelabel.center = CGPointMake(160, 284);
    timelabel.font = [UIFont fontWithName:@"Chalkboard Bold" size:30];
    timelabel.text = @"00";
    timelabel.textAlignment = NSTextAlignmentCenter;
    timelabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timelabel];
    
    startstop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startstop.frame = CGRectMake(0, 0, 100, 50);
    startstop.center = CGPointMake(160, 400);
    [startstop setTitle:@"START" forState:UIControlStateNormal];
    [startstop addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startstop];
    
    UIButton *reset = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    reset.frame = CGRectMake(0, 0, 100, 50);
    reset.center = CGPointMake(160, 450);
    [reset setTitle:@"RESET" forState:UIControlStateNormal];
    [reset addTarget:self action:@selector(resetCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reset];
    
    NSString *currentCount = timelabel.text;
    [timelabel setText:currentCount];
}

-(void)switchButton:(id)sender{
    if (condition == true){
        [stopwatch fire];
        [startstop setTitle:@"STOP" forState:UIControlStateNormal];
        condition = false;
    }else if(condition == false){
        [stopwatch invalidate];
        [startstop setTitle:@"START" forState:UIControlStateNormal];
        condition = true;
    }
}


-(void)countSec:(id)sender{
    NSLog(@"カウント開始");
    NSInteger *min;
    NSInteger *sec;
//    for (min = 0; sec < 60; sec++){
    timelabel.text = [NSString stringWithFormat:@"%ld : %ld",min, sec];
            }
    //    if(condition == 0){
//        [stopwatch fire];
//       [timelabel setText:]
//        condition = 1;
//    }else{
//        [stopwatch invalidate];
//        condition = 0;
//    }
//    for (countNumber = 0; i<60; i++) {
//        [timelabel setText:];
//    }
//}


- (void)resetCount:(id)sender{
    timelabel.text = @"00:00";
    [self.view addSubview:timelabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupParts];
    
    countNumber = 0;
    
    //タイマーインスタンスを作成
    stopwatch = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countSec:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

    
}

@end
