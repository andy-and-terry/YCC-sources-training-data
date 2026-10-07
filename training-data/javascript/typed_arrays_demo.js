const buffer = new ArrayBuffer(16);
const int32View = new Int32Array(buffer);
int32View[0] = 42;
int32View[1] = -7;
console.log('int32 view:', [...int32View]);

// A Float64Array over the same buffer sees the raw bytes reinterpreted,
// not the logical int32 values, since both views share memory.
const float64View = new Float64Array(buffer);
console.log('same bytes as float64:', float64View[0]);

const pixels = new Uint8ClampedArray(4);
pixels[0] = 300; // clamps to 255 instead of wrapping
pixels[1] = -10; // clamps to 0
console.log('clamped pixel channels:', [...pixels]);

function average(typedArray) {
  let sum = 0;
  for (const value of typedArray) sum += value;
  return sum / typedArray.length;
}
const scores = new Float32Array([88.5, 92.0, 79.5, 95.0]);
console.log('average:', average(scores));

module.exports = { average };
