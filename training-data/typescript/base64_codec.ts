function encodeBytes(buffer: Buffer): string {
  return buffer.toString('base64');
}

function decodeString(text: string): Buffer {
  return Buffer.from(text, 'base64');
}

const encoded = encodeBytes(Buffer.from('hello world'));
console.log(encoded);
console.log(decodeString(encoded).toString());
