"""A minimal recursive-descent JSON parser, for educational purposes.

Supports objects, arrays, strings, numbers, booleans, and null. Not meant
to replace the standard library `json` module -- written to show a
hand-rolled tokenizer/parser pattern.
"""

from typing import Any, Union

JSONValue = Union[dict, list, str, float, int, bool, None]


class ParseError(Exception):
    def __init__(self, message: str, position: int):
        super().__init__(f"{message} at position {position}")
        self.position = position


class JSONParser:
    def __init__(self, text: str):
        self.text = text
        self.pos = 0

    def parse(self) -> JSONValue:
        self._skip_whitespace()
        value = self._parse_value()
        self._skip_whitespace()
        if self.pos != len(self.text):
            raise ParseError("unexpected trailing data", self.pos)
        return value

    def _skip_whitespace(self):
        while self.pos < len(self.text) and self.text[self.pos] in " \t\n\r":
            self.pos += 1

    def _peek(self) -> str:
        if self.pos >= len(self.text):
            raise ParseError("unexpected end of input", self.pos)
        return self.text[self.pos]

    def _parse_value(self) -> JSONValue:
        ch = self._peek()
        if ch == "{":
            return self._parse_object()
        if ch == "[":
            return self._parse_array()
        if ch == '"':
            return self._parse_string()
        if ch in "-0123456789":
            return self._parse_number()
        if self.text.startswith("true", self.pos):
            self.pos += 4
            return True
        if self.text.startswith("false", self.pos):
            self.pos += 5
            return False
        if self.text.startswith("null", self.pos):
            self.pos += 4
            return None
        raise ParseError(f"unexpected character {ch!r}", self.pos)

    def _parse_object(self) -> dict:
        obj: dict[str, Any] = {}
        self.pos += 1  # skip {
        self._skip_whitespace()
        if self._peek() == "}":
            self.pos += 1
            return obj
        while True:
            self._skip_whitespace()
            key = self._parse_string()
            self._skip_whitespace()
            if self._peek() != ":":
                raise ParseError("expected ':'", self.pos)
            self.pos += 1
            self._skip_whitespace()
            obj[key] = self._parse_value()
            self._skip_whitespace()
            ch = self._peek()
            if ch == ",":
                self.pos += 1
                continue
            if ch == "}":
                self.pos += 1
                return obj
            raise ParseError("expected ',' or '}'", self.pos)

    def _parse_array(self) -> list:
        arr = []
        self.pos += 1  # skip [
        self._skip_whitespace()
        if self._peek() == "]":
            self.pos += 1
            return arr
        while True:
            self._skip_whitespace()
            arr.append(self._parse_value())
            self._skip_whitespace()
            ch = self._peek()
            if ch == ",":
                self.pos += 1
                continue
            if ch == "]":
                self.pos += 1
                return arr
            raise ParseError("expected ',' or ']'", self.pos)

    def _parse_string(self) -> str:
        if self._peek() != '"':
            raise ParseError("expected string", self.pos)
        self.pos += 1
        chars = []
        while True:
            ch = self._peek()
            if ch == '"':
                self.pos += 1
                return "".join(chars)
            if ch == "\\":
                self.pos += 1
                escape = self._peek()
                mapping = {'"': '"', "\\": "\\", "/": "/", "n": "\n", "t": "\t", "r": "\r"}
                chars.append(mapping.get(escape, escape))
                self.pos += 1
            else:
                chars.append(ch)
                self.pos += 1

    def _parse_number(self) -> Union[int, float]:
        start = self.pos
        if self._peek() == "-":
            self.pos += 1
        while self.pos < len(self.text) and self.text[self.pos].isdigit():
            self.pos += 1
        is_float = False
        if self.pos < len(self.text) and self.text[self.pos] == ".":
            is_float = True
            self.pos += 1
            while self.pos < len(self.text) and self.text[self.pos].isdigit():
                self.pos += 1
        raw = self.text[start:self.pos]
        return float(raw) if is_float else int(raw)


def parse_json(text: str) -> JSONValue:
    return JSONParser(text).parse()


if __name__ == "__main__":
    print(parse_json('{"a": 1, "b": [1, 2, 3], "c": {"nested": true}}'))
