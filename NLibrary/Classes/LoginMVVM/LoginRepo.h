
#ifndef LoginRepoProtocol_h
#define LoginRepoProtocol_h
//@class ArtistMe
//public protocol SignUpVCprotocol: class {
//    func successfulSignIn()
//    func unsuccessfulSignIn(message: String)
//}

@protocol LoginRepoProtocol
    - (void)signIn: (NSString* )email
                  : (NSString* )password;
    - (void)successfulSignIn;
    - (void)unsuccessfulSignIn;
@end

#endif
