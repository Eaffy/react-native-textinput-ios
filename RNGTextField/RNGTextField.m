//
//  RNGTextFieldManager.m
//  taochemao
//
//  Created by Eafy on 2018/7/31.
//  Copyright © 2018年 emao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import "RNGTextField.h"
#import <React/RCTFont.h>

@interface RNGTextFieldManager : RCTViewManager<UITextFieldDelegate>
@end

@implementation RNGTextFieldManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(placeholder, NSString)
RCT_EXPORT_VIEW_PROPERTY(maxLength, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onEndEditing, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(returnKeyType, UIReturnKeyType)
RCT_CUSTOM_VIEW_PROPERTY(placeholderTextColor, UIColor, RNGTextField)
{
    [view setValue: [RCTConvert UIColor:json] forKeyPath: @"_placeholderLabel.textColor"];
}
RCT_CUSTOM_VIEW_PROPERTY(textAlign, NSTextAlignment, RNGTextField)
{
    [view setTextAlignment:[RCTConvert NSTextAlignment:json]];
}
RCT_EXPORT_VIEW_PROPERTY(textColor, UIColor)
RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSNumber, RNGTextField)
{
    view.font = [RCTFont updateFont:view.font withSize:json ?: @(defaultView.font.pointSize)];
}
//RCT_CUSTOM_VIEW_PROPERTY(placeholderTextColor, UIColor, RNGTextField){
//    view.placeholderTextColor = [RCTConvert UIColor:json];
//}

- (UIView *)view
{
    RNGTextField *textField = [[RNGTextField alloc] init];
    textField.delegate = self;
    [textField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    return textField;
}


- (void)textFieldDidChanged:(RNGTextField *)textField {
    UITextRange *range = textField.markedTextRange;
    NSUInteger maxLength = textField.maxLength.unsignedIntegerValue;

    if (!range && maxLength) {
        NSString *str = textField.text;
        if (str.length > maxLength) {
            str = [str substringToIndex:maxLength];
            textField.text = str;
        }
    }
    if (textField.onChange) {
        textField.onChange(@{@"text": textField.attributedText.string});
    }
}

- (void)textFieldDidEndEditing:(RNGTextField *)textField {
    if (textField.onEndEditing) {
        textField.onEndEditing(@{@"text": textField.attributedText.string});
    }
}

@end
