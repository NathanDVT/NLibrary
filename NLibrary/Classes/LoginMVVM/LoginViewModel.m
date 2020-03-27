


#import "LoginViewModel.h"
#import "LoginViewControllerProtocol.h"
@implementation LoginViewModel
    - (instancetype) initWithrepo:(id<LoginRepoProtocol> ) repo
                   viewController:(id<LoginViewControllerProtocol> )viewController {
        
        if ( self = [super init] ) {
            self.repoDelegate = repo;
            self.viewControllerDelegate = viewController;
            [self.repoDelegate assignViewModel: self];
        }
        return self;
    }

    - (void)signIn: (NSString* )email
                  : (NSString* )password {
            [self.repoDelegate signIn:email :password];
        }

    - (void)successfulSignIn {
        [self.viewControllerDelegate successfulSignIn];
    }

    - (void)unsuccessfulSignIn: (NSString* )message {
        [self.viewControllerDelegate unsuccessfulSignIn:message];
    }

    @synthesize viewControllerDelegate;
    @synthesize repoDelegate;

@end
