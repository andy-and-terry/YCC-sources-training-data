#lang racket

(define (add-binary a b)
  (number->string (+ (string->number a 2) (string->number b 2)) 2))

(define (add-binary/manual a b)
  (define n (max (string-length a) (string-length b)))
  (define (digits s)
    (reverse (for/list ([ch (in-string (~a s #:min-width n #:align 'right #:left-pad-string "0"))])
               (- (char->integer ch) 48))))
  (define-values (carry bits)
    (for/fold ([c 0] [acc '()]) ([x (digits a)] [y (digits b)])
      (define s (+ x y c))
      (values (quotient s 2) (cons (remainder s 2) acc))))
  (apply string-append (map number->string (if (> carry 0) (cons 1 bits) bits))))

(displayln (add-binary "1010" "1011"))        ; 10101
(displayln (add-binary/manual "1010" "1011")) ; 10101
