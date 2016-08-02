//
//  LoginField.m
//  ConvenientCharge
//
//  Created by GLf on 7/25/16.
//  Copyright © 2016 xylife. All rights reserved.
//

#import "LoginField.h"
#import "macro.h"
#import "CCTextField.h"

@interface LoginField()

@property (nonatomic, strong) CCTextField *textField;

@end

@implementation LoginField

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.textField];
        self.backgroundColor = CC_RGBA(255, 255, 255, 0.3);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textField];
        self.backgroundColor = CC_RGBA(255, 255, 255, 0.3);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textField.frame = CGRectMake(5, 10, self.frame.size.width-5, self.frame.size.height-20);
}

- (BOOL)resignFirstResponder {
    return [self.textField resignFirstResponder];
}

- (BOOL)isFirstResponder {
    return [self.textField isFirstResponder];
}

- (BOOL)becomeFirstResponder {
    return [self.textField becomeFirstResponder];
}

#pragma mark - setters

- (void)setPlaceholder:(NSString *)placeholder {
    self.textField.placeholder = placeholder;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    self.textField.secureTextEntry = secureTextEntry;
}

- (void)setTextColor:(UIColor *)textColor {
    self.textField.textColor = textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.textField.placeholderColor = placeholderColor;
}

- (void)setSymbolImageName:(NSString *)symbolImageName {
    self.textField.symbolImageName = symbolImageName;
}

- (void)setClearButtonImageName:(NSString *)clearButtonImageName {
    self.textField.clearButtonImageName = clearButtonImageName;
}

- (void)setFont:(UIFont *)font {
    self.textField.font = font;
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    self.textField.keyboardType = keyboardType;
}

#pragma mark - getters

- (CCTextField *)textField {
    if (!_textField) {
        _textField = [[CCTextField alloc] initWithFrame:CGRectZero];
    }
    return _textField;
}

- (NSString *)text {
    return self.textField.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
