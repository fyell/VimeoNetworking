//
//  PresentableErrorMetadata.swift
//  Vimeo
//
//  Created by King, Gavin on 9/26/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

import UIKit

class PresentableErrorMetadata: NSObject
{
    let title: String
    let message: String
    
    init(title: String, message: String)
    {
        self.title = title
        self.message = message
    }
    
    private struct Constants
    {
        private struct Localizable
        {
            static let BatchUserDoesNotExistMessage = NSLocalizedString("Hm. We can't find one of those people.", comment: "Error message explaining that a user in your batch request does not exist.")
            
            static let BatchFollowUserRequestExceededMessage = NSLocalizedString("Whoops! You can only follow up to 100 people at a time.",  comment: "Error message explaining that you can only batch in 100 follows at a time.")
            
            static let BatchSubscribeChannelRequestExceededMessage = NSLocalizedString("Whoops! You can only follow up to 100 channels at a time.",  comment: "Error message explaining that you can only batch in 100 channels subscriptions at a time.")
            
            static let BatchChannelDoesNotExistMessage = NSLocalizedString("Hm. We can't find one of those channels.", comment: "Error message explaining that a channel in your batch request does not exist.")
            
            static let UserNotAllowedToFollowUsersMessage = NSLocalizedString("Unable to follow people.", comment: "Error message explaining that the user is not allowed to follow other users.")
            
            static let UserNotAllowedToFollowChannelsMessage = NSLocalizedString("Unable to follow channels.", comment: "Error message explaining that the user is not allowed to subscribe to channels.");
            
            static let BatchFollowUserRequestFailedMessage = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
            
            static let BatchSubscribeChannelRequestFailedMessage = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
        }
    }
    
