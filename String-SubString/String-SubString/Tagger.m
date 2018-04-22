//
//  Tagger.m
//  String-SubString
//
//  Created by Алексей on 20.04.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

#import "Tagger.h"

@implementation Tagger

-(NSArray *)splitStringByTags {
    
    // Dictionary of separate arrays (like stacks in this case) for each tag
    NSDictionary *tagStacks = @{@"<" : [NSMutableArray array],
                                   @"(" : [NSMutableArray array],
                                   @"[" : [NSMutableArray array],
                                   };
    
    NSDictionary *closingTags =@{@">": @"<",
                                @")": @"(",
                                @"]": @"["
                                };
    
    NSMutableArray *strings = [NSMutableArray array];
    
    for (int i = 0; i < [_sourceString length]; i++) {
        
        // String with each symbol of the source string
        NSString *symbol = [_sourceString substringWithRange:NSMakeRange(i, 1)];
        
        if ([[tagStacks allKeys] containsObject:symbol]) {
            
            // Add the index of the opening tag to the appropriate array
            [tagStacks[symbol] addObject:[NSNumber numberWithInt:i]];
            
        } else if ([[closingTags allKeys] containsObject:symbol]) {
            
            // Get from the appropriate array the index of the last opening tag
            NSNumber* openingTagIndex = [tagStacks[closingTags[symbol]] lastObject];
            
            // Get the substring between the opening and the closing tags
            NSString *string = [_sourceString substringWithRange:NSMakeRange([openingTagIndex integerValue] + 1, i - [openingTagIndex integerValue] - 1)];
            
            [tagStacks[closingTags[symbol]] removeLastObject];
            
            [strings addObject:string];
        }
    }
    
    return strings;
}

- (instancetype)initWithString: (NSString*) sourceString
{
    self = [super init];
    if (self) {
        [sourceString retain];
        _sourceString = sourceString;
    }
    return self;
}

-(void)dealloc {
    [_sourceString release];
    [super dealloc];
}

@end
