


#import "LoginRepo.h"
#import "NLibrary/NLibrary-Swift.h"
#import "LoginViewModelProtocol.h"
@implementation LoginRepo

@synthesize firebaseService;
- (instancetype) init {
        
        return self;
    }

//- (void)setFirebaseService:(FirebaseService *)firebaseService {
//    self.firebaseService = firebaseService;
//}

- (void)signIn:(NSString *)email :(NSString *)password {
    self.firebaseService = [[FirebaseService alloc] initWithRepoSignIn:self];
    [self.firebaseService signInEmail:email password:password];
}

- (void)successfulSignIn {
    [self.viewModelDelegate successfulSignIn];
}

- (void)unsuccessfulSignIn: (NSString* ) message {
    [self.viewModelDelegate unsuccessfulSignIn:message];
}

- (void)assignViewModel: (id <LoginViewModelProtocol> ) viewModel {
    self.viewModelDelegate = viewModel;
}
@synthesize viewModelDelegate;

@end
