//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (strong, nonatomic) NSArray *verticalLayoutConstraints;
@end

@implementation FISViewController
- (IBAction)startTapped:(UIButton *)sender {
    self.timerPicker.hidden = YES;
    self.timerLabel.hidden = NO;
}

- (IBAction)pauseTapped:(UIButton *)sender {
    self.timerPicker.hidden = NO;
    self.timerLabel.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    NSArray *verticalStartButtonLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(90)-[_startButton]" options:0 metrics:nil views:viewBottomLayerDictionary];
    
    NSArray *verticalPauseButtonLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(90)-[_pauseButton]" options:0 metrics:nil views:viewBottomLayerDictionary];

    [self.bottomView addConstraints:horizontalButtonLayoutConstraints];
    [self.bottomView addConstraints:verticalPauseButtonLayoutConstraints];
    [self.bottomView addConstraints:verticalStartButtonLayoutConstraints];
    
    self.timerLabel.hidden = YES;
}

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
             withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"Trait collection = %@", newCollection);
    
    if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        [self.view removeConstraints:self.verticalLayoutConstraints];
        
        NSDictionary *viewLayer0Dictionary = NSDictionaryOfVariableBindings(_topView, _bottomView);
        
        self.verticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(32)-[_topView]|" options:0 metrics:nil views:viewLayer0Dictionary];
        
        [self.view addConstraints:self.verticalLayoutConstraints];
        self.timerLabel.hidden = NO;
        self.timerPicker.hidden = YES;
    }
    else {
        [self.view removeConstraints:self.verticalLayoutConstraints];
        
        NSDictionary *viewLayer0Dictionary = NSDictionaryOfVariableBindings(_topView, _bottomView);
        
        self.verticalLayoutConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(64)-[_topView][_bottomView(==_topView)]|" options:0 metrics:nil views:viewLayer0Dictionary];
        
        [self.view addConstraints:self.verticalLayoutConstraints];
        self.timerLabel.hidden = YES;
        self.timerPicker.hidden = NO;
    }
}

@end
