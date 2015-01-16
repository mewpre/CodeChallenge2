//
//  City.h
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

-(instancetype)initWithName: (NSString *) name
                      state: (NSString *) state
                      image: (UIImage *) image;

-(void) setName: (NSString *)name;
-(void) setState: (NSString *)state;
-(NSString *) getName;
-(NSString *) getState;
-(UIImage *) getImage;

@end


