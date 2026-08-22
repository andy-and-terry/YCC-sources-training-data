public class VectorMath {
    record Vector3(double x, double y, double z) {
        Vector3 add(Vector3 other) {
            return new Vector3(x + other.x, y + other.y, z + other.z);
        }

        double dot(Vector3 other) {
            return x * other.x + y * other.y + z * other.z;
        }

        Vector3 cross(Vector3 other) {
            return new Vector3(
                y * other.z - z * other.y,
                z * other.x - x * other.z,
                x * other.y - y * other.x
            );
        }

        double length() {
            return Math.sqrt(dot(this));
        }
    }

    public static void main(String[] args) {
        Vector3 a = new Vector3(1, 0, 0);
        Vector3 b = new Vector3(0, 1, 0);
        System.out.println(a.cross(b) + " " + a.dot(b) + " " + a.add(b).length());
    }
}
