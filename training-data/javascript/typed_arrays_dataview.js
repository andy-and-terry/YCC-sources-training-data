const buffer = new ArrayBuffer(16);
const view = new DataView(buffer);

view.setUint16(0, 0xcafe);
view.setUint16(2, 0xcafe, true);
view.setFloat32(4, 3.5);
view.setInt32(8, -2);

console.log(view.getUint8(0).toString(16), view.getUint8(1).toString(16));
console.log(view.getUint8(2).toString(16), view.getUint8(3).toString(16));
console.log(view.getFloat32(4), view.getInt32(8), view.getUint32(8));

const bytes = new Uint8Array(buffer);
console.log(bytes.slice(0, 4));

const ints = new Int16Array([1, 2, 3, 40000]);
console.log(ints);

const clamped = new Uint8ClampedArray([300, -5, 12.6]);
console.log(clamped);

const f64 = Float64Array.from({ length: 4 }, (_, i) => i * 0.5);
console.log(f64, f64.byteLength);

const shared = new Uint8Array(buffer, 4, 4);
shared[0] = 0;
console.log(view.getFloat32(4), shared.byteOffset);

console.log(new Uint32Array([5, 1, 10]).sort(), new TextEncoder().encode("hi€"));
