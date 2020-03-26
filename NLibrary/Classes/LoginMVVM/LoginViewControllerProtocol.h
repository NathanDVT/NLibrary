
@protocol LoginViewControllerProtocol
@required
@property (nonatomic, weak) id <LoginViewModelProtocol> viewModelDelegate;
    - (void)signin: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn;
@end
