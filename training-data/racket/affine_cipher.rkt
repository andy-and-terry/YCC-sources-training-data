#lang racket

(define (affine text a b)
  (list->string
   (for/list ([ch text])
     (if (char-upper-case? ch)
         (integer->char (+ 65 (modulo (+ (* a (- (char->integer ch) 65)) b) 26)))
         ch))))

(displayln (affine "AFFINE" 5 8))
