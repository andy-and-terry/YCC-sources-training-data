import 'dart:typed_data';

void main() {
  final bytes = Uint8List(4);
  bytes[0] = 255;
  bytes[1] = 256; // wraps to 0
  bytes[2] = -1;  // wraps to 255
  print(bytes);

  final view = ByteData.view(bytes.buffer);
  view.setUint16(2, 0x1234, Endian.big);
  print(bytes);
  print(view.getUint16(2, Endian.little).toRadixString(16));

  final floats = Float64List.fromList([1.5, 2.5, 3.5]);
  print(floats.fold<double>(0, (a, b) => a + b));
  print(Int32List.fromList([1, 2, 3]).lengthInBytes);
  print(Uint8List.fromList([1, 2, 3, 4]).sublist(1, 3));
}
