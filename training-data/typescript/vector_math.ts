class Vector3 {
  constructor(public x: number, public y: number, public z: number) {}

  add(other: Vector3): Vector3 {
    return new Vector3(this.x + other.x, this.y + other.y, this.z + other.z);
  }

  sub(other: Vector3): Vector3 {
    return new Vector3(this.x - other.x, this.y - other.y, this.z - other.z);
  }

  dot(other: Vector3): number {
    return this.x * other.x + this.y * other.y + this.z * other.z;
  }

  cross(other: Vector3): Vector3 {
    return new Vector3(
      this.y * other.z - this.z * other.y,
      this.z * other.x - this.x * other.z,
      this.x * other.y - this.y * other.x
    );
  }

  length(): number {
    return Math.sqrt(this.dot(this));
  }

  normalized(): Vector3 {
    const len = this.length();
    return new Vector3(this.x / len, this.y / len, this.z / len);
  }
}

const a = new Vector3(1, 0, 0);
const b = new Vector3(0, 1, 0);
console.log(a.cross(b), a.dot(b), a.add(b).length());
