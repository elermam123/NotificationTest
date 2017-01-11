//
//  FSBuisness.m
//  NotificationsDZ
//
//  Created by Elerman on 07.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "FSBuisness.h"
#import "FSGovernment.h"


@implementation FSBuisness

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.averagePrice = 15.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:FSGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:FSGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(inflationChangedNotification:)
                   name:FSGovernmentInflationDidChangeNotification
                 object:nil];
        
        
    }
    return self;
}

- (void) taxLevelChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    if (taxLevel < self.taxLevel){
        NSLog(@"Buisnessman are happy");
        
    }
    else{
        
        NSLog(@"Buisnessman are not happy");
    }
    
    self.taxLevel = taxLevel;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    if (averagePrice < self.averagePrice){
        NSLog(@"Buisnessman are happy for average price");
        
    }
    else{
        
        NSLog(@"Buisnessman are not happy for average price");
    }
    
    self.averagePrice = averagePrice;
    
}

- (void) inflationChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:FSGovernmentInflationUserInfoKey];
    
    CGFloat inflation = [value floatValue];
    
    if(inflation < 1 && inflation > 0.5){
        NSLog(@"Buisness is failure! inflation is %.2f", inflation);
        
    }
    else if(inflation >= 0.1 && inflation < 0.4){
        NSLog(@"Buisness is normal! inflation is %.2f", inflation);

    }
    
    
    
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
