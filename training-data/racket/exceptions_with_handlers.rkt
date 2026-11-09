#lang racket
(define (try thunk)
  (with-handlers ([exn:fail:contract:divide-by-zero? (λ (e) 'div-zero)]
                  [exn:fail? (λ (e) 'other)])
    (thunk)))
(displayln (try (λ () (/ 1 0))))
(displayln (try (λ () (error "x"))))
