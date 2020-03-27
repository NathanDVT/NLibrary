

#ifndef LoginViewModel_h
#define LoginViewModel_h

#import <Foundation/Foundation.h>
#import "LoginViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject<LoginViewModelProtocol>

    - (instancetype) initWithrepo:(id<LoginRepoProtocol> ) repo
    viewController:(id<LoginViewControllerProtocol> )viewController;
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn: (NSString* )message;
@end

NS_ASSUME_NONNULL_END

#endif
