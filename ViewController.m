//
//  ViewController.m
//  WatchLog2
//
//  Created by Kitao Akiko on 13/04/25.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

NSDate *stdate;
BOOL timeflg=FALSE;

- (void)onTimer:(NSTimer*)timer {
    if(timeflg){
        NSDate *now = [NSDate date];
        self->timeDisplay.text = [NSString stringWithFormat:@"%.3f",
                         [now timeIntervalSinceDate:stdate]];
    }
}

- (IBAction)pushStartStop:(id)sender
{
    if (timeflg == FALSE) {  // push Start
        timeflg = TRUE;
        stdate = [NSDate date];
    }
    else {  // push Stop
        timeflg = FALSE;
    }
}

- (IBAction)pushReset:(id)sender
{
    timeflg = FALSE;
    self->timeDisplay.text = @"0.00";
}


- (void)dealloc
{
    [timer invalidate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    timeflg = FALSE;
    self->timeDisplay.text = @"0.00";
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
