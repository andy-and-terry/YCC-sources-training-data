public class LinearRegression {
    record Model(double slope, double intercept) {}

    public static Model fit(double[] xs, double[] ys) {
        int n = xs.length;
        double meanX = 0, meanY = 0;
        for (int i = 0; i < n; i++) {
            meanX += xs[i];
            meanY += ys[i];
        }
        meanX /= n;
        meanY /= n;

        double numerator = 0, denominator = 0;
        for (int i = 0; i < n; i++) {
            numerator += (xs[i] - meanX) * (ys[i] - meanY);
            denominator += (xs[i] - meanX) * (xs[i] - meanX);
        }
        double slope = numerator / denominator;
        double intercept = meanY - slope * meanX;
        return new Model(slope, intercept);
    }

    public static double predict(Model model, double x) {
        return model.slope() * x + model.intercept();
    }

    public static void main(String[] args) {
        double[] xs = {1, 2, 3, 4, 5};
        double[] ys = {2, 4, 5, 4, 5};
        Model model = fit(xs, ys);
        System.out.printf("y = %.2fx + %.2f%n", model.slope(), model.intercept());
        System.out.println(predict(model, 6));
    }
}
