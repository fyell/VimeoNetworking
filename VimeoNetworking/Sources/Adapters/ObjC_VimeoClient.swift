//
//  ObjC_VimeoClient.swift
//  Vimeo
//
//  Created by King, Gavin on 9/14/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit

class ObjC_VimeoClient: NSObject
{
    let swiftSurrogate: VimeoClient

    static let sharedClient = ObjC_VimeoClient(client: VimeoClient.sharedClient)
    
    // MARK: Initializers
    
    init(client: VimeoClient)
    {
        self.swiftSurrogate = client

        super.init()
    }

    // MARK: Account
    
    var currentAccount: VIMAccount?
    {
        return self.swiftSurrogate.currentAccount
    }
}

// MARK: Requests made from Objective-C code

extension ObjC_VimeoClient
{
    // MARK: Video Requests
    
    func requestVideo(videoURI videoURI: String, completion: VideoErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMVideo>.getVideoRequest(videoURI: videoURI)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success(let result):
                
                let video = result.model
                
                completion(video: video, error: nil)
                
            case .Failure(let error):
                
                completion(video: nil, error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    func requestPasswordProtectedVideo(videoURI videoURI: String, password: String, completion: VideoErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMVideo>.passwordProtectedVideoRequest(videoURI: videoURI, password: password)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success(let result):
                
                let video = result.model
                
                completion(video: video, error: nil)
                
            case .Failure(let error):
                
                completion(video: nil, error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
}

extension ObjC_VimeoClient
{
    typealias TriggerErrorClosure = (trigger: VIMTrigger?, error: NSError?) -> Void
    typealias TriggersErrorClosure = (triggers: [VIMTrigger]?, error: NSError?) -> Void
    
    // MARK: Push Notification Requests
    typealias SubscriptionCollectionErrorClosure = (subscriptionCollection: SubscriptionCollection?, error: NSError?) -> Void
    
    
    func registerForPushNotifications(withDeviceToken deviceToken: String, parameters: VimeoClient.RequestParametersDictionary, completion: ErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMNullResponse>.registerDeviceForPushNotifications(withDeviceToken: deviceToken, parameters: parameters)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success:
                
                completion(error: nil)
                
            case .Failure(let error):
                
                completion(error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    func unregisterForPushNotifications(withDeviceToken deviceToken: String, parameters: VimeoClient.RequestParametersDictionary, completion: ErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMNullResponse>.unregisterDeviceForPushNotifications(withDeviceToken: deviceToken, parameters: parameters)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success:
                
                completion(error: nil)
                
            case .Failure(let error):
                
                completion(error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    func getNotificationSubscriptions(completion: SubscriptionCollectionErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<SubscriptionCollection>.getNotificationSubscription()
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success(let result):
                
                let subscriptionCollection = result.model
                completion(subscriptionCollection: subscriptionCollection, error: nil)
                
            case .Failure(let error):
                
                completion(subscriptionCollection: nil, error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    
    @available(*, deprecated = 6.3.0, message = "TODO: Remove Deprecated method once 6.2.0 is released [JL] 02/23/2017")
    func addPushNotificationTrigger(withParameters parameters: VimeoClient.RequestParametersDictionary, completion: TriggerErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMTrigger>.addPushNotificationTrigger(withParameters: parameters)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success(let result):
                
                let trigger = result.model
                
                completion(trigger: trigger, error: nil)
                
            case .Failure(let error):
                
                completion(trigger: nil, error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    @available(*, deprecated = 6.3.0, message = "TODO: Remove Deprecated method once 6.2.0 is released [JL] 02/23/2017")
    func removePushNotificationTrigger(withTriggerURI triggerURI: String, completion: ErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<VIMNullResponse>.removePushNotificationTrigger(withTriggerURI: triggerURI)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success:
                
                completion(error: nil)
                
            case .Failure(let error):
                
                completion(error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }
    
    @available(*, deprecated = 6.3.0, message = "TODO: Remove Deprecated method once 6.2.0 is released [JL] 02/23/2017")
    func pushNotificationTriggers(withDeviceToken deviceToken: String, parameters: VimeoClient.RequestParametersArray, completion: TriggersErrorClosure) -> ObjC_RequestToken
    {
        let request = Request<[VIMTrigger]>.pushNotificationTriggers(withDeviceToken: deviceToken, parameters: parameters)
        
        let requestToken = self.swiftSurrogate.request(request) { (result) in
            
            switch result
            {
            case .Success(let result):
                
                let triggers = result.model
                
                completion(triggers: triggers, error: nil)
                
            case .Failure(let error):
                
                completion(triggers: nil, error: error)
            }
        }
        
        return ObjC_RequestToken(requestToken: requestToken)
    }

}
