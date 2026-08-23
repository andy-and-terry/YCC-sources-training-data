: C-TO-F ( celsius -- fahrenheit )
  9 * 5 / 32 + ;

: F-TO-C ( fahrenheit -- celsius )
  32 - 5 * 9 / ;

100 C-TO-F .
212 F-TO-C .
CR
