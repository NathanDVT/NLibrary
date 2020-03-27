

#ifndef LoginRepoProtocol_h
#define LoginRepoProtocol_h

//#import "realwork-Swift.h"
//#import "NLibrary/NLibrary-Swift.h"
//#import <NLibrary/FirebaseService.h>
//#import "FirebaseService.swift"
@class FirebaseService;
@protocol LoginViewModelProtocol;
//#import <FirebaseS>
//#import "LoginViewModelProtocol.h"
@protocol LoginRepoProtocol
@required
    @property FirebaseService* firebaseService;
    @property (nonatomic, strong) id <LoginViewModelProtocol> viewModelDelegate;
    - (instancetype) init;
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn: (NSString* ) message;
    - (void)assignViewModel: (id <LoginViewModelProtocol> ) viewModel;
@end

#endif
