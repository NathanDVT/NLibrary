//
//  UserClass.m
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/23.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserClass.h"
#import <UIKit/UIColor.h>
#import <NLibrary/NLibrary-Swift.h>
@implementation HexToUIColor
-(instancetype) init {
    self = [super init];
    self.name = @"Hey";
    self.color = [self getUIColorObjectFor];
    return self;
}
-(UIColor *)getUIColorObjectFor/*: (NSString*)hexColorCode*/ {
    {
        NSString *hexColorCode = @"#6C5A20ff";
        if ([hexColorCode characterAtIndex:0] == '#') {
            unsigned long length = [hexColorCode length];
            NSString *hexColor = [hexColorCode substringWithRange:NSMakeRange(1, length-1)];
            if ([hexColor length] == 8) {
                unsigned rgbHexValue = 0;
                NSScanner *scanner = [NSScanner scannerWithString:hexColor];
                [scanner setScanLocation:0];
                [scanner scanHexInt:&rgbHexValue];
                float rrr = ((float)((rgbHexValue & 0xFF000000) >> 24))/255.0f;
                float ggg = ((float)((rgbHexValue & 0x00FF0000) >> 16))/255.0f;
                float bbb = ((float)((rgbHexValue & 0x0000FF00) >> 8))/255.0f;
                float aaa = ((float)((rgbHexValue & 0x000000FF)))/255.0f;
                return [UIColor colorWithRed:rrr
                green:ggg
                 blue:bbb
                alpha:aaa];
            }
        }
        return [UIColor colorWithRed:66.0f/255.0f
        green:79.0f/255.0f
         blue:255.0f/255.0f
        alpha:1.0f];
    }
}
@end
