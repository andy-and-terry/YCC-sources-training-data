function! MakeCircle(radius)
  return {'kind': 'circle', 'radius': a:radius}
endfunction

function! MakeSquare(side)
  return {'kind': 'square', 'side': a:side}
endfunction

function! ShapeArea(shape)
  if a:shape.kind ==# 'circle'
    return 3.14159 * a:shape.radius * a:shape.radius
  elseif a:shape.kind ==# 'square'
    return a:shape.side * a:shape.side
  endif
  throw 'unknown shape: ' . a:shape.kind
endfunction

function! ShapeFactory(kind, param)
  if a:kind ==# 'circle'
    return MakeCircle(a:param)
  elseif a:kind ==# 'square'
    return MakeSquare(a:param)
  endif
  throw 'unknown shape kind: ' . a:kind
endfunction

for spec in [['circle', 3], ['square', 4]]
  let shape = ShapeFactory(spec[0], spec[1])
  echo shape.kind . ' area: ' . ShapeArea(shape)
endfor
