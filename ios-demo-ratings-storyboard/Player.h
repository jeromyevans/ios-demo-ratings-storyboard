//
//  Player.h
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 18/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
