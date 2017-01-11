//
//  FSGovernment.m
//  NotificationsDZ
//
//  Created by Elerman on 04.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "FSGovernment.h"


NSString* const FSGovernmentTaxLevelDidChangeNotification = @"FSGovernmentTaxLevelDidChangeNotification";
NSString* const FSGovernmentSalaryDidChangeNotification = @"FSGovernmentSalaryDidChangeNotification";
NSString* const FSGovernmentPensionDidChangeNotification = @"FSGovernmentPensionDidChangeNotification";
NSString* const FSGovernmentAveragePriceDidChangeNotification =@"FSGovernmentAveragePriceDidChangeNotification";
NSString* const FSGovernmentInflationDidChangeNotification =@"FSGovernmentInflationDidChangeNotification";

NSString* const FSGovernmentTaxLevelUserInfoKey = @"FSGovernmentTaxLevelUserInfoKey";
NSString* const FSGovernmentSalaryUserInfoKey = @"FSGovernmentSalaryUserInfoKey";
NSString* const FSGovernmentPensionUserInfoKey = @"FSGovernmentPensionUserInfoKey";
NSString* const FSGovernmentAveragePriceUserInfoKey = @"FSGovernmentAveragePriceUserInfoKey";
NSString* const FSGovernmentInflationUserInfoKey =@"FSGovernmentInflationUserInfoKey";


@implementation FSGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000;
        self.pension = 300;
        self.averagePrice = 10.f;
        
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel{
    _taxLevel = taxLevel;
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:FSGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FSGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dict];
    
}


- (void) setSalary:(CGFloat)salary{
    
    _salary = salary;
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:FSGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FSGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dict];
    
}

- (void) setPension:(CGFloat)pension{
    _pension = pension;
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:FSGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FSGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dict];
    
}

- (void) setAveragePrice:(CGFloat)averagePrice{
    _averagePrice = averagePrice;
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:FSGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FSGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dict];
}

- (void) setInflation:(CGFloat)inflation{
    _inflation = inflation;
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:inflation] forKey:FSGovernmentInflationUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FSGovernmentInflationDidChangeNotification
                                                        object:nil
                                                      userInfo:dict];
}

@end
