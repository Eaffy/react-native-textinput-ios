//
//  RNGTextField.m
//  taochemao
//
//  Created by Eafy on 2018/7/31.
//  Copyright © 2018年 emao. All rights reserved.
//

#import "RNGTextField.h"

@implementation RNGTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
  _placeholderTextColor = placeholderTextColor;
  [self _updatePlaceholder];
}

- (void)_updatePlaceholder {
  if (self.placeholder == nil) {
    return;
  }
  
  NSMutableDictionary *attributes = [NSMutableDictionary new];
  if (_placeholderTextColor) {
    [attributes setObject:_placeholderTextColor forKey:NSForegroundColorAttributeName];
  }
  
  self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
}

@end
