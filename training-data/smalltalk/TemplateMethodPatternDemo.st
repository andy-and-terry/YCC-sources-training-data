Object subclass: DataReport [
    run [
        Transcript showCr: 'opening data source'.
        self fetchData do: [ :row | Transcript showCr: '  row: ', row printString ].
        Transcript showCr: 'total: ', self summarize printString
    ]
    fetchData [ ^self subclassResponsibility ]
    summarize [ ^self fetchData size ]
]

DataReport subclass: NumberReport [
    fetchData [ ^#(3 1 4 1 5 9) ]
    summarize [ ^(self fetchData inject: 0 into: [ :sum :each | sum + each ]) ]
]

DataReport subclass: WordReport [
    fetchData [ ^#('the' 'quick' 'fox') ]
]

NumberReport new run.
WordReport new run.
