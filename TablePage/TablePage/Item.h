//
//  Item.h
//  TablePage
//
//  Created by guoruizhou on 11/22/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * order;

@end
