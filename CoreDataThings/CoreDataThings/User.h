//
//  User.h
//  CoreDataThings
//
//  Created by guoruizhou on 11/7/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Record;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) Record *records;

@end
