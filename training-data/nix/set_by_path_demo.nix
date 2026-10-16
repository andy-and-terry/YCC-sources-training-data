let
  setPath = path: value:
    if path == [ ] then value
    else { ${builtins.head path} = setPath (builtins.tail path) value; };
in
{
  one = setPath [ "a" "b" "c" ] 42;
  two = setPath [ "x" ] "hello";
}
