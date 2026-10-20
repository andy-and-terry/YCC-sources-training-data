import tomllib

DOC = """
title = "demo"

[server]
host = "127.0.0.1"
ports = [8000, 8001]

[[users]]
name = "ada"
admin = true

[[users]]
name = "bob"
admin = false
"""


if __name__ == "__main__":
    cfg = tomllib.loads(DOC)
    print(cfg["server"]["host"], cfg["server"]["ports"])
    print([u["name"] for u in cfg["users"] if u["admin"]])
    try:
        tomllib.loads("x = ")
    except tomllib.TOMLDecodeError as err:
        print("invalid:", err)
