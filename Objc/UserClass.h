//
//  UserClass.h
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/22.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>
//@class ArtistM
@class Game;
NS_ASSUME_NONNULL_BEGIN

@interface HexToUIColor : NSObject
-(UIColor *) getUIColorObjectFor;//: (NSString*) hexColorCode;
-(instancetype) init;//:(NSString *)hexColorCode;
@property UIColor *color;
@property NSString* name;
@end

NS_ASSUME_NONNULL_END

//@implementation HexToUIColor
//-(UIColor *)getUIColorObjectFor/*: (NSString*)hexColorCode*/ {
//    {
////        NSString *hexColorCode = @"#6C5A20ff";
////        if ([hexColorCode characterAtIndex:0] == '#') {
////            int length = [hexColorCode length];
////            NSString *hexColor = [hexColorCode substringWithRange:NSMakeRange(1, length)];
////            if ([hexColorCode length] == 8) {
////                unsigned rgbHexValue = 0;
////                NSScanner *scanner = [NSScanner scannerWithString:hexColorCode];
////                [scanner setScanLocation:0];
////                [scanner scanHexInt:&rgbHexValue];
////                float rrr = ((float)((rgbHexValue & 0xFF000000) >> 24))/255.0f;
////                float ggg = ((float)((rgbHexValue & 0x00FF0000) >> 16))/255.0f;
////                float bbb = ((float)((rgbHexValue & 0x0000FF00) >> 8))/255.0f;
////                float aaa = ((float)((rgbHexValue & 0x000000FF) >> 0))/255.0f;
////                return [UIColor colorWithRed:rrr
////                green:ggg
////                 blue:bbb
////                alpha:aaa];
////            }
////        }
//        return [UIColor colorWithRed:66.0f/255.0f
//        green:79.0f/255.0f
//         blue:91.0f/255.0f
//        alpha:1.0f];
//    }
//}
//@end
