module BridgePattern exposing (Renderer, drawCircle, drawSquare, rasterRenderer, vectorRenderer)

{-| The Gang-of-Four Bridge pattern needs no parallel class hierarchies in
Elm: decoupling an abstraction from its implementation is just a record
of functions passed in as the "implementation", so shapes and renderers
can vary independently.
-}


type alias Renderer =
    { renderCircle : Float -> String
    , renderSquare : Float -> String
    }


vectorRenderer : Renderer
vectorRenderer =
    { renderCircle = \r -> "vector circle r=" ++ String.fromFloat r
    , renderSquare = \s -> "vector square s=" ++ String.fromFloat s
    }


rasterRenderer : Renderer
rasterRenderer =
    { renderCircle = \r -> "raster circle r=" ++ String.fromFloat r
    , renderSquare = \s -> "raster square s=" ++ String.fromFloat s
    }


drawCircle : Renderer -> Float -> String
drawCircle renderer radius =
    renderer.renderCircle radius


drawSquare : Renderer -> Float -> String
drawSquare renderer side =
    renderer.renderSquare side
