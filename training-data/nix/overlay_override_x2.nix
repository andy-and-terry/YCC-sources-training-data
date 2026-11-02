final: prev: {
  myTool = prev.hello.overrideAttrs (old: {
    pname = "my-tool";
    doCheck = false;
  });
}
