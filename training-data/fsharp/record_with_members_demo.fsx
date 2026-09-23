type Rectangle =
    { Width: float
      Height: float }

    member this.Area = this.Width * this.Height
    member this.Perimeter = 2.0 * (this.Width + this.Height)
    member this.IsSquare = this.Width = this.Height

    member this.Scale(factor: float) =
        { Width = this.Width * factor
          Height = this.Height * factor }

let r = { Width = 4.0; Height = 6.0 }
let square = { Width = 5.0; Height = 5.0 }
let scaled = r.Scale(2.0)

printfn "area=%f perimeter=%f isSquare=%b" r.Area r.Perimeter r.IsSquare
printfn "square isSquare=%b" square.IsSquare
printfn "%A area=%f" scaled scaled.Area
