//
//  DetailViewController.h
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol DetailViewControllerDelegate <NSObject>

-(void)changeTitle: (NSString *) newTitle;

@end

@interface DetailViewController : UIViewController

@property City *selectedCity;

@property (nonatomic, weak) id<DetailViewControllerDelegate> delegate;

@end
