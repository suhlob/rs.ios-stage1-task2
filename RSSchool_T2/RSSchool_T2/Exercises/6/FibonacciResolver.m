#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    long prev = 0, curr = 1;
    long multiplied = prev * curr;

    while (multiplied < [number intValue]) {
        long temp = curr;
        curr += prev;
        prev = temp;
        multiplied = prev * curr;
    }
    
    int isEqual = multiplied == [number intValue] ? 1 : 0;
    return @[@(prev), @(curr), @(isEqual)];
}
@end
