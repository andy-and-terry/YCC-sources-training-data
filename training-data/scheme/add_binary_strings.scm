(define (add-binary a b)
  (number->string (+ (string->number a 2) (string->number b 2)) 2))

(display (add-binary "1010" "1011")) (newline) ; 10101
