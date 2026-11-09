{ debug ? false, name ? "app" }:
{
  label = if debug then "${name}-debug" else name;
  flags = if debug then [ "-g" "-O0" ] else [ "-O2" ];
}
