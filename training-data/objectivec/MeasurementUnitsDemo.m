#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        // NSMeasurement pairs a value with a typed unit, so conversions are safe.
        NSMeasurement<NSUnitLength *> *run =
            [[NSMeasurement alloc] initWithDoubleValue:5.0 unit:NSUnitLength.kilometers];
        NSMeasurement *miles = [run measurementByConvertingToUnit:NSUnitLength.miles];
        NSLog(@"%.2f km = %.3f mi", run.doubleValue, miles.doubleValue);

        // Arithmetic between compatible units converts automatically.
        NSMeasurement<NSUnitLength *> *extra =
            [[NSMeasurement alloc] initWithDoubleValue:500 unit:NSUnitLength.meters];
        NSMeasurement *total = [run measurementByAddingMeasurement:extra];
        NSLog(@"total: %.1f %@", total.doubleValue, total.unit.symbol);

        NSMeasurement<NSUnitTemperature *> *boil =
            [[NSMeasurement alloc] initWithDoubleValue:100 unit:NSUnitTemperature.celsius];
        NSLog(@"boiling: %.1f F",
              [boil measurementByConvertingToUnit:NSUnitTemperature.fahrenheit].doubleValue);

        // NSMeasurementFormatter renders locale-aware text.
        NSMeasurementFormatter *fmt = [[NSMeasurementFormatter alloc] init];
        fmt.unitOptions = NSMeasurementFormatterUnitOptionsProvidedUnit;
        fmt.numberFormatter.maximumFractionDigits = 1;
        NSLog(@"formatted: %@", [fmt stringFromMeasurement:run]);
    }
    return 0;
}
