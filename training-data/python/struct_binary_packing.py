"""struct: packing and unpacking fixed-layout binary records."""

import struct

HEADER = struct.Struct("<4sHHI")  # magic, version, flags, payload length


def build_packet(version: int, flags: int, payload: bytes) -> bytes:
    return HEADER.pack(b"DEMO", version, flags, len(payload)) + payload


def parse_packet(data: bytes):
    magic, version, flags, length = HEADER.unpack_from(data)
    if magic != b"DEMO":
        raise ValueError("bad magic")
    payload = data[HEADER.size : HEADER.size + length]
    return {"version": version, "flags": flags, "payload": payload}


if __name__ == "__main__":
    pkt = build_packet(2, 0b101, b"hello")
    print(pkt.hex(" "))
    print(parse_packet(pkt))
    print(struct.unpack(">i", (-2).to_bytes(4, "big", signed=True)))
    try:
        parse_packet(b"XXXX" + bytes(8))
    except ValueError as exc:
        print("error:", exc)
