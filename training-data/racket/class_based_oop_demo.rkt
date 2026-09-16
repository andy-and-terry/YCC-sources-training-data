#lang racket
(require racket/class)

(define shape%
  (class object%
    (super-new)
    (define/public (area) 0)
    (define/public (describe)
      (format "shape with area ~a" (send this area)))))

(define circle%
  (class shape%
    (init-field radius)
    (super-new)
    (define/override (area)
      (* 3.14159 radius radius))))

(define rectangle%
  (class shape%
    (init-field width height)
    (super-new)
    (define/override (area)
      (* width height))))

(define shapes (list (new circle% [radius 2]) (new rectangle% [width 3] [height 4])))

(for ([s shapes])
  (displayln (send s describe)))
