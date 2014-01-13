//
//  Message.h
//  Geurunnal
//
//  Created by ias on 2014. 1. 13..
//  Copyright (c) 2014년 ias. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property NSString *sender;
@property NSString *receiver;
@property NSString *content;
@property BOOL *reported;
@property BOOL *read;
@property NSDate *createdAt;

@end
