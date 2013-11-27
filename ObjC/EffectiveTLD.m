//
//  EffectiveTLD.m
//  Common
//
//  Created by Foster Yin on 6/20/13.
//
//

#import "EffectiveTLD.h"
#import "dkim-regdom.h"
#import "tld-canon.h"

@implementation EffectiveTLD

+ (tldnode *)TLDTree
{
    static tldnode* tree;
    if (tree == NULL)
    {
        tree = readTldTree(tldString);
    }
    return tree;
}

+ (NSString *)getBaseDomainFromHost:(NSString *)host
{
    if (host == nil || host.length == 0)
    {
        return nil;
    }
    
    char * inComingHost = (char*) malloc(strlen([host UTF8String])+1);;
    strcpy(inComingHost, [host UTF8String]);
    char * registeredDomain = getRegisteredDomain(inComingHost, [[self class] TLDTree]);
    free(inComingHost);
    NSString *retStr = [NSString stringWithUTF8String:registeredDomain];
    free(registeredDomain);
    return retStr;
}


@end
