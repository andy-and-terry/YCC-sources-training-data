import json

data = {"name": "Zed", "tags": ["a", "b"], "n": 1.5, "ok": True, "none": None}
s = json.dumps(data, sort_keys=True, indent=2)
print(s)
print(json.dumps(data, separators=(",", ":")))
print(json.loads(s) == data)
print(json.dumps("héllo"), json.dumps("héllo", ensure_ascii=False))

try:
    json.loads("{bad json}")
except json.JSONDecodeError as e:
    print("error at col", e.colno)

print(json.loads('{"a": 1}', object_hook=lambda d: list(d.items())))
print(json.loads("[1, 2.0, 1e3]", parse_float=str))
