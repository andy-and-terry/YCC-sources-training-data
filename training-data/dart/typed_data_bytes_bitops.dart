import 'dart:typed_data';

void main() {
  var bytes = Uint8List.fromList([1, 2, 3, 255]);
  print(bytes.sublist(1, 3));
  print(bytes.buffer.lengthInBytes);
  var bd = ByteData(8);
  bd.setUint16(0, 0xCAFE, Endian.big);
  bd.setFloat32(4, 1.5, Endian.little);
  print(bd.getUint16(0, Endian.big).toRadixString(16));
  print(bd.getUint8(0));
  print(5 & 3 | 8 ^ 1);
  print(1 << 10);
  print(-16 >> 2);
  print(0xFF >>> 4);
  print((255).bitLength);
  print(~5 & 0xFF);
  var i32 = Int32List(3)..[0] = 1 << 31;
  print(i32[0]);
  print(Float64List.fromList([1.5, 2.5]).reduce((a, b) => a + b));
  print(Uint8List(2).every((b) => b == 0));
  print(0x7fffffffffffffff + 1);
  print(10.gcd(4));
  print(-7 % 3);
  print(-7 ~/ 2);
  print(7.remainder(-3));
  print(2.5.round() + (-2.5).round() + 3.5.floor() + 3.2.ceil());
}
