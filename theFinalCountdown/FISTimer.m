//
//  FISTimerObjc.m
//  theFinalCountdown
//
//  Created by Zachary Drossman on 1/12/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISTimer.h"

@interface FISTimer ()

@property (nonatomic) NSTimeInterval lastTime;
@property (strong, nonatomic, readwrite) NSTimer *timer;
@property (nonatomic, readwrite) BOOL paused;

@end

@implementation FISTimer

-(instancetype)initWithTimeRemaining:(NSTimeInterval)interval {
    
    self = [super init];
    
    if (self) {
        _timeRemaining = interval;
    }
    
    return self;
}

-(void) updateTime {
    
    self.timeRemaining -= 1;
    
    if (self.timeRemaining == 0) {
        [self stopCountdown];
    }
    
    [self.delegate didUpdateWithTimeInterval:self.timeRemaining];
}

-(void)startCountdown {
    SEL updateTimeSelector = @selector(updateTime);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)1 target:self selector:updateTimeSelector userInfo:nil repeats:YES];
    self.paused = NO;
}


-(void)stopCountdown {
    [self.timer invalidate];
    self.timer = nil;
}

-(NSTimeInterval)pauseCountdown {
    [self stopCountdown];
    self.paused = YES;
    return self.timeRemaining;
}

-(void)cancelCountdown {
    [self stopCountdown];
    self.paused = NO;
}

@end
