def percent_decode(s):
    out = bytearray()
    i = 0
    while i < len(s):
        c = s[i]
        if c == "+":
            out.append(32); i += 1
        elif c == "%" and i + 2 < len(s) + 1:
            out.append(int(s[i + 1:i + 3], 16)); i += 3
        else:
            out.extend(c.encode()); i += 1
    return out.decode("utf-8")


def parse_qs(qs):
    result = {}
    for pair in filter(None, qs.split("&")):
        key, _, value = pair.partition("=")
        result.setdefault(percent_decode(key), []).append(percent_decode(value))
    return result


def build_qs(params):
    safe = set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~")

    def enc(s):
        return "".join(c if c in safe else "".join(f"%{b:02X}" for b in c.encode()) for c in s)

    return "&".join(f"{enc(k)}={enc(v)}" for k, vs in params.items() for v in vs)


if __name__ == "__main__":
    q = parse_qs("name=J%C3%BCrgen+M&tag=a&tag=b&empty=")
    print(q)
    print(build_qs(q))
