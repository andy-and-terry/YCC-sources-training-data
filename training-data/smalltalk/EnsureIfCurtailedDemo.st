Object subclass: EnsureIfCurtailedDemo [
    EnsureIfCurtailedDemo class >> runNormally [
        [ Transcript showCr: 'working' ] ensure: [ Transcript showCr: 'cleanup after normal run' ]
    ]

    EnsureIfCurtailedDemo class >> runWithError [
        [ [ Error signal: 'boom' ] ensure: [ Transcript showCr: 'cleanup after error' ] ]
            on: Error do: [ :e | Transcript showCr: 'caught: ', e messageText ]
    ]

    EnsureIfCurtailedDemo class >> runCurtailed [
        [ [ Error signal: 'curtailed' ] ifCurtailed: [ Transcript showCr: 'curtailed block ran' ] ]
            on: Error do: [ :e | Transcript showCr: 'caught: ', e messageText ]
    ]
]

EnsureIfCurtailedDemo runNormally.
EnsureIfCurtailedDemo runWithError.
EnsureIfCurtailedDemo runCurtailed.
