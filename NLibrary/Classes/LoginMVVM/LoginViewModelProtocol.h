
#ifndef LoginViewModelProtocol_h
#define LoginViewModelProtocol_h


#import "LoginRepoProtocol.h"
//#import "LoginViewControllerProtocol.h"
@protocol  LoginViewControllerProtocol;
@protocol LoginViewModelProtocol <NSObject>

@property (nonatomic, strong) id <LoginRepoProtocol> repoDelegate;
@property (nonatomic, strong) id <LoginViewControllerProtocol> viewControllerDelegate;

@required
- (instancetype) initWithrepo:(id<LoginRepoProtocol> ) repo
               viewController:(id<LoginViewControllerProtocol> )viewController;
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn: (NSString* )message;
@end

#endif


