let
  base = { name = "Widget"; price = 9; qty = 3; };

  # `inherit (base) name price;` pulls named attributes out of another
  # attribute set, instead of writing `name = base.name; price = base.price;`.
  summary =
    let
      inherit (base) name price;
    in
      "${name}: " + toString price + " each";

  qty = base.qty;

  # Plain `inherit x;` (no source set) pulls a name already in scope into
  # an attribute set literal, short for `x = x;`.
  order = { inherit qty; inherit (base) name; total = base.price * qty; };
in
{
  inherit summary order;
}
