let
  # `removeAttrs set names` returns a copy of `set` without the listed
  # attribute names; names that aren't present are silently ignored.
  user = {
    name = "Grace";
    email = "grace@example.com";
    passwordHash = "s3cr3t";
    role = "admin";
  };

  publicView = removeAttrs user [ "passwordHash" ];
  minimal = removeAttrs user [ "email" "passwordHash" "role" ];
  noOp = removeAttrs user [ "doesNotExist" ];
in
  {
    inherit publicView minimal;
    unchanged = noOp == user;
  }
