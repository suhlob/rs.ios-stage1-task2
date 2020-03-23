#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString *stringToCompare = [a uppercaseString];
    NSString *stringToMatch = [NSString stringWithString:b];
    NSMutableString *resultString = [NSMutableString string];
    
    for (int i = 0; i < [stringToMatch length]; i++){
        NSString *charOfStringToMatch = [stringToMatch substringWithRange:NSMakeRange(i, 1)];
        for (int j = i; j < [stringToCompare length]; j++) {
            NSString *charOfStringToCompare = [stringToCompare substringWithRange:NSMakeRange(j, 1)];
            if ([charOfStringToCompare isEqualToString:charOfStringToMatch]) {
                [resultString appendString:charOfStringToCompare];
            }
        }
    }
    
    if ([resultString isEqualToString:stringToMatch]) {
        return @"YES";
    }
    return @"NO";
}

@end
