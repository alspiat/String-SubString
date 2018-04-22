//
//  Tagger.h
//  String-SubString
//
//  Created by Алексей on 20.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tagger : NSObject
{
    NSString *_sourceString;
}

-(NSArray*) splitStringByTags;
-(instancetype)initWithString: (NSString*) sourceString;

@end
