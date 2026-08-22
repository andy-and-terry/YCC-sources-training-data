#include <cmath>
#include <iostream>

struct Vector3 {
    double x, y, z;

    Vector3 operator+(const Vector3& o) const { return {x + o.x, y + o.y, z + o.z}; }
    double dot(const Vector3& o) const { return x * o.x + y * o.y + z * o.z; }
    Vector3 cross(const Vector3& o) const {
        return {y * o.z - z * o.y, z * o.x - x * o.z, x * o.y - y * o.x};
    }
    double length() const { return std::sqrt(dot(*this)); }
};

int main() {
    Vector3 a{1, 0, 0}, b{0, 1, 0};
    Vector3 c = a.cross(b);
    std::cout << c.x << " " << c.y << " " << c.z << " " << a.dot(b) << " " << (a + b).length() << std::endl;
    return 0;
}
