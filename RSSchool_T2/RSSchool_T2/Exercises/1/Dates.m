#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *stringWithDate = [NSString stringWithFormat:@"%@/%@/%@", day, month, year];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"dd/MM/yyyy";
    NSDate *date = [fmt dateFromString:stringWithDate];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru"];

    fmt.dateFormat = @"dd MMMM, EEEE";
    
    NSString *formattedDateString = [fmt stringFromDate:date];

    return date ? formattedDateString : @"Такого дня не существует";
}

@end
