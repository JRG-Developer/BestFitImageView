##BestFitImageView

`BestFitImageView` automatically selects the best `contentMode` by comparing its image size to its frame size.

If the image width and height are *less than* the frame width and height, the `contentMode` will be set to `UIViewContentModeCenter`.

Otherwise, the `contentMode` will be set to `UIViewContentModeScaleAspectFit`.

###Installation With CocoaPods

The easiest way to add `BestFitImageView` to your project is using <a href="http://cocoapods.org/">CocoaPods</a>. Simply add the following line to your `Podfile`:

	pod 'BestFitImageView', '~> 1.0'

Then run `pod install` as you normally would.

New to CocoaPods? Check out <a href="http://www.raywenderlich.com/64546/introduction-to-cocoapods-2">this tutorial</a>, and you'll be setup in no time.

###Manual Installation

You can manually include `BestFitImageView` by doing the following:

1) Clone this repo locally onto your computer, or press `Download ZIP` to simply download the latest master commit.

2) Drag `BestFitImageView.h` and `BestFitImageView.m` into your project, making sure `Copy items into destination group's folder (if needed)` is checked.

###How to Use

Use `BestFitImageView` where you would normally you use `UIImageView`. The `contentMode` will be automatically set for you based on the size of the image.

Other than this, `BestFitImageView` behaves the same way as `UIImageView` does.

###Limitations

`BestFitImageView` *only* considers the size of its `image` to determine the `contentMode`.

For the best results, related images (e.g. `highlightedImage`) should be the same size.

###License

`BestFitImageView` is available under the MIT license (see the `LICENSE` file for more details).