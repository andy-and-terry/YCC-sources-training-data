#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSNumber *amount = @1234567.891;
        NSArray<NSString *> *ids = @[@"en_US", @"de_DE", @"fr_FR"];

        for (NSString *ident in ids) {
            NSLocale *locale = [NSLocale localeWithLocaleIdentifier:ident];

            NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
            nf.locale = locale;
            nf.numberStyle = NSNumberFormatterDecimalStyle;
            nf.maximumFractionDigits = 2;

            NSLog(@"%@ decimal sep '%@', grouping '%@' -> %@",
                  ident,
                  [locale objectForKey:NSLocaleDecimalSeparator],
                  [locale objectForKey:NSLocaleGroupingSeparator],
                  [nf stringFromNumber:amount]);
        }

        // Locale-aware display names for codes.
        NSLocale *en = [NSLocale localeWithLocaleIdentifier:@"en_US"];
        NSLog(@"country DE: %@", [en displayNameForKey:NSLocaleCountryCode value:@"DE"]);
        NSLog(@"language fr: %@", [en displayNameForKey:NSLocaleLanguageCode value:@"fr"]);
    }
    return 0;
}
