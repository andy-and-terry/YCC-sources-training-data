Object subclass: CpuModule [
    start [ Transcript showCr: 'cpu: started'. ]
]

Object subclass: MemoryModule [
    load [ Transcript showCr: 'memory: loaded'. ]
]

Object subclass: DiskModule [
    spinUp [ Transcript showCr: 'disk: spinning up'. ]
]

Object subclass: ComputerFacade [
    | cpu memory disk |
    ComputerFacade class >> new [
        | c |
        c := super new.
        c setup.
        ^c
    ]

    setup [
        cpu := CpuModule new.
        memory := MemoryModule new.
        disk := DiskModule new.
    ]

    startComputer [
        disk spinUp.
        memory load.
        cpu start.
        Transcript showCr: 'computer: ready'.
    ]
]

ComputerFacade new startComputer.
