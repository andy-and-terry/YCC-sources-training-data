import shlex

line = 'cp "my file.txt" /tmp/dest --flag=\'a b\''
parts = shlex.split(line)
print(parts)

print(shlex.join(parts))
print(shlex.quote("rm -rf /; echo hi"))
print(shlex.quote("safe_name.txt"))

lexer = shlex.shlex("key = value # comment", posix=True)
lexer.whitespace_split = True
lexer.commenters = "#"
print(list(lexer))
