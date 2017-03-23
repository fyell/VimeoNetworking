//
//  ObjC_AppConfiguration.swift
//  Vimeo
//
//  Created by King, Gavin on 9/26/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit
import VimeoCommon

class ObjC_AppConfiguration: NSObject
{
    private let swiftSurrogate: AppConfiguration
        
    init(appConfiguration: AppConfiguration)
    {
        self.swiftSurrogate = appConfiguration
        
        super.init()
    }
    
    var baseURL: NSURL?
    {
        return VimeoBaseURLString
    }
    
    var apiVersion: String?
    {
        return self.swiftSurrogate.apiVersion
    }
}
