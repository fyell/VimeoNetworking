//
//  ObjC_VimeoReachability.swift
//  Vimeo
//
//  Created by King, Gavin on 9/26/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit
import VimeoNetworking

class ObjC_VimeoReachability: NSObject
{
    static func reachable() -> Bool
    {
        return VimeoReachability.reachable()
    }
}
