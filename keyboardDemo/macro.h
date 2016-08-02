//
//  macro.h
//  keyboardDemo
//
//  Created by GLf on 8/2/16.
//  Copyright © 2016 demo. All rights reserved.
//

#ifndef macro_h
#define macro_h

#define CCScreenWidth                        [UIScreen mainScreen].bounds.size.width
#define CCScreenHeight                       [UIScreen mainScreen].bounds.size.height

#define CC_RGB(r, g, b)            CC_RGBA((r), (g), (b), 1.0)
#define CC_RGBA(r, g, b, a)        [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a)]

#endif /* macro_h */
