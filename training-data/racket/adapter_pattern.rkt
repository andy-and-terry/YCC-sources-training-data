#lang racket

;; The "legacy" interface the client wants to use: an inches-based ruler.
(struct legacy-ruler (length-cm))

(define (ruler-length-inches ruler)
  (/ (legacy-ruler-length-cm ruler) 2.54))

;; Adapter presenting a common "measure" interface over different backends.
(define (measure obj)
  (cond
    [(legacy-ruler? obj) (ruler-length-inches obj)]
    [(number? obj) obj] ; already inches
    [else (error "unknown measurable type")]))

(displayln (measure (legacy-ruler 30.48)))
(displayln (measure 12))
