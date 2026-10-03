Object subclass: Renderer [
    renderCircle: radius [ ^self subclassResponsibility ]
]

Renderer subclass: VectorRenderer [
    renderCircle: radius [ ^'vector-circle(r=', radius printString, ')' ]
]

Renderer subclass: RasterRenderer [
    renderCircle: radius [ ^'raster-circle(r=', radius printString, ', pixels)' ]
]

Object subclass: Shape [
    | renderer |
    renderer: aRenderer [ renderer := aRenderer ]
]

Shape subclass: Circle [
    | radius |
    radius: r [ radius := r ]
    draw [ ^renderer renderCircle: radius ]
]

| vectorCircle rasterCircle |
vectorCircle := Circle new renderer: VectorRenderer new; radius: 5; yourself.
rasterCircle := Circle new renderer: RasterRenderer new; radius: 5; yourself.
Transcript showCr: vectorCircle draw.
Transcript showCr: rasterCircle draw.
