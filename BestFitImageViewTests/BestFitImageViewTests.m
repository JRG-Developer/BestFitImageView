//
//  BestFitImageViewTests.m
//  BestFitImageView
//
//  Created by Joshua Greene on 6/7/15.
//  Copyright (c) 2015 JRG-Developer. All rights reserved.
//

// Test Class
#import "BestFitImageView.h"

// Collaborators

// Test Support
#import <XCTest/XCTest.h>

#define EXP_SHORTHAND YES
#import <Expecta/Expecta.h>

#import <OCMock/OCMock.h>

@interface BestFitImageViewTests : XCTestCase
@end

@implementation BestFitImageViewTests {

  BestFitImageView *sut;
  CGRect frame;
  
  id image;
}

#pragma mark - Test Lifecycle

- (void)setUp {

  [super setUp];
  
  frame = CGRectMake(0, 0, 200, 400);
  sut = [[BestFitImageView alloc] initWithFrame:frame];
}

- (void)tearDown {
  
  [image stopMocking];
  [super tearDown];
}

#pragma mark - Given - Mocks

- (void)givenMockImageWithSize:(CGSize)size {
  
  image = OCMClassMock([UIImage class]);
  OCMStub([image size]).andReturn(size);
}

#pragma mark - setImage: - Tests

- (void)test___setImage___setsImageOnImageView {
  
  // given
  [self givenMockImageWithSize:frame.size];
  
  // when
  [sut setImage:image];
  
  // then
  expect(sut.image).to.equal(image);
}

- (void)test___setImage___ifImageWidthAndHeightLessThanFrame_setsContentMode_UIViewContentModeCenter {
  
  // given
  CGSize size = CGSizeMake(frame.size.width - 10.0f, frame.size.height - 10.0f);
  [self givenMockImageWithSize:size];
  
  UIViewContentMode expected = UIViewContentModeCenter;
  
  // when
  [sut setImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

- (void)test___setImage___ifImageWidthGreaterThanFrameWidth_setsContentMode_UIViewContentModeScaleAspectFit {
  
  // given
  CGSize size = CGSizeMake(frame.size.width + 10.0f, frame.size.height - 10.0f);
  [self givenMockImageWithSize:size];
  
  UIViewContentMode expected = UIViewContentModeScaleAspectFit;
  
  // when
  [sut setImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

- (void)test___setImage___ifImageHeightGreaterThanFrameHeight_setsContentMode_UIViewContentModeScaleAspectFit {
  
  // given
  CGSize size = CGSizeMake(frame.size.width - 10.0f, frame.size.height + 10.0f);
  [self givenMockImageWithSize:size];
  
  UIViewContentMode expected = UIViewContentModeScaleAspectFit;
  
  // when
  [sut setImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

@end
