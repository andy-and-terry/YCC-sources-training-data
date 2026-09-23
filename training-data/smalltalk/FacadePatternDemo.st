Object subclass: Cpu [
    freeze [ Transcript showCr: 'CPU: freezing' ]
    jump: position [ Transcript showCr: 'CPU: jumping to ', position printString ]
    execute [ Transcript showCr: 'CPU: executing' ]
]

Object subclass: Memory [
    load: position data: data [
        Transcript showCr: 'Memory: loading ''', data, ''' at ', position printString
    ]
]

Object subclass: HardDrive [
    readSector: sector size: size [
        Transcript showCr: 'HardDrive: reading ', size printString, ' bytes from sector ', sector printString.
        ^'boot sector data'
    ]
]

Object subclass: ComputerFacade [
    | cpu memory hardDrive |
    ComputerFacade class >> new [
        | c |
        c := super new.
        c setUp.
        ^c
    ]
    setUp [ cpu := Cpu new. memory := Memory new. hardDrive := HardDrive new ]
    start [
        | data |
        cpu freeze.
        data := hardDrive readSector: 0 size: 512.
        memory load: 0 data: data.
        cpu jump: 0.
        cpu execute
    ]
]

ComputerFacade new start.
