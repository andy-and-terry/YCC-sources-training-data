Object subclass: SupportHandler [
    | nextHandler |
    next: aHandler [ nextHandler := aHandler ]
    handle: level issue: issue [
        (self canHandle: level)
            ifTrue: [ Transcript showCr: self class name, ' handled: ', issue ]
            ifFalse: [
                nextHandler isNil
                    ifTrue: [ Transcript showCr: 'No handler available for: ', issue ]
                    ifFalse: [ nextHandler handle: level issue: issue ]
            ]
    ]
    canHandle: level [ ^self subclassResponsibility ]
]

SupportHandler subclass: TierOneSupport [
    canHandle: level [ ^level <= 1 ]
]

SupportHandler subclass: TierTwoSupport [
    canHandle: level [ ^level <= 2 ]
]

SupportHandler subclass: TierThreeSupport [
    canHandle: level [ ^level <= 3 ]
]

| tier1 tier2 tier3 |
tier3 := TierThreeSupport new.
tier2 := TierTwoSupport new next: tier3; yourself.
tier1 := TierOneSupport new next: tier2; yourself.

tier1 handle: 1 issue: 'password reset'.
tier1 handle: 3 issue: 'database outage'.
tier1 handle: 5 issue: 'unknown catastrophe'.
