import gzip
import io
import zlib


if __name__ == "__main__":
    data = b"abcabcabc" * 200
    packed = zlib.compress(data, level=9)
    print(len(data), len(packed), zlib.decompress(packed) == data)
    print(hex(zlib.crc32(data)), hex(zlib.adler32(data)))

    buf = io.BytesIO()
    with gzip.GzipFile(fileobj=buf, mode="wb") as gz:
        gz.write(data)
    print(len(buf.getvalue()))
    print(gzip.decompress(buf.getvalue()) == data)

    # Streaming decompression in small chunks.
    d = zlib.decompressobj()
    out = b"".join(d.decompress(packed[i:i + 16]) for i in range(0, len(packed), 16))
    print(out == data)
