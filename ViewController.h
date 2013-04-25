//
//  ViewController.h
//  WatchLog2
//
//  Created by Kitao Akiko on 13/04/25.
//  Copyright (c) 2013年 Kitao Akiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *timeDisplay;
 //   IBOutlet UILabel *startStop;
    IBOutlet UITableView *logView;
    NSMutableArray *log;
    NSTimer *timer;
}

-(void)onTimer:(NSTimer*)timer;
- (IBAction)pushStartStop:(id)sender;
- (IBAction)pushReset:(id)sender;

@end
