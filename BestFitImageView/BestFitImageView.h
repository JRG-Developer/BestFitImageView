//
//  BestFitImageView.h
//  BestFitImageView
//
//  Created by Joshua Greene on 6/7/15.
//  Copyright (c) 2015 JRG-Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  `BestFitImageView` automatically selects the best `contentMode` by comparing the image size to the frame size.
 *
 *  @discussion  If the image width & height are *less than* the frame width & height, the `contentMode` will be set to `UIViewContentModeCenter`.
 *
 *  Otherwise, the `contentMode` will be set to `UIViewContentModeScaleAspectFit`.
 */
@interface BestFitImageView : UIImageView

@end
