//
//  ViewController.m
//  ObjcSimpleGame
//
//  Created by RODRIGO FRANCISCO PABLO on 18/11/24.
//

#import "ViewController.h"
#import "ObjcSimpleGame-Swift.h"
#import "MockLoginEndpoint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MockLoginEndpoint *mockEndpoint = [[MockLoginEndpoint alloc] init: @"https://fakeapi.com/login" parameters: nil];
    
    MockApiClient *client = [MockApiClient new];
    
    [client executeRequestWith: mockEndpoint];
    
    [mockEndpoint getCount:@"an url" completion:^(int result) {
        NSLog(@"The result is %d", result);
    }];
}


@end
