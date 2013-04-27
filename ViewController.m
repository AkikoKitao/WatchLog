//
//  ViewController.m
//  WatchLog2
//
//  Created by Kitao Akiko on 13/04/25.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

static NSString * const TIME_ST_START = @"time state start";
static NSString * const TIME_ST_STOP  = @"time state stop";
static NSString * const TIME_ST_INIT  = @"time state init";

NSDate *stdate;
NSString *timeflg;

- (void)onTimer:(NSTimer*)timer {
    if(timeflg == TIME_ST_START){
        NSDate *now = [NSDate date];
        self->timeDisplay.text = [NSString stringWithFormat:@"%.2f",
                         [now timeIntervalSinceDate:stdate]];
    }
}

- (IBAction)pushStartStop:(id)sender
{
    if (timeflg != TIME_ST_START) {  // push Start
        timeflg = TIME_ST_START;
        stdate = [NSDate date];
        self->startStop.text = @"stop";
    }
    else {  // push Stop
        timeflg = TIME_ST_STOP;
        self->startStop.text = @"start";
    }
}

- (IBAction)pushReset:(id)sender
{
    timeflg = TIME_ST_INIT;
    self->timeDisplay.text = @"0.00";
    self->startStop.text = @"start";
}


- (void)dealloc
{
    [timer invalidate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timeflg = TIME_ST_INIT;
    self->timeDisplay.text = @"0.00";
    self->startStop.text = @"start";
    timer = [NSTimer scheduledTimerWithTimeInterval:(0.01)
                    target:self selector:@selector(onTimer:)
                    userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
