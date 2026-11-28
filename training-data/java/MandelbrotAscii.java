public class MandelbrotAscii {
    public static void main(String[] args) {
        for (double y = -1.0; y <= 1.0; y += 0.2) {
            StringBuilder sb = new StringBuilder();
            for (double x = -2.0; x <= 0.6; x += 0.05) {
                double zr = 0, zi = 0;
                int n = 0;
                while (n < 30 && zr * zr + zi * zi < 4) {
                    double t = zr * zr - zi * zi + x;
                    zi = 2 * zr * zi + y;
                    zr = t;
                    n++;
                }
                sb.append(n == 30 ? '#' : '.');
            }
            System.out.println(sb);
        }
    }
}
