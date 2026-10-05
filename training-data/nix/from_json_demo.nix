let
  data = builtins.fromJSON ''
    {"name": "widget", "tags": ["a", "b"], "dims": {"w": 3, "h": 4}, "ok": true, "none": null}
  '';
in
  {
    inherit (data) name tags;
    area = data.dims.w * data.dims.h;
    ok = data.ok;
    isNull = data.none == null;
    roundTrip = builtins.toJSON data.dims;
  }
