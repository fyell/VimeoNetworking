//
//  ObjC_AuthenticationController.swift
//  Vimeo
//
//  Created by King, Gavin on 9/14/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit
import VimeoCommon

class ObjC_AuthenticationController: NSObject
{
    private let swiftSurrogate: AuthenticationController

    init(client: ObjC_VimeoClient)
    {
        self.swiftSurrogate = AuthenticationController(client: client.swiftSurrogate)

        super.init()
    }
}

// MARK: Requests made from Objective-C code

extension ObjC_AuthenticationController
{
    typealias AccountErrorClosure = (account: VIMAccount?, error: NSError?) -> Void
    
    // MARK: Loading Accounts
    
    func loadClientCredentialsAccount() -> VIMAccount?
    {
        do
        {
            return try self.swiftSurrogate.loadClientCredentialsAccount()
        }
        catch
        {
            // TODO: We should probably surface this error to the Objective-C caller

            return nil
        }
    }
    
    func loadUserAccount() -> VIMAccount?
    {
        do
        {
            return try self.swiftSurrogate.loadUserAccount()
        }
        catch
        {
            // TODO: We should probably surface this error to the Objective-C caller

            return nil
        }
    }
    
    // MARK: Granting Accounts
    
    func clientCredentialsGrant(completion: AccountErrorClosure)
    {
        self.swiftSurrogate.clientCredentialsGrant { (result) in
            
            switch result
            {
            case .Success(let account):
                
                completion(account: account, error: nil)
                
            case .Failure(let error):
                
                completion(account: nil, error: error)
            }
        }
    }
    
    // MARK: Login and Signup
    
    func logOut()
    {
        do
        {
            try self.swiftSurrogate.logOut()
        }
        catch
        {
            // TODO: We should probably surface this error to the Objective-C caller
        }
    }
}
