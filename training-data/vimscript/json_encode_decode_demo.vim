let data = {'name': 'Ada', 'langs': ['vim', 'c'], 'age': 36, 'admin': v:true}
let text = json_encode(data)
echo text

let parsed = json_decode('{"id": 7, "tags": ["a", "b"], "ok": false, "none": null}')
echo parsed.id
echo parsed.tags[1]
echo parsed.ok
echo parsed.none is v:null

echo json_decode(text).langs
echo json_encode([1, 'two', 3.5])
