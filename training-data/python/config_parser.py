import configparser
import io

SAMPLE_CONFIG = """
[server]
host = localhost
port = 8080

[database]
url = postgres://localhost/mydb
"""


def load_config(text: str) -> dict:
    parser = configparser.ConfigParser()
    parser.read_string(text)
    return {section: dict(parser[section]) for section in parser.sections()}


if __name__ == "__main__":
    print(load_config(SAMPLE_CONFIG))
