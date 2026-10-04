const buffer = new ArrayBuffer(16);
const view = new DataView(buffer);

view.setUint16(0, 0xCAFE);
view.setInt32(2, -1234, true);
view.setFloat32(6, 3.5);

console.log(view.getUint16(0).toString(16));
console.log(view.getInt32(2, true));
console.log(view.getFloat32(6));

const bytes = new Uint8Array(buffer, 0, 4);
console.log(Array.from(bytes, (b) => b.toString(16).padStart(2, '0')).join(' '));

const ints = Int16Array.from([100, -200, 300]);
console.log(ints.byteLength, ints.length);

const clamped = new Uint8ClampedArray([300, -5, 12.6]);
console.log(clamped);

const wrap = new Uint8Array([255]);
wrap[0] += 1;
console.log(wrap[0]);

const f64 = new Float64Array([1.5, 2.5, 3.5]);
console.log(f64.map((x) => x * 2), f64.reduce((a, b) => a + b));
console.log(new TextDecoder().decode(new TextEncoder().encode('héllo')));
