
#ifndef LoginViewModelProtocol_h
#define LoginViewModelProtocol_h

@protocol LoginViewModelProtocol <NSObject>
@required
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn;
@end

#endif
