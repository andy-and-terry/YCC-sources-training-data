import re


def snake_to_camel(s, upper_first=False):
    parts = s.split("_")
    head = parts[0].capitalize() if upper_first else parts[0].lower()
    return head + "".join(p.capitalize() for p in parts[1:])


def camel_to_snake(s):
    s = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1_\2", s)
    s = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s)
    return s.lower()


def to_kebab(s):
    return camel_to_snake(s).replace("_", "-")


if __name__ == "__main__":
    print(snake_to_camel("parse_http_response"), snake_to_camel("user_id", True))
    print(camel_to_snake("parseHTTPResponse"), camel_to_snake("UserID2Name"))
    print(to_kebab("backgroundColor"))
