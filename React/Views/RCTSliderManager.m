/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "RCTSliderManager.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTSlider.h"
#import "NSView+React.h"

@implementation RCTSliderManager

RCT_EXPORT_MODULE()

- (NSView *)view
{
  RCTSlider *slider = [RCTSlider new];
//  [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
//  [slider addTarget:self action:@selector(sliderTouchEnd:) forControlEvents:(UIControlEventTouchUpInside |
//                                                                             UIControlEventTouchUpOutside |
//                                                                             UIControlEventTouchCancel)];
  return slider;
}

static void RCTSendSliderEvent(RCTSlider *sender, BOOL continuous)
{
  if (sender.onChange) {
    sender.onChange(@{
      @"value": @"1", // TODO: real value
      @"continuous": @(continuous),
    });
  }
}

- (void)sliderValueChanged:(RCTSlider *)sender
{
  RCTSendSliderEvent(sender, YES);
}

- (void)sliderTouchEnd:(RCTSlider *)sender
{
  RCTSendSliderEvent(sender, NO);
}

RCT_EXPORT_VIEW_PROPERTY(value, float);
RCT_EXPORT_VIEW_PROPERTY(minimumValue, float);
RCT_EXPORT_VIEW_PROPERTY(maximumValue, float);
RCT_EXPORT_VIEW_PROPERTY(minimumTrackTintColor, NSColor);
RCT_EXPORT_VIEW_PROPERTY(maximumTrackTintColor, NSColor);
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock);

@end
