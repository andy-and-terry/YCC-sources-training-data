import std/parseopt

# try: parseopt_args_demo --name=Ada -v input.txt
for kind, key, val in getopt():
  case kind
  of cmdArgument: echo "arg: ", key
  of cmdLongOption, cmdShortOption: echo "opt: ", key, " = ", val
  of cmdEnd: discard
