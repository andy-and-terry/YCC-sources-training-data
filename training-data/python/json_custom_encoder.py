"""Serializing non-JSON types with a JSONEncoder subclass and decoding
them back with an object_hook."""

import json
from datetime import datetime
from decimal import Decimal


class RichEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime):
            return {"__type__": "datetime", "value": o.isoformat()}
        if isinstance(o, Decimal):
            return {"__type__": "decimal", "value": str(o)}
        if isinstance(o, set):
            return {"__type__": "set", "value": sorted(o)}
        return super().default(o)


def rich_hook(obj: dict):
    kind = obj.get("__type__")
    if kind == "datetime":
        return datetime.fromisoformat(obj["value"])
    if kind == "decimal":
        return Decimal(obj["value"])
    if kind == "set":
        return set(obj["value"])
    return obj


if __name__ == "__main__":
    doc = {"at": datetime(2024, 5, 1, 12, 30), "cost": Decimal("9.99"), "tags": {"b", "a"}}
    text = json.dumps(doc, cls=RichEncoder, indent=2)
    print(text)
    back = json.loads(text, object_hook=rich_hook)
    print(back == doc)
