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
//@class Game;
NS_ASSUME_NONNULL_BEGIN

@interface HexToUIColor : NSObject
-(UIColor *) getUIColorObjectFor;//: (NSString*) hexColorCode;
-(instancetype) init;//:(NSString *)hexColorCode;
-(instancetype) initWithhexcode:(NSString *)hexColorCode;
@property UIColor *color;
@property NSString* hexcode;
@end

NS_ASSUME_NONNULL_END
