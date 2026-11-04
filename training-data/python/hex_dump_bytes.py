def hex_dump(data: bytes, width: int = 16) -> None:
    for off in range(0, len(data), width):
        chunk = data[off:off + width]
        hexes = " ".join(f"{b:02x}" for b in chunk)
        text = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        print(f"{off:08x}  {hexes:<{width * 3 - 1}}  |{text}|")


hex_dump(b"Hello, hex dump!\n\x00\x01\x02 end")
