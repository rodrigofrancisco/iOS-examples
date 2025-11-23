//
//  MockLoginEndpoint.m
//  ObjcSimpleGame
//
//  Created by RODRIGO FRANCISCO PABLO on 18/11/24.
//

#import "MockLoginEndpoint.h"

@implementation MockLoginEndpoint

- (instancetype)init: (NSString *) endpoint parameters: (NSDictionary *) parameters {
    if (self = [super init]) {
        _endpoint = [NSURL URLWithString:endpoint];
        _parameters = parameters;
    }
    return self;
}

- (void)getCount:(nonnull NSString *)from completion:(nonnull void (^)(int))completionHandler {
    NSLog(@"Using the url: %@", from);
    completionHandler(5);
}

@end
