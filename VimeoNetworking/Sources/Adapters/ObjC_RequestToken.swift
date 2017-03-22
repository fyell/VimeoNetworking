//
//  ObjC_RequestToken.swift
//  Vimeo
//
//  Created by King, Gavin on 10/25/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit

class ObjC_RequestToken: NSObject
{
    private let swiftSurrogate: VimeoClient.RequestToken
    
    init(requestToken: VimeoClient.RequestToken)
    {
        self.swiftSurrogate = requestToken
        
        super.init()
    }
    
    func cancel()
    {
        return self.swiftSurrogate.cancel()
    }
}
