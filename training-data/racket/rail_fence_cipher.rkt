#lang racket

(define (encode text rails)
  (define period (* 2 (- rails 1)))
  (define (rail i) (let ([m (modulo i period)]) (if (< m rails) m (- period m))))
  (define keyed (for/list ([c text] [i (in-naturals)]) (list (rail i) i c)))
  (list->string
   (map third (sort keyed (lambda (a b) (or (< (first a) (first b))
                                            (and (= (first a) (first b)) (< (second a) (second b)))))))))

(displayln (encode "WEAREDISCOVERED" 3))
