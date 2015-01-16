//
//  City.m
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "City.h"

@interface City ()

@property NSString *cityName;
@property NSString *cityState;
@property UIImage *cityImage;

@end

@implementation City

-(instancetype)initWithName: (NSString *) name
                      state: (NSString *) state
                      image: (UIImage *) image
{
    self.cityName = name;
    self.cityState = state;
    self.cityImage = image;
    return self;
}

-(void) setName: (NSString *)name
{
    self.cityName = name;
}

-(void) setState: (NSString *)state
{
    self.cityState = state;
}

-(NSString *) getName
{
    return self.cityName;
}

-(NSString *) getState
{
    return self.cityState;
}

-(UIImage *) getImage
{
    return self.cityImage;
}

@end
