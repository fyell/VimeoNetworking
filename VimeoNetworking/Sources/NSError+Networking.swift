//
//  NSError+Presentable.swift
//  Vimeo
//
//  Created by King, Gavin on 10/3/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

extension NSError
{
    private static let VimeoUserMessageKey = "error"
    private static let VimeoDeveloperMessageKey = "developer_message"
    
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
    
    func vimeoErrorDomain() -> String?
    {
        return self.userInfo[VimeoErrorKey.VimeoErrorDomain.rawValue] as? String
    }
    
    func vimeoUserMessage() -> String?
    {
        return self.errorResponseBodyJSON?[self.dynamicType.VimeoUserMessageKey] as? String
    }
    
    func vimeoDeveloperMessage() -> String?
    {
        return self.errorResponseBodyJSON?[self.dynamicType.VimeoDeveloperMessageKey] as? String
    }
}
