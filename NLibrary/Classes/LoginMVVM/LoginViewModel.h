



#import <Foundation/Foundation.h>
#import "LoginViewModelProtocol.h"

//#ifndef LoginViewModel_h
//#define LoginViewModel_h

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject<LoginViewModelProtocol>
- (void)signIn: (NSString* )email
              : (NSString* )password;
- (void)successfulSignIn;
- (void)unsuccessfulSignIn;
@end

NS_ASSUME_NONNULL_END
//#endif
