//
//  ViewController.m
//  StopwatchApp
//
//  Created by tgaiacontentsdev on 2016/01/05.
//  Copyright (c) 2016年 tgaiacontentsdev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger  countNumber;
    UILabel *timeLabel;
    NSTimer *timer;
    NSInteger watch;
    NSInteger watchM;
    NSInteger watchS;

}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    countNumber = 0;
    watch = 0;
    [self setLabel];
    [self setButton];

    

    
}

//スタート、ストップボタンを押した際の動作
-(void)pushButton:(id)sender{
    countNumber++;
    
    if (countNumber == 0||countNumber % 2 == 0) {
        if (timer != nil) {
            [timer invalidate];
            timer = nil;
            
        }
    
    
    
    }else{
        
    timer =[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(stopWatch:) userInfo:nil repeats:YES];
        
    }
    [self setButton];
    
}


//ラベルの初期表示
-(void)setLabel{
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    timeLabel.center = CGPointMake(185, 250);
    timeLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:70];
    timeLabel.text = @"00:00";
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:timeLabel];
    
}

//スタート、ストップボタンの表示を切り替える
-(void)setButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = CGPointMake(105, 420);
    if (countNumber==0||countNumber % 2 == 0 ) {
        [button setImage:[UIImage imageNamed:@"start.png" ]forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"start.png" ]forState:UIControlStateHighlighted];

    }else{
        [button setImage:[UIImage imageNamed:@"stop.png" ]forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"stop.png" ]forState:UIControlStateHighlighted];

    }
    
    [button addTarget:self action:@selector(pushButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
  
//リセットボタン

    UIButton *reset = [UIButton buttonWithType:UIButtonTypeCustom];
    reset.frame = CGRectMake(0, 0, 100, 100);
    reset.center = CGPointMake(265, 420);
    [reset setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [reset setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateHighlighted];
    
    [reset addTarget:self action:@selector(pushReset:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:reset];
    
}

//リセットボタンを押した際の動作
-(void)pushReset:(id)sender{
    countNumber = 0;
    watch = 0;
    
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    
    NSString *timeStr = [NSString stringWithFormat:@"00:0%ld",watch];
    [timeLabel setText:timeStr];
    [self setButton];
  
}



//画面に経過時間を表示させる
-(void)stopWatch:(NSTimer*)timer{
    watch++;
    NSString *timeStr;
    
    if (watch >=600){
        watchM = watch / 60;
        watchS = watch % 60;
        
        if (watchS <10) {
            timeStr = [NSString stringWithFormat:@"%ld:0%ld",watchM,watchS];
        }else{
            timeStr = [NSString stringWithFormat:@"%ld:%ld",watchM,watchS];
        }
        
    }else if(watch >= 60){
        watchM = watch / 60;
        watchS = watch % 60;
        
        if (watchS <10) {
            timeStr = [NSString stringWithFormat:@"0%ld:0%ld",watchM,watchS];
        }else{
            timeStr = [NSString stringWithFormat:@"0%ld:%ld",watchM,watchS];
        
        }
    }else if (watch >= 10){
        timeStr = [NSString stringWithFormat:@"00:%ld",watch];
    }else{
        timeStr = [NSString stringWithFormat:@"00:0%ld",watch];
        
    }
        [timeLabel setText:timeStr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
