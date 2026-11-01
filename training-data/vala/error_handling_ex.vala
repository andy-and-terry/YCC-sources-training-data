errordomain MathError { DIV_ZERO }

double divide (double a, double b) throws MathError {
    if (b == 0) throw new MathError.DIV_ZERO ("division by zero");
    return a / b;
}

void main () {
    try {
        print ("%f\n", divide (1, 4));
        divide (1, 0);
    } catch (MathError e) {
        print ("error: %s\n", e.message);
    }
}
