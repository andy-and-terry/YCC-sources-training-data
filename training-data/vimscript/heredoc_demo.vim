let lines =<< trim END
  Line one
  Line two
  Line three
END

for line in lines
  echo line
endfor

let joined = join(lines, ' / ')
echo joined
