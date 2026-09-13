#lang racket

(define (count-islands grid)
  (define rows (vector-length grid))
  (define cols (vector-length (vector-ref grid 0)))
  (define visited (for/vector ([_ (in-range rows)]) (make-vector cols #f)))

  (define (visited? r c) (vector-ref (vector-ref visited r) c))
  (define (mark! r c) (vector-set! (vector-ref visited r) c #t))
  (define (land? r c) (= (vector-ref (vector-ref grid r) c) 1))

  (define (flood-fill r c)
    (when (and (>= r 0) (< r rows) (>= c 0) (< c cols)
               (not (visited? r c)) (land? r c))
      (mark! r c)
      (flood-fill (add1 r) c)
      (flood-fill (sub1 r) c)
      (flood-fill r (add1 c))
      (flood-fill r (sub1 c))))

  (for*/sum ([r (in-range rows)] [c (in-range cols)])
    (cond
      [(and (land? r c) (not (visited? r c)))
       (flood-fill r c)
       1]
      [else 0])))

(define grid
  (vector
   (vector 1 1 0 0)
   (vector 1 1 0 0)
   (vector 0 0 1 0)
   (vector 0 0 0 1)))

(displayln (count-islands grid))
