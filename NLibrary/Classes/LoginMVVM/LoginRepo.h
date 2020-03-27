#ifndef LoginRepo_h
#define LoginRepo_h

#import <Foundation/Foundation.h>

#import "LoginRepoProtocol.h"

@interface LoginRepo : NSObject<LoginRepoProtocol>
    - (instancetype) init;
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn: (NSString* ) message;
    - (void)assignViewModel: (id <LoginViewModelProtocol> ) viewModel;
@end

#endif
