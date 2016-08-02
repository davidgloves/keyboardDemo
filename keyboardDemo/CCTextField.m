//
//  CCTextField.m
//  ConvenientCharge
//
//  Created by GLf on 7/25/16.
//  Copyright © 2016 xylife. All rights reserved.
//

#import "CCTextField.h"
#import "macro.h"

@interface CCTextField()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *symbolImageView;
@property (nonatomic, strong) UITextField *infoField;
@property (nonatomic, strong) UIButton *textfieldClearButton;

@end

@implementation CCTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.symbolImageView];
        [self addSubview:self.infoField];
        [self setDefaultConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.symbolImageView];
        [self addSubview:self.infoField];
        [self setDefaultConfig];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.symbolImageView.frame = CGRectMake((self.frame.size.height-16)/2.0, (self.frame.size.height-16)/2.0-1, 16, 16);
    self.infoField.frame = CGRectMake(self.symbolImageView.frame.size.width+self.symbolImageView.frame.origin.x*2, 0, self.frame.size.width-self.frame.size.height-10, self.frame.size.height);
    self.textfieldClearButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
}

- (void)setDefaultConfig {
    self.secureTextEntry = NO;
    self.font = [UIFont systemFontOfSize:14];
    self.clearButtonImageName = @"delete";
}

- (BOOL)resignFirstResponder {
    return [self.infoField resignFirstResponder];
}

- (BOOL)isFirstResponder {
    return [self.infoField isFirstResponder];
}

- (BOOL)becomeFirstResponder {
    return [self.infoField becomeFirstResponder];
}

#pragma mark - actions

- (void)clearText:(UIButton *)button {
    if (self.infoField.editing) {
        self.infoField.text = @"";
    }
}

#pragma mark - setters

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.infoField.placeholder = placeholder;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    _secureTextEntry = secureTextEntry;
    self.infoField.secureTextEntry = secureTextEntry;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.infoField.textColor = textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self.infoField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
//    self.infoField.placeholder = @"";
//    self.infoField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
}

- (void)setSymbolImageName:(NSString *)symbolImageName {
    [self.symbolImageView setImage:[UIImage imageNamed:symbolImageName]];
}

- (void)setClearButtonImageName:(NSString *)clearButtonImageName {
    [self.textfieldClearButton setImage:[UIImage imageNamed:clearButtonImageName] forState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.infoField.font = font;
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    self.infoField.keyboardType = keyboardType;
}

#pragma mark - getters

- (UIImageView *)symbolImageView {
    if (!_symbolImageView) {
        _symbolImageView = [[UIImageView alloc] init];
    }
    return _symbolImageView;
}

- (UITextField *)infoField {
    if (!_infoField) {
        _infoField = [[UITextField alloc] init];
        _infoField.textAlignment = NSTextAlignmentLeft;
        _infoField.rightView = self.textfieldClearButton;
        _infoField.rightViewMode = UITextFieldViewModeWhileEditing;
        _infoField.delegate = self;
        _infoField.spellCheckingType = UITextSpellCheckingTypeNo;
        _infoField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return _infoField;
}

- (UIButton *)textfieldClearButton {
    if (!_textfieldClearButton) {
        _textfieldClearButton = [[UIButton alloc] init];
        [_textfieldClearButton addTarget:self action:@selector(clearText:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textfieldClearButton;
}

- (NSString *)text {
    return self.infoField.text;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"textFieldDidEndEditing" object:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"textFieldDidBeginEditing" object:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
