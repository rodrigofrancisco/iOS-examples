//
//  Level.m
//  SimpleGameFramework
//
//  Created by RODRIGO FRANCISCO PABLO on 25/11/24.
//

#import "Level.h"
#import <SimpleGameFramework/SimpleGameFramework-Swift.h>

@interface Level ()

@property (nonatomic, strong) NSMutableArray<GameCharacter *> * gameCharacters;

@end

@implementation Level

- (instancetype)init {
    if (self = [super init]) {
        self.gameCharacters = [NSMutableArray new];
        NSLog(@"The level was initialized");
        return self;
    }
    
    return self;
};

- (void) addCharacter: (GameCharacter *) gameCharacter {
    [self.gameCharacters addObject:gameCharacter];
}

- (NSArray<GameCharacter *> *) allGameCharacters {
    return self.gameCharacters;
}

@end
