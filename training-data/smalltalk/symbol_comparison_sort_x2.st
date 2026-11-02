| names |
names := #('pear' 'fig' 'banana') asSortedCollection: [:a :b | a size <= b size].
names do: [:n | Transcript showCr: n].
