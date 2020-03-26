



#import <UIKit/UIKit.h>
//#import <NLibrary-umbrella.h>
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject<LoginViewModelProtocol>
- (void)signIn: (NSString* )email
              : (NSString* )password;
- (void)successfulSignIn;
- (void)unsuccessfulSignIn;
@end

NS_ASSUME_NONNULL_END
