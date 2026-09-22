Object subclass: Pizza [
    | size toppings |
    size: s toppings: t [ size := s. toppings := t ]
    printOn: aStream [
        aStream nextPutAll: 'Pizza(', size printString, ', ', toppings asArray printString, ')'
    ]
]

Object subclass: PizzaBuilder [
    | size toppings |
    PizzaBuilder class >> new [
        | b |
        b := super new.
        b setDefaults.
        ^b
    ]
    setDefaults [ size := #medium. toppings := OrderedCollection new ]
    size: s [ size := s ]
    addTopping: t [ toppings add: t ]
    build [ ^Pizza new size: size toppings: toppings ]
]

| builder pizza |
builder := PizzaBuilder new.
builder size: #large.
builder addTopping: #cheese.
builder addTopping: #pepperoni.
pizza := builder build.
Transcript showCr: pizza printString.
