//
//  LoginViewController.m
//  TellusPowerGermany
//
//  Created by GLf on 7/5/16.
//  Copyright © 2016 xylife. All rights reserved.
//

#import "LoginViewController.h"
#import "macro.h"
#import "UIView+DGExtension.h"
#import "LoginField.h"

#define CC_Default_Green            CC_RGB(91, 182, 101)

@interface LoginViewController ()<UITextFieldDelegate>

@property(strong, nonatomic) UIButton *backButton;
@property(strong, nonatomic) UIImageView *logoImageView;
@property(strong, nonatomic) LoginField *phoneField;
@property(strong, nonatomic) LoginField *passwordField;
@property(strong, nonatomic) UIView *loginBackView;
@property(strong, nonatomic) UIButton *loginButton;
@property(strong, nonatomic) UIButton *forgotPasswordButton;
@property(strong, nonatomic) UIButton *signupButton;

@end

@implementation LoginViewController

#pragma mark - lifecycle

- (void)loadView {
    [super loadView];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bj_1136"]]];
    
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.phoneField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginBackView];
    [self.view addSubview:self.forgotPasswordButton];
    
    [self.loginBackView addSubview:self.loginButton];
    [self.loginBackView addSubview:self.signupButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.phoneField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self hideKeyboard];
}

#pragma mark - actions

- (void)login:(UIButton *)button {
    NSString *phone = self.phoneField.text;
    NSString *pwd = self.passwordField.text;
    NSLog(@"%@,%@", phone, pwd);
}

- (void)forgotPwd:(UIButton *)button {
}

- (void)signup:(UIButton *)button {
}

- (void)hideKeyboard {
    [self.phoneField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

#pragma mark - getters

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
        [_backButton setImage:[UIImage imageNamed:@"arrows_writer"] forState:UIControlStateNormal];
    }
    return _backButton;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) { //218*197
        CGFloat width = 109;
        CGFloat height = 109;
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((CCScreenWidth-width)/2.0, CCScreenWidth*98/320.0, width, height)];
        [_logoImageView setImage:[UIImage imageNamed:@"logo"]];
    }
    return _logoImageView;
}

- (LoginField *)phoneField {
    if (!_phoneField) {
        _phoneField = [[LoginField alloc] initWithFrame:CGRectMake(40, self.logoImageView.bottom+CCScreenWidth*0.25, CCScreenWidth-80, 40)];
        _phoneField.textColor = [UIColor whiteColor];
        _phoneField.placeholder = @"请输入手机号码";
        _phoneField.placeholderColor = CC_RGB(223, 223, 223);
        _phoneField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneField.symbolImageName = @"phone_white";
        _phoneField.clearButtonImageName = @"delete_write";
    }
    return _phoneField;
}

- (LoginField *)passwordField {
    if (!_passwordField) {
        _passwordField = [[LoginField alloc] initWithFrame:CGRectMake(self.phoneField.left, self.phoneField.bottom+15, self.phoneField.width, self.phoneField.height)];
        _passwordField.textColor = [UIColor whiteColor];
        _passwordField.placeholder = @"请输入密码";
        _passwordField.secureTextEntry = YES;
        _passwordField.placeholderColor = CC_RGB(223, 223, 223);
        _passwordField.symbolImageName = @"password_white";
        _passwordField.clearButtonImageName = @"delete_write";
    }
    return _passwordField;
}

- (UIView *)loginBackView {
    if (!_loginBackView) {
        _loginBackView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bottom-CCScreenWidth*130/320.0, CCScreenWidth, CCScreenWidth*130/320.0)];
        _loginBackView.backgroundColor = [UIColor whiteColor];
    }
    return _loginBackView;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 25, self.loginBackView.width-120, 0)];
        _loginButton.backgroundColor = CC_Default_Green;
        [_loginButton setRoundCornerWithRadius:_loginButton.height/2.0];
        _loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)forgotPasswordButton {
    if (!_forgotPasswordButton) {
        _forgotPasswordButton = [[UIButton alloc] initWithFrame:CGRectMake(self.passwordField.right-100, self.passwordField.bottom, 100, self.passwordField.height)];
        _forgotPasswordButton.backgroundColor = [UIColor clearColor];
        _forgotPasswordButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _forgotPasswordButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_forgotPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgotPasswordButton setTitleColor:CC_RGBA(255, 255, 255, 0.6) forState:UIControlStateNormal];
        [_forgotPasswordButton addTarget:self action:@selector(forgotPwd:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _forgotPasswordButton;
}

- (UIButton *)signupButton {
    if (!_signupButton) {
        _signupButton = [[UIButton alloc] initWithFrame:CGRectMake(self.loginButton.left, self.loginButton.bottom, self.loginButton.width, self.loginButton.height)];
        _signupButton.backgroundColor = [UIColor clearColor];
        _signupButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_signupButton setTitle:@"注册账号" forState:UIControlStateNormal];
        [_signupButton setTitleColor:CC_RGB(102, 102, 102) forState:UIControlStateNormal];
        [_signupButton addTarget:self action:@selector(signup:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signupButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
