let
  greeting = name: "Hello, ${name}!";
  words = builtins.split " " "the quick brown fox";
  upperFirst = s: builtins.substring 0 1 s;
in
  {
    greet = greeting "Ada";
    firstChar = upperFirst "fox";
  }
