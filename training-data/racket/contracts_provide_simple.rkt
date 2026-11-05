#lang racket
(define/contract (safe-sqrt n)
  (-> (and/c real? (>=/c 0)) real?)
  (sqrt n))
(displayln (safe-sqrt 16))
(displayln (with-handlers ([exn:fail:contract? (λ (e) "contract violated")]) (safe-sqrt -1)))
