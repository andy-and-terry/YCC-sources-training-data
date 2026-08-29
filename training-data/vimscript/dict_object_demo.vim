let person = {'name': 'Alice', 'age': 30}
function! person.greet() dict
  return 'Hello, ' . self.name . '!'
endfunction

echo person.greet()
echo person.age
