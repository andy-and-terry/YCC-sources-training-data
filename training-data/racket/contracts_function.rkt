#lang racket
(define/contract (safe-div a b)
  (-> number? (and/c number? (not/c zero?)) number?)
  (/ a b))

(displayln (safe-div 10 4))
(with-handlers ([exn:fail:contract? (λ (e) (displayln "contract violated"))])
  (safe-div 1 0))
