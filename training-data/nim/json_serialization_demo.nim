import std/json

let data = %*{
  "name": "Ada",
  "age": 36,
  "languages": ["Nim", "Assembly"]
}

echo data["name"].getStr
echo data["age"].getInt
echo data["languages"][0].getStr

data["age"] = %37
echo data.pretty

let parsed = parseJson("""{"active": true, "score": 9.5}""")
echo parsed["active"].getBool
echo parsed["score"].getFloat
