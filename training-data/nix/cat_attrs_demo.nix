let
  # builtins.catAttrs collects the value of one attribute from every
  # set in a list, silently skipping sets that lack it.
  people = [
    { name = "ada"; role = "engineer"; }
    { name = "grace"; role = "admiral"; }
    { name = "linus"; }
    { name = "ken"; role = "engineer"; }
  ];
in
  {
    names = builtins.catAttrs "name" people;
    roles = builtins.catAttrs "role" people;
    # sets without the attribute contribute nothing
    missing = builtins.catAttrs "email" people;
    # equivalent spelled out with map + filter
    rolesManual = map (p: p.role) (builtins.filter (p: p ? role) people);
  }
