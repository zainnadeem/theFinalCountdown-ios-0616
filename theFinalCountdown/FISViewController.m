//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <DKCircleButton/DKCircleButton.h>

@interface FISViewController ()
@property (strong, nonatomic) FISTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;

@property (strong, nonatomic) DKCircleButton *startButton;
@property (strong, nonatomic) DKCircleButton *pauseButton;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (strong, nonatomic) NSArray *verticalLayoutConstraints;
@end

@implementation FISViewController

#pragma mark - View controller lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addTimerButtons];
    [self setStartingAutoLayout];
    
    self.timerPicker.datePickerMode = UIDatePickerModeCountDownTimer; //so we can get the countdownDuration
    self.timerLabel.hidden = YES;
}



#pragma mark - Layout methods
- (void)addTimerButtons {
    self.startButton = [[DKCircleButton alloc] init];
    self.pauseButton = [[DKCircleButton alloc] init];
    
    [self.startButton addTarget:self action:@selector(startTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.pauseButton addTarget:self action:@selector(pauseTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pauseButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    self.pauseButton.enabled = NO;
    
    [self.bottomView addSubview:self.startButton];
    [self.bottomView addSubview:self.pauseButton];
}

-(void)setStartingAutoLayout {
    
    [self.view removeConstraints:self.view.constraints];
    [self.timerLabel removeConstraints:self.timerLabel.constraints];
    [self.timerPicker removeConstraints:self.timerPicker.constraints];
    [self.startButton removeConstraints:self.startButton.constraints];
    [self.pauseButton removeConstraints:self.pauseButton.constraints];
    [self.topView removeConstraints:self.topView.constraints];
    [self.bottomView removeConstraints:self.bottomView.constraints];
    
    //[self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.timerLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.timerPicker setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.startButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pauseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.topView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *viewLayer0Dictionary = NSDictionaryOfVariableBindings(_topView, _bottomView);
    NSDictionary *viewTopLayerDictionary = NSDictionaryOfVariableBindings(_timerLabel, _timerPicker);
    NSDictionary *viewBottomLayerDictionary = NSDictionaryOfVariableBindings(_startButton, _pauseButton);
    
    self.verticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(64)-[_topView][_bottomView(==_topView)]|" options:0 metrics:nil views:viewLayer0Dictionary];
    
    NSArray *horizontalTopViewLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_topView]|" options:0 metrics:nil views:viewLayer0Dictionary];
    
    NSArray *horizontalBottomViewLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomView]|" options:0 metrics:nil views:viewLayer0Dictionary];
    
    [self.view addConstraints:self.verticalLayoutConstraints];
    [self.view addConstraints:horizontalTopViewLayoutConstraints];
    [self.view addConstraints:horizontalBottomViewLayoutConstraints];
    
    NSArray *horizontalTimerLabelLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_timerLabel]|" options:0 metrics:nil views:viewTopLayerDictionary];
    
    NSArray *verticalTimerLabelLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_timerLabel]|" options:0 metrics:nil views:viewTopLayerDictionary];
    
    NSArray *horizontalTimerPickerLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_timerPicker]|" options:0 metrics:nil views:viewTopLayerDictionary];
    
    NSArray *verticalTimerPickerLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_timerPicker]|" options:0 metrics:nil views:viewTopLayerDictionary];
    
    [self.topView addConstraints:horizontalTimerLabelLayoutConstraints];
    [self.topView addConstraints:horizontalTimerPickerLayoutConstraints];
    [self.topView addConstraints:verticalTimerLabelLayoutConstraints];
    [self.topView addConstraints:verticalTimerPickerLayoutConstraints];
    
    NSArray *horizontalButtonLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(<=60)-[_startButton(==80)]-(>=20)-[_pauseButton(==_startButton)]-(<=60)-|" options:0 metrics:nil views:viewBottomLayerDictionary];
    
    NSArray *verticalStartButtonLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(90)-[_startButton(==80)]" options:0 metrics:nil views:viewBottomLayerDictionary];
    
    NSArray *verticalPauseButtonLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(90)-[_pauseButton(==80)]" options:0 metrics:nil views:viewBottomLayerDictionary];
    
    [self.bottomView addConstraints:horizontalButtonLayoutConstraints];
    [self.bottomView addConstraints:verticalPauseButtonLayoutConstraints];
    [self.bottomView addConstraints:verticalStartButtonLayoutConstraints];
    
}



#pragma mark - UITraitEnvironmenDelegateProtocol Methods

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
             withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"Trait collection = %@", newCollection);
    
    NSDictionary *viewLayer0Dictionary = NSDictionaryOfVariableBindings(_topView, _bottomView);
    [self.view removeConstraints:self.verticalLayoutConstraints];

    if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        
        self.verticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(32)-[_topView]|" options:0 metrics:nil views:viewLayer0Dictionary];
        
        self.timerLabel.font = [UIFont systemFontOfSize:140]; //could use a sizeToFit metric instead.   
        
        self.timerLabel.hidden = NO;
        self.timerPicker.hidden = YES;
        
        if (!self.timer.paused) {
            self.timerLabel.text = @"00:00:00";
        }
    }
    else {
        
        self.verticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(64)-[_topView][_bottomView(==_topView)]|" options:0 metrics:nil views:viewLayer0Dictionary];
        
        self.timerLabel.font = [UIFont systemFontOfSize:80]; //could use a sizeToFit metric alternative instead.
        
        if (!self.timer.paused && ![self.timer.timer isValid]) {[self.view removeConstraints:self.verticalLayoutConstraints];
            self.timerLabel.hidden = YES;
            self.timerPicker.hidden = NO;
        }
        else {
            self.timerLabel.hidden = NO;
            self.timerPicker.hidden = YES;
        }
    }
    
    [self.view addConstraints:self.verticalLayoutConstraints];

}

#pragma mark - Actions
- (IBAction)startTapped:(UIButton *)sender {
    self.timerPicker.hidden = YES;
    self.timerLabel.hidden = NO;
    if ([self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        [self.startButton setTitle:@"Cancel" forState:UIControlStateNormal];
        self.pauseButton.enabled = YES;
        NSTimeInterval interval = self.timerPicker.countDownDuration;
        self.timerLabel.text = [self turnIntervalIntoTimeString:interval];
        self.timer = [[FISTimer alloc] initWithTimeRemaining:interval];
        self.timer.delegate = self;
        [self.timer startCountdown];
        
    }
    else {
        self.timerPicker.hidden = NO;
        self.timerLabel.hidden = YES;
        self.pauseButton.enabled = NO;
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.timer cancelCountdown];
    }
}

- (IBAction)pauseTapped:(UIButton *)sender {
    if ([self.pauseButton.titleLabel.text isEqualToString:@"Continue"]) {
        [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.timer startCountdown];
    }
    else {
        [self.pauseButton setTitle:@"Continue" forState:UIControlStateNormal];
        [self.timer pauseCountdown];
    }
}


#pragma mark - FISTimerDelegateProtocol Methods
-(void)didUpdateWithTimeInterval:(NSTimeInterval)interval {
    
    NSString *timeString = [self turnIntervalIntoTimeString:interval];
    self.timerLabel.text = timeString;
}

-(NSString *)turnIntervalIntoTimeString:(NSTimeInterval)interval {
    NSInteger hours = (((NSInteger) interval) / (60 * 60));
    NSInteger minutes = (((NSInteger) interval) / 60) - (hours * 60);
    NSInteger seconds = ((NSInteger) round(interval)) % 60;
    
    return [NSString stringWithFormat:@"%02li:%02li:%02li",(long)hours,(long)minutes,(long)seconds];
}

@end
