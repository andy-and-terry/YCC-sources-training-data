Object subclass: Approver [
    | name limit successor |
    name: n limit: aLimit successor: aSuccessor [
        name := n. limit := aLimit. successor := aSuccessor
    ]
    approve: amount [
        amount <= limit
            ifTrue: [ ^name, ' approved ', amount printString ]
            ifFalse: [
                successor isNil
                    ifTrue: [ ^'no approver available for ', amount printString ]
                    ifFalse: [ ^successor approve: amount ]
            ]
    ]
]

| director manager supervisor |
director := Approver new name: 'Director' limit: 100000 successor: nil; yourself.
manager := Approver new name: 'Manager' limit: 10000 successor: director; yourself.
supervisor := Approver new name: 'Supervisor' limit: 1000 successor: manager; yourself.

Transcript showCr: (supervisor approve: 500).
Transcript showCr: (supervisor approve: 5000).
Transcript showCr: (supervisor approve: 50000).
Transcript showCr: (supervisor approve: 500000).
