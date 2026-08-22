class Vector3 {
  constructor(x, y, z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  add(other) {
    return new Vector3(this.x + other.x, this.y + other.y, this.z + other.z);
  }

  sub(other) {
    return new Vector3(this.x - other.x, this.y - other.y, this.z - other.z);
  }

  dot(other) {
    return this.x * other.x + this.y * other.y + this.z * other.z;
  }

  cross(other) {
    return new Vector3(
      this.y * other.z - this.z * other.y,
      this.z * other.x - this.x * other.z,
      this.x * other.y - this.y * other.x
    );
  }

  length() {
    return Math.sqrt(this.dot(this));
  }

  normalized() {
    const len = this.length();
    return new Vector3(this.x / len, this.y / len, this.z / len);
  }
}

const a = new Vector3(1, 0, 0);
const b = new Vector3(0, 1, 0);
console.log(a.cross(b), a.dot(b), a.add(b).length());
module.exports = { Vector3 };
