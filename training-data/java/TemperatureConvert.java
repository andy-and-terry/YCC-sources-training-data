import java.util.function.DoubleUnaryOperator;

public class TemperatureConvert {
    enum Unit {
        CELSIUS(v -> v, v -> v),
        FAHRENHEIT(v -> (v - 32) * 5 / 9, v -> v * 9 / 5 + 32),
        KELVIN(v -> v - 273.15, v -> v + 273.15);

        final DoubleUnaryOperator toC, fromC;

        Unit(DoubleUnaryOperator toC, DoubleUnaryOperator fromC) {
            this.toC = toC;
            this.fromC = fromC;
        }
    }

    static double convert(double v, Unit from, Unit to) {
        return to.fromC.applyAsDouble(from.toC.applyAsDouble(v));
    }

    public static void main(String[] args) {
        System.out.printf("%.2f %.2f%n", convert(100, Unit.CELSIUS, Unit.FAHRENHEIT), convert(212, Unit.FAHRENHEIT, Unit.KELVIN));
    }
}
