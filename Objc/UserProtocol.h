//
//  UserProtocol.h
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/23.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#ifndef UserProtocol_h
#define UserProtocol_h
//@class ArtistMe
//public protocol SignUpVCprotocol: class {
//    func successfulSignIn()
//    func unsuccessfulSignIn(message: String)
//}

@protocol SignUpVCprotocol2
    - (void)successfulSignIn1;
    - (void)unsuccessfulSignIn1: (NSString*)message ;
@end

#endif /* UserProtocol_h */
