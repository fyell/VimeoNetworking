//
//  NSError+Presentable.swift
//  Vimeo
//
//  Created by King, Gavin on 10/3/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

extension NSError
{
    func serverErrorCode() -> Int?
    {
        var code = self.vimeoServerErrorCode
        
        if code == VimeoErrorCode.InvalidRequestInput.rawValue, let invalidParametersErrorCode = self.vimeoInvalidParametersErrorCodes.first
        {
            code = invalidParametersErrorCode;
        }
        
        return code
    }
    
    func localErrorCode() -> Int?
    {
        return (self.userInfo[VimeoErrorKey.VimeoErrorCode.rawValue] as? NSNumber)?.integerValue
    }
}
