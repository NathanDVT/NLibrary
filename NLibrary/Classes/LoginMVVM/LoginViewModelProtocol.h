
#ifndef LoginViewModelProtocol_h
#define LoginViewModelProtocol_h

@protocol LoginViewModelProtocol <NSObject>
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn;
@end

#endif
