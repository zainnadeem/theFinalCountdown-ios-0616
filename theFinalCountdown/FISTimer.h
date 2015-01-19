//
//  FISTimerObjc.h
//  theFinalCountdown
//
//  Created by Zachary Drossman on 1/12/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FISTimerProtocol <NSObject>
@required
-(void)didUpdateWithTimeInterval:(NSTimeInterval)interval;

@end

@interface FISTimer : NSObject

@property (nonatomic) NSTimeInterval timeRemaining;
@property (nonatomic, weak) id<FISTimerProtocol> delegate;
@property (strong, nonatomic, readonly) NSTimer *timer;
@property (nonatomic, readonly) BOOL paused;

-(instancetype)initWithTimeRemaining:(NSTimeInterval)interval;
-(void)startCountdown;
-(void)cancelCountdown;
-(NSTimeInterval)pauseCountdown;

@end
