//
//  BEEUtilitiesHelper.m
//  beezy-bee
//
//  Created by Hiroshi on 2/1/16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "BEEUtilitiesHelper.h"

@implementation BEEUtilitiesHelper

+ (instancetype) sharedInstance
{
    static BEEUtilitiesHelper *sharedStore;
    
    if (!sharedStore)
        sharedStore = [[self alloc] initPrivate];
    
    return sharedStore;
}

- (instancetype) init
{
    [NSException raise:@"Singleton" format:@"Use [BEEUtilitiesHelper sharedInstance]"];
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self)
    {
       //
    }
    return self;
}

- (UIColor *) goldColor
{
    return [UIColor colorWithRed:218.0/255.0 green:165.0/255.0  blue:32.0/255.0 alpha:0.5];
}

@end
