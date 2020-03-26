
#import "LoginViewModelProtocol.h"

@protocol LoginViewControllerProtocol

@property (nonatomic, strong) id <LoginViewModelProtocol> viewModelDelegate;
@required
    - (void)signin: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn;
@end
