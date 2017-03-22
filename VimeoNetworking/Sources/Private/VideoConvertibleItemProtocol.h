//
//  VideoConvertibleItemProtocol.h
//  Vimeo
//
//  Created by King, Gavin on 1/15/16.
//  Copyright © 2016 Vimeo. All rights reserved.
//

@import VimeoNetworking;

@protocol VideoConvertibleItemProtocol

@required
- (VIMVideo * _Nullable)videoEquivalent;

@end
