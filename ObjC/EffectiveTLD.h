//
//  EffectiveTLD.h
//  Common
//
//  Created by Foster Yin on 6/20/13.
//
//

#import <Foundation/Foundation.h>

@interface EffectiveTLD : NSObject

+ (NSString *)getBaseDomainFromHost:(NSString *)host;

@end
