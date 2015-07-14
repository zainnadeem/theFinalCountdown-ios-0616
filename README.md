---
tags: nstimer, autolayout, rotation
languages: objc
---
# The Final Countdown

##SOLUTION:


### Using auto layout(1/4)
<video controls width="100%">
<source src="https://curriculum-content.s3.amazonaws.com/finalCountdown/finalCountdown/Autolayour%20Portion.mp4" type="video/mp4" >
  Your browser does not support the video tag. We recommend using Chrome.
  </video> 
  
  
### Using size classes (2/4)
  <video controls width="100%">
<source src="https://curriculum-content.s3.amazonaws.com/finalCountdown/finalCountdown/Size%20Classes.mp4" type="video/mp4" >
  Your browser does not support the video tag. We recommend using Chrome.
  </video> 
  
  

### Creating a separate timer class (3/4)
  <video controls width="100%">
<source src="https://curriculum-content.s3.amazonaws.com/finalCountdown/finalCountdown/TimerClass.mp4" >
  Your browser does not support the video tag. We recommend using Chrome.
  </video> 
  
  

### Putting it all together, implementing the view controller. (4/4)
 
 <video controls width="100%">
<source src="https://curriculum-content.s3.amazonaws.com/finalCountdown/finalCountdown/ViewController%20Implentation.mp4" >
  Your browser does not support the video tag. We recommend using Chrome.
  </video> 
 





Let's make a better timer app.

## The Interface:

Here is a picture of the countdown timer app in portrait:

![Portrait](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/portrait.png)

Here is a picture after you hit the Start button.

![Portrait 2](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/portrait2.png)

Your goal is to make a paired down version of this:

  * Don't do the tabBarController
  * Don't do the `When Timer Ends Button`
  * For the first iteration, just use regular buttons. That lower grey thing is half of the height of the view. 
  * Center the start/pause buttons in the lower grey sections
  * Make sure the pickerView and the label are below the `UINavigationBar`. To do this simply, just add `64` in portrait and `32` pts in landscape. 
  * For right now, when you tap the start button the uiPickerView should be hidden, and the Label with a time should be shown. Don't worry about making it work just yet.
  * When you rotate to landscape. It should just show the time label full screen. So like this:

  ![Landscape](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/landscape.png)

## Making it Work

  * Users should be able to select hours and minutes.
  * The Pause button should be disabled by default. When you hit Start, the countdown should start and the Start button should turn into Cancel.
  * During the countdown the Pause button will be enabled and should pause, not reset the countdown timer.
  * Transition over to using the `DKCircleButton` instead of regular buttons.
  * Your timer should be it's own class.
  * When you turn the timer horizontally, it should show 00:00:00 if the timer is not active.
  * Check out [NSDateComponent](http://nshipster.com/nsdatecomponents/) and `NSTimer` in the Apple Documentation.
