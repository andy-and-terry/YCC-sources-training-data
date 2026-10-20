let Animal = {}
function! Animal.new(name) abort dict
  let obj = copy(self)
  let obj.name = a:name
  return obj
endfunction
function! Animal.speak() abort dict
  return self.name . ' makes a sound'
endfunction
let Dog = extend(copy(Animal), {})
function! Dog.speak() abort dict
  return self.name . ' barks'
endfunction
let a = Animal.new('Generic')
let d = Dog.new('Rex')
echo a.speak() d.speak()
echo has_key(d, 'speak') type(d.speak) == v:t_func
let Stack = {'items': []}
function! Stack.push(x) abort dict
  call add(self.items, a:x)
  return self
endfunction
function! Stack.pop() abort dict
  return remove(self.items, -1)
endfunction
call Stack.push(1).push(2).push(3)
echo Stack.pop() Stack.items
let copy_shallow = copy(Stack)
let copy_deep = deepcopy(Stack)
call copy_shallow.push(9)
echo len(Stack.items) len(copy_deep.items)
echo string(Stack.items) get(Stack, 'missing', 'default')
