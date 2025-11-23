//
//  Level.h
//  SimpleGameFramework
//
//  Created by RODRIGO FRANCISCO PABLO on 25/11/24.
//

#import <Foundation/Foundation.h>
@class GameCharacter;

NS_ASSUME_NONNULL_BEGIN

@interface Level : NSObject

- (NSArray<GameCharacter *> *) allGameCharacters;

- (void) addCharacter: (GameCharacter *) gameCharacter;

@end

NS_ASSUME_NONNULL_END
