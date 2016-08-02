//
//  LoginField.h
//  ConvenientCharge
//
//  Created by GLf on 7/25/16.
//  Copyright © 2016 xylife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginField : UIView

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, assign) BOOL secureTextEntry;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) NSString *symbolImageName;
@property (nonatomic, strong) NSString *clearButtonImageName;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) UIKeyboardType keyboardType;

@end
