const debug = true

when debug:
  echo "debug build"
else:
  echo "release build"

when defined(linux):
  echo "linux"
elif defined(windows):
  echo "windows"
else:
  echo "other os"

when sizeof(int) == 8:
  echo "64-bit ints"

when compiles(1 + "a"):
  echo "unexpected"
else:
  echo "int + string does not compile"
