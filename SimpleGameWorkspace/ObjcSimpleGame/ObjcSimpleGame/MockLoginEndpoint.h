//
//  MockLoginEndpoint.h
//  ObjcSimpleGame
//
//  Created by RODRIGO FRANCISCO PABLO on 18/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MockLoginEndpoint : NSObject

@property (nullable, nonatomic, strong) NSDictionary *parameters;
@property (nonnull, nonatomic, strong) NSURL *endpoint;

- (nonnull instancetype)init:(nonnull NSString *) endpoint parameters: (nullable NSDictionary *) parameters;

- (void)getCount:(nonnull NSString *) from completion: (void (^)(int result)) completionHandler;

@end

NS_ASSUME_NONNULL_END
