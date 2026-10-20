from collections import ChainMap

defaults = {"color": "red", "size": 1}
user = {"size": 5}
cfg = ChainMap(user, defaults)

if __name__ == "__main__":
    print(cfg["color"], cfg["size"])
    cfg["new"] = 1
    print(user)
