//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countdownTimeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonLabel;
@property (weak, nonatomic,readwrite) IBOutlet UIButton *startButtonLabel;
@property(nonatomic)NSTimeInterval countDownInterval;
@property(nonatomic)NSInteger afterRemainder;
@property(nonatomic)NSInteger remainder;
@property(nonatomic)NSTimer *myTimer;
@property(strong,nonatomic)NSString *displayText;


@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.countdownTimeLabel.hidden = YES;
    self.countdownTimeLabel.adjustsFontSizeToFitWidth = YES;
    
  

	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pauseTapped:(id)sender {
    
    if([self.pauseButtonLabel.titleLabel.text  isEqual: @"Pause"]){
    [self.pauseButtonLabel setTitle:@"Resume" forState:UIControlStateNormal];
        [self.myTimer invalidate];
    }else{
        [self.myTimer invalidate];
        [self.pauseButtonLabel setTitle:@"Pause" forState:UIControlStateNormal];
        self.countdownTimeLabel.text = self.displayText;
        
        self.myTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeTicker:
                                                                                       ) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
        
    }
    

}

-(void)updateCountDown:(NSInteger)timeInSeconds{
    
    NSLog(@"%li", timeInSeconds);
    
    NSInteger hours = timeInSeconds / (60 * 60);
    
    NSUInteger mins = (NSInteger)(((NSInteger)timeInSeconds/60)- (hours *60));
    NSInteger secs = (NSInteger)(((NSInteger)timeInSeconds-(60*mins)-(60 * hours *60)));
    
    NSLog(@"Hours:Mins:Secs %li:%li:%li", hours, mins, secs);
    
    if (hours > 0){
        self.displayText = [[NSString alloc]initWithFormat:@"%02lu : %02lu : %02lu", (unsigned long)hours, (unsigned long)mins, (unsigned long)secs];
    }else{
        self.displayText = [[NSString alloc]initWithFormat:@"%02lu : %02lu", (unsigned long)mins, (unsigned long)secs];
    }
    
    self.countdownTimeLabel.text = self.displayText;
     self.countdownTimeLabel.hidden = NO;
    
}

-(void)timeTicker:(NSTimer *)timer{
    self.remainder -= 1;
    [self updateCountDown:self.remainder];
    
    
}


- (IBAction)startTapped:(id)sender {
    
    if([self.startButtonLabel.titleLabel.text  isEqual: @"Start"]){
        self.timePicker.hidden = YES;
        
        [self.startButtonLabel setTitle:@"Cancel" forState:UIControlStateNormal];
        
        self.remainder = self.timePicker.countDownDuration;
        
   //     self.remainder = self.countDownInterval;
        [self updateCountDown:self.remainder];
//        self.afterRemainder = self.countDownInterval - self.remainder%60;
        
        self.countdownTimeLabel.hidden = NO;
        
        self.myTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeTicker:
                                                                                       ) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
        
        
        
    }else{
        //CancelButton enabled
        [self.myTimer invalidate];
        [self.startButtonLabel setTitle:@"Start" forState:UIControlStateNormal];
        self.timePicker.hidden = NO;
        self.countdownTimeLabel.hidden = YES;
    }
    self.pauseButtonLabel.enabled = YES;
}

- (void)viewWillAppear:(BOOL)animated
{


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
