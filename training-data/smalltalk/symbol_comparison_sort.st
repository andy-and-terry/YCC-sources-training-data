| xs |
xs := #('pear' 'apple' 'fig') asSortedCollection: [:a :b | a size <= b size].
xs asArray printNl.
(#(3 1 2) asSortedCollection) asArray printNl.
