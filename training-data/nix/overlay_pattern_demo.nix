let
  # A minimal package set, in the spirit of nixpkgs before any overlays.
  basePkgs = {
    widget = { name = "widget"; version = "1.0"; };
  };

  # An overlay has the nixpkgs shape `self: super: { ... }`: `super` is the
  # set before this overlay, `self` is the final, fully-overlaid set (so
  # overlays can reference each other's changes).
  addGreeting = self: super: {
    widget = super.widget // { greeting = "hello from ${self.widget.name}"; };
  };

  bumpVersion = self: super: {
    widget = super.widget // { version = "2.0"; };
  };

  # Fold the overlays over the base set, tying the knot so `self` always
  # refers to the fully-overlaid result, just like `pkgs.extend`.
  applyOverlays = base: overlays:
    let self = builtins.foldl' (acc: overlay: acc // overlay self acc) base overlays;
    in self;

  finalPkgs = applyOverlays basePkgs [ addGreeting bumpVersion ];
in
{
  version = finalPkgs.widget.version;
  greeting = finalPkgs.widget.greeting;
}
