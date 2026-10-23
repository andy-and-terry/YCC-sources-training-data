" mapnew() and extendnew() return new values instead of modifying in place
let s:nums = [1, 2, 3]
let s:doubled = mapnew(s:nums, {_, v -> v * 2})
echo s:nums
echo s:doubled

" map() changes the list itself
let s:copy = copy(s:nums)
call map(s:copy, {_, v -> v + 100})
echo s:copy

let s:a = {'x': 1, 'y': 2}
let s:b = {'y': 20, 'z': 30}
let s:merged = extendnew(s:a, s:b)
echo s:a
echo s:merged

" 'keep' retains existing keys instead of overwriting
echo extendnew(s:a, s:b, 'keep')
