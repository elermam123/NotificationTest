//
//  FSGovernment.h
//  NotificationsDZ
//
//  Created by Elerman on 04.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString* const FSGovernmentTaxLevelDidChangeNotification;
extern NSString* const FSGovernmentSalaryDidChangeNotification;
extern NSString* const FSGovernmentPensionDidChangeNotification;
extern NSString* const FSGovernmentAveragePriceDidChangeNotification;
extern NSString* const FSGovernmentInflationDidChangeNotification;

extern NSString* const FSGovernmentTaxLevelUserInfoKey;
extern NSString* const FSGovernmentSalaryUserInfoKey;
extern NSString* const FSGovernmentPensionUserInfoKey;
extern NSString* const FSGovernmentAveragePriceUserInfoKey;
extern NSString* const FSGovernmentInflationUserInfoKey;


@interface FSGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat inflation;

@end
