final: prev: {
  hello-custom = prev.hello.overrideAttrs (old: {
    pname = "hello-custom";
    doCheck = false;
  });
}
