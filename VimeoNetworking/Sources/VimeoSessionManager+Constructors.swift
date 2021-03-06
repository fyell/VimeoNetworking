//
//  VimeoSessionManager+Constructors.swift
//  VimeoNetworkingExample-iOS
//
//  Created by Huebner, Rob on 3/29/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public extension VimeoSessionManager
{
    // MARK: - Default Session Initialization
    
    /**
     Creates an authenticated session manager with a static access token
     
     - parameter accessToken: the static access token to use for request serialization
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func defaultSessionManager(accessToken accessToken: String) -> VimeoSessionManager
    {
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfigurationNoCache()
        let requestSerializer = VimeoRequestSerializer(accessTokenProvider: { accessToken })
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    /**
     Creates a session manager with a block that provides an access token.  Note that if no access token is returned by the provider block, no Authorization header will be serialized with new requests, whereas a Basic Authorization header is required at minimum for all api endpoints.  For unauthenticated requests, use a constructor that accepts an `AppConfiguration`.
     
     - parameter accessTokenProvider: a block that provides an access token dynamically, called on each request serialization
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func defaultSessionManager(accessTokenProvider accessTokenProvider: VimeoRequestSerializer.AccessTokenProvider) -> VimeoSessionManager
    {
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfigurationNoCache()
        let requestSerializer = VimeoRequestSerializer(accessTokenProvider: accessTokenProvider)
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    /**
     Creates an unauthenticated session manager with a static application configuration
     
     - parameter appConfiguration: configuration used to generate the basic authentication header
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func defaultSessionManager(appConfiguration appConfiguration: AppConfiguration) -> VimeoSessionManager
    {
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfigurationNoCache()
        let requestSerializer = VimeoRequestSerializer(appConfiguration: appConfiguration)
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    // MARK: - Background Session Initialization
    
    /**
     Creates an authenticated background session manager with a static access token
     
     - parameter identifier: the background session identifier
     - parameter accessToken: the static access token to use for request serialization
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func backgroundSessionManager(identifier identifier: String, accessToken: String) -> VimeoSessionManager
    {
        let sessionConfiguration = self.backgroundSessionConfiguration(identifier: identifier)
        let requestSerializer = VimeoRequestSerializer(accessTokenProvider: { accessToken })
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    
    /**
     Creates a background session manager with a block that provides an access token.  Note that if no access token is returned by the provider block, no Authorization header will be serialized with new requests, whereas a Basic Authorization header is required at minimum for all api endpoints.  For unauthenticated requests, use a constructor that accepts an `AppConfiguration`.
     
     - parameter identifier: the background session identifier
     - parameter accessTokenProvider: a block that provides an access token dynamically, called on each request serialization
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func backgroundSessionManager(identifier identifier: String, accessTokenProvider: VimeoRequestSerializer.AccessTokenProvider) -> VimeoSessionManager
    {
        let sessionConfiguration = self.backgroundSessionConfiguration(identifier: identifier)
        let requestSerializer = VimeoRequestSerializer(accessTokenProvider: accessTokenProvider)
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    /**
     Creates an unauthenticated background session manager with a static application configuration
     
     - parameter identifier: the background session identifier
     - parameter appConfiguration: configuration used to generate the basic authentication header
     
     - returns: an initialized `VimeoSessionManager`
     */
    static func backgroundSessionManager(identifier identifier: String, appConfiguration: AppConfiguration) -> VimeoSessionManager
    {
        let sessionConfiguration = self.backgroundSessionConfiguration(identifier: identifier)
        let requestSerializer = VimeoRequestSerializer(appConfiguration: appConfiguration)
        
        return VimeoSessionManager(sessionConfiguration: sessionConfiguration, requestSerializer: requestSerializer)
    }
    
    // MARK: Private API
    
    // Would prefer that this live in a NSURLSessionConfiguration extension but the method name would conflict [AH] 2/5/2016
    
    private static func backgroundSessionConfiguration(identifier identifier: String) -> NSURLSessionConfiguration
    {
        return NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(identifier)
    }
}
