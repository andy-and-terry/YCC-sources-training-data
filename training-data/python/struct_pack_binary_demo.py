import struct

HEADER = struct.Struct(">4sHHI")  # magic, version, flags, payload length


def encode(payload: bytes, version=1, flags=0) -> bytes:
    return HEADER.pack(b"DEMO", version, flags, len(payload)) + payload


def decode(blob: bytes):
    magic, version, flags, length = HEADER.unpack_from(blob)
    if magic != b"DEMO":
        raise ValueError("bad magic")
    payload = blob[HEADER.size:HEADER.size + length]
    return {"version": version, "flags": flags, "payload": payload}


if __name__ == "__main__":
    blob = encode(b"hello", flags=0b101)
    print(blob.hex(" "))
    print(decode(blob))
    print(struct.pack("<f", 1.5).hex(), struct.unpack("<i", b"\xff\xff\xff\xff"))
    print(struct.calcsize("<iHb"), struct.calcsize("iHb"))
