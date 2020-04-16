
#import "LoginViewModelProtocol.h"

@protocol LoginViewControllerProtocol

@property (nonatomic, strong) id <LoginViewModelProtocol> viewModelDelegate;
@required
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn: (NSString* ) message;
@end
