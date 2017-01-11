//
//  FSDoctor.m
//  NotificationsDZ
//
//  Created by Elerman on 04.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "FSDoctor.h"
#import "FSGovernment.h"
#import "AppDelegate.h"

@implementation FSDoctor


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.averagePrice = 11.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
                selector:@selector(salaryChangedNotification:)
                name:FSGovernmentSalaryDidChangeNotification
                object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:FSGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(appDelegateBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(appDelegateForegroundNotification:)
                   name:appDelNotification
                 object:nil];

        
        
    }
    return self;
}

#pragma mark - Notifications

- (void) salaryChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    if (salary < self.salary){
        NSLog(@"Doctors are not happy");
        
    }
    else{
        
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    if (averagePrice < self.averagePrice){
        NSLog(@"Doctor are happy for average price");
        
    }
    else{
        
        NSLog(@"Doctor are not happy for average price");
    }
    
    self.averagePrice = averagePrice;
}

- (void) appDelegateBackgroundNotification: (NSNotification*) notification{
          NSLog(@" doctor goes to background");
}

- (void) appDelegateForegroundNotification: (NSNotification*) notification{
    
    NSString* stringIfoNotification = [notification.userInfo objectForKey:appDelUserInfoKey];
    NSLog(@"doctor is %@", stringIfoNotification);
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
