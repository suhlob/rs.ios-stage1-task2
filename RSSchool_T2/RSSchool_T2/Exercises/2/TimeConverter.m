#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSArray *nums = @[@"zero", @"one", @"two", @"three", @"four",
                               @"five", @"six", @"seven", @"eight", @"nine",
                               @"ten", @"eleven", @"twelve", @"thirteen",
                               @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                               @"eighteen", @"nineteen", @"twenty", @"twenty one",
                               @"twenty two", @"twenty three", @"twenty four",
                               @"twenty five", @"twenty six", @"twenty seven",
                               @"twenty eight", @"twenty nine"
    ];
    
    int minutesInInt = [minutes intValue];
    int hoursInInt = [hours intValue];
    
    if (minutesInInt >= 60 || minutesInInt < 0)
        return @"";
    
      else if (minutesInInt == 0)
        return [NSString stringWithFormat:@"%@ o' clock", [nums objectAtIndex:hoursInInt]];

      else if (minutesInInt == 1)
        return [NSString stringWithFormat:@"one minute past %@", [nums objectAtIndex:hoursInInt]];

      else if (minutesInInt == 59)
          return [NSString stringWithFormat:@"one minute to %@", [nums objectAtIndex:(hoursInInt % 12 + 1)]];

      else if (minutesInInt == 15)
          return [NSString stringWithFormat:@"quarter past %@", [nums objectAtIndex:hoursInInt]];

      else if (minutesInInt == 30)
          return [NSString stringWithFormat:@"half past %@", [nums objectAtIndex:hoursInInt]];

      else if (minutesInInt == 45)
          return [NSString stringWithFormat:@"quarter to %@", [nums objectAtIndex:(hoursInInt % 12 + 1)]];

      else if (minutesInInt < 30)
          return [NSString stringWithFormat:@"%@ minutes past %@", [nums objectAtIndex:minutesInInt], [nums objectAtIndex:hoursInInt]];

      else if (minutesInInt > 30)
          return [NSString stringWithFormat:@"%@ minutes to %@", [nums objectAtIndex:(60 - minutesInInt)], [nums objectAtIndex:hoursInInt % 12 + 1]];
    
    return @"";
}
@end
