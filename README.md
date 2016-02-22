
# The Final Countdown

Let's make a better timer app.

## The Interface:

Start with some theme music by [listening to this amazing cover song.](https://www.youtube.com/watch?v=XAg5KjnAhuU)

Here is a picture of the countdown timer app in portrait:

![Portrait](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/portrait.png)

Here is a picture after you hit the Start button.

![Portrait 2](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/portrait2.png)

Your goal is to make a pared down version of this:

  * Don't do the tab bar along the bottom
  * Don't do the `When Timer Ends` feature
  * For the first iteration, just use regular buttons. That lower grey thing is half of the height of the view. 
  * Center the start/pause buttons in the lower grey sections
  * For right now, when you tap the start button the `UIPickerView` should be hidden, and the label with a time should be shown. Don't worry about making it work just yet.

## Making it Work

  * Users should be able to select hours and minutes.
  * The Pause button should be disabled by default. When you hit Start, the countdown should start and the Start button should turn into Cancel.
  * During the countdown the Pause button will be enabled and should pause, not reset the countdown timer.
  * Check out `NSTimer` in the Apple Documentation, and perhaps [NSDateComponents](http://nshipster.com/nsdatecomponents/).

## Extra Credit

  * When you rotate to landscape, have it just show the time label full screen like this:

  ![Landscape](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/theFinalCountdown/landscape.png)
  
  * In landscape, if the timer is not active, show `00:00:00`.
  * Make your timer its own class that can be paused, stopped, and resumed and track its own internal state.
  * Try using [DKCircleButton](https://github.com/kronik/DKCircleButton) instead of regular buttons.


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/theFinalCountdown' title='The Final Countdown'>The Final Countdown</a> on Learn.co and start learning to code for free.</p>