    class func presentableMetadataFromError(error: NSError) -> PresentableErrorMetadata?
    {
        if error.isConnectionError()
        {
            let title = NSLocalizedString("No Internet", comment: "")
            let message = NSLocalizedString("Please check your connection and try again.", comment: "")
            
            return PresentableErrorMetadata(title: title, message: message)
        }
        else if let code = error.serverErrorCode()
        {
            var title: String?
            var message: String?
            
            switch code
            {
            case VimeoErrorCode.EmailTooLong.rawValue:
                
                title = NSLocalizedString("Invalid email address", comment: "")
                message = NSLocalizedString("May not exceed 128 characters.", comment: "")
                
            case VimeoErrorCode.PasswordTooShort.rawValue:
                
                title = NSLocalizedString("Invalid password", comment: "")
                message = NSLocalizedString("Password must be at least 8 characters long and contain 4 or more unique characters.", comment: "")

            case VimeoErrorCode.PasswordTooSimple.rawValue:
                
                title = NSLocalizedString("Invalid password", comment: "")
                message = NSLocalizedString("Password must be at least 8 characters long and contain 4 or more unique characters.", comment: "")
                
            case VimeoErrorCode.NameInPassword.rawValue:
                
                title = NSLocalizedString("Invalid password", comment: "")
                message = NSLocalizedString("Password cannot match your name or email.", comment: "")
                
            case VimeoErrorCode.EmailNotRecognized.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Please enter a valid email address and/or password.", comment: "")
                
            case VimeoErrorCode.PasswordEmailMismatch.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Please enter a valid email address and/or password.", comment: "")
                
            case VimeoErrorCode.NoPasswordProvided.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Please enter a valid email address and/or password.", comment: "")
                
            case VimeoErrorCode.NoEmailProvided.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Please enter a valid email address and/or password.", comment: "")
                
            case VimeoErrorCode.InvalidEmail.rawValue:
                
                title = NSLocalizedString("Invalid email address", comment: "")
                message = NSLocalizedString("Please enter a valid email address.", comment: "")
                
            case VimeoErrorCode.NoNameProvided.rawValue:
                
                title = NSLocalizedString("No name", comment: "")
                message = NSLocalizedString("Not so fast. What's your name??", comment: "")
                
            case VimeoErrorCode.NameTooLong.rawValue:
                
                title = NSLocalizedString("Invalid name", comment: "")
                message = NSLocalizedString("Name cannot exceed 32 characters.", comment: "")
                
            case VimeoErrorCode.FacebookJoinInvalidToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookJoinNoToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookJoinMissingProperty.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookJoinMalformedToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookJoinDecryptFail.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookJoinTokenTooLong.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to join via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookLoginNoToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookLoginMissingProperty.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookLoginMalformedToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookLoginDecryptFail.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookLoginTokenTooLong.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookInvalidInputGrantType.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
                
            case VimeoErrorCode.FacebookJoinValidateTokenFail.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookInvalidNoInput.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Please fill in all required fields.", comment: "")
                
            case VimeoErrorCode.FacebookInvalidToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookMissingProperty.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.FacebookMalformedToken.rawValue:
                
                title = NSLocalizedString("Zuck error", comment: "")
                message = NSLocalizedString("Unable to log in via Facebook.", comment: "")
                
            case VimeoErrorCode.EmailAlreadyRegistered.rawValue:
                
                title = NSLocalizedString("Invalid email address", comment: "")
                message = NSLocalizedString("This email address is already connected to a Vimeo account.", comment: "")
                
            case VimeoErrorCode.EmailBlocked.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Sorry, you have been temporarily blocked from Vimeo. Please try again later.", comment: "")
                
            case VimeoErrorCode.EmailSpammer.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Sorry, we can’t create an account for you at this time.", comment: "")
                
            case VimeoErrorCode.EmailPurgatory.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Sorry, you have been temporarily blocked from Vimeo. Please try again later.", comment: "")
                
            case VimeoErrorCode.URLUnavailable.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
                
            case VimeoErrorCode.Timeout.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
                
            case VimeoErrorCode.TokenNotGenerated.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
                
            case VimeoErrorCode.InvalidRequestInput.rawValue:
                
                title = NSLocalizedString("Unable to log in", comment: "")
                message = NSLocalizedString("Something strange occurred. Please try again.", comment: "Alert description")
                
            case VimeoErrorCode.UnverifiedUser.rawValue:
                
                title = NSLocalizedString("Account Verification Needed", comment: "Title for unverified user error")
                message = NSLocalizedString("Please check your email to verify your account and try again.", comment: "Message for unverified user error")
             
            case VimeoErrorCode.BatchUserDoesNotExist.rawValue:
                
                message = Constants.Localizable.BatchUserDoesNotExistMessage
                
            case VimeoErrorCode.BatchFollowUserRequestExceeded.rawValue:
               
                message = Constants.Localizable.BatchFollowUserRequestExceededMessage
                
            case VimeoErrorCode.BatchSubscribeChannelRequestExceeded.rawValue:
                
                message = Constants.Localizable.BatchSubscribeChannelRequestExceededMessage
                
            case VimeoErrorCode.BatchChannelDoesNotExist.rawValue:
                
                message = Constants.Localizable.BatchChannelDoesNotExistMessage
                
            case VimeoErrorCode.UserNotAllowedToFollowUsers.rawValue:
                
                message = Constants.Localizable.UserNotAllowedToFollowUsersMessage
                
            case VimeoErrorCode.UserNotAllowedToFollowChannels.rawValue:
                
                message = Constants.Localizable.UserNotAllowedToFollowChannelsMessage
                
            case VimeoErrorCode.BatchFollowUserRequestFailed.rawValue:
                
                message = Constants.Localizable.BatchFollowUserRequestFailedMessage
                
            case VimeoErrorCode.BatchSubscribeChannelRequestFailed.rawValue:
                
                message = Constants.Localizable.BatchSubscribeChannelRequestFailedMessage
                
            default:
                
                break
            }
            
            guard let errorMessage = message else
            {
                return nil
            }
            
            let errorTitle = title ?? ""
            
            return PresentableErrorMetadata(title: errorTitle, message: errorMessage)
        }

        return nil
    }
}
