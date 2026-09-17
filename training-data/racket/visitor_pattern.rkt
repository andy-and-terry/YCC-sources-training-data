#lang racket

;; The visitor pattern falls out naturally from tagged structs plus
;; `match`, rather than double-dispatch machinery.
(struct circle (radius) #:transparent)
(struct rectangle (width height) #:transparent)

(define (accept visitor shape)
  (match shape
    [(circle r) (visitor 'circle r)]
    [(rectangle w h) (visitor 'rectangle w h)]))

(define (area-visitor kind . args)
  (match (cons kind args)
    [(list 'circle r) (* pi r r)]
    [(list 'rectangle w h) (* w h)]))

(define (describe-visitor kind . args)
  (match (cons kind args)
    [(list 'circle r) (format "circle with radius ~a" r)]
    [(list 'rectangle w h) (format "rectangle ~a x ~a" w h)]))

(require racket/match)
(define shapes (list (circle 3) (rectangle 4 5)))

(for ([shape shapes])
  (displayln (accept describe-visitor shape))
  (displayln (accept area-visitor shape)))
