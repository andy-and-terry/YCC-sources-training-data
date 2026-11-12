foreach s {apple 42 x} {
  switch -glob -- $s { a* {puts starts-a} {[0-9]*} {puts digit} default {puts other} }
}
