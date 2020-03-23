#import "Blocks.h"

@implementation Blocks {
    NSArray* _array;
    BlockC _block;
}

- (BlockA) blockA {
    return [^(NSArray *receivedData) {
        _array = [receivedData copy];
    } copy];
}

- (BlockB) blockB {
    return [^(Class class) {
        
        if ([NSString class] == class) {
            NSString *operationResult = @"";
            
            for (NSObject *element in _array) {
                if ([element isKindOfClass:class]) {
                    operationResult = [operationResult stringByAppendingString:(NSString *)element];
                }
            }
            
            _block(operationResult);
        } else if ([NSNumber class] == class) {
            int result = 0;
            
            for (NSObject *item in _array) {
                if ([item isKindOfClass:class]) {
                    result += [(NSNumber *)item intValue];
                }
            }
            
            _block([[NSNumber alloc] initWithInt:result]);
        } else if ([NSDate class] == class) {
           NSTimeInterval result = 0;
            
            for (NSObject *elem in _array) {
                if ([elem isKindOfClass:class]) {
                    NSTimeInterval timeInterval = [(NSDate *)elem timeIntervalSince1970];
                    
                    if (timeInterval > result) {
                        result = timeInterval;
                    };
                }
            }
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:result];
            NSString *resultStringDate = [dateFormatter stringFromDate:date];
                            
            _block(resultStringDate);
        }

    } copy];
}

- (void) setBlockC: (BlockC) block {
    _block = [block copy];
};

@end
