\ Forth 2012 structure words: BEGIN-STRUCTURE / FIELD: / END-STRUCTURE
begin-structure point
  field: p.x
  field: p.y
end-structure

begin-structure rect
  point +field r.origin
  field: r.w
  field: r.h
end-structure

create pt point allot
3 pt p.x !
4 pt p.y !
pt p.x @ . pt p.y @ . cr
point . cr

create box rect allot
10 box r.origin p.x !
20 box r.origin p.y !
5 box r.w !
8 box r.h !

: area ( rect -- n ) dup r.w @ swap r.h @ * ;
box area . cr
box r.origin p.y @ . cr
rect . cr
