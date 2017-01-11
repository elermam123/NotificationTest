//
//  FSPensioner.m
//  NotificationsDZ
//
//  Created by Elerman on 07.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "FSPensioner.h"
#import "FSGovernment.h"


@implementation FSPensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.averagePrice = 8.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:FSGovernmentPensionDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:FSGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        
    }
    return self;
}

- (void) pensionChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentPensionUserInfoKey];
    
    CGFloat pension = [value floatValue];
    if (pension < self.pension){
        NSLog(@"Pensioner are not happy");
        
    }
    else{
        
        NSLog(@"Pensioner are happy");
    }
    
    self.pension = pension;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    if (averagePrice < self.averagePrice){
        NSLog(@"Pensioner are happy for average price");
        
    }
    else{
        
        NSLog(@"Pensioner are not happy for average price");
    }
    
    self.averagePrice = averagePrice;
}


-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
