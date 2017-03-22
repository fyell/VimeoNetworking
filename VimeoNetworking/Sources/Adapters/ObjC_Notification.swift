//
//  ObjC_Notification.swift
//  Vimeo
//
//  Created by King, Gavin on 9/22/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit

class ObjC_Notification: NSObject
{
    static let ClientDidReceiveInvalidTokenError = Notification.ClientDidReceiveInvalidTokenError.rawValue

    static let ReachabilityDidChange = Notification.ReachabilityDidChange.rawValue

    static let AuthenticatedAccountDidChange = Notification.AuthenticatedAccountDidChange.rawValue
    
    static let AuthenticatedAccountDidRefresh = Notification.AuthenticatedAccountDidRefresh.rawValue
}