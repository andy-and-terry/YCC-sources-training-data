from typing import TypedDict, NotRequired


class Config(TypedDict):
    host: str
    port: int
    debug: NotRequired[bool]


if __name__ == "__main__":
    cfg: Config = {"host": "localhost", "port": 8080}
    print(cfg)
