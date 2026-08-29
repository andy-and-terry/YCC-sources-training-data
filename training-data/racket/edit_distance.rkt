#lang racket

(define (edit-distance a b)
  (define m (string-length a))
  (define n (string-length b))
  (define table (make-vector (* (add1 m) (add1 n)) 0))
  (define (idx i j) (+ (* i (add1 n)) j))
  (for ([i (in-range (add1 m))]) (vector-set! table (idx i 0) i))
  (for ([j (in-range (add1 n))]) (vector-set! table (idx 0 j) j))
  (for ([i (in-range 1 (add1 m))])
    (for ([j (in-range 1 (add1 n))])
      (define cost (if (char=? (string-ref a (sub1 i)) (string-ref b (sub1 j))) 0 1))
      (vector-set! table (idx i j)
                   (min (add1 (vector-ref table (idx (sub1 i) j)))
                        (add1 (vector-ref table (idx i (sub1 j))))
                        (+ cost (vector-ref table (idx (sub1 i) (sub1 j))))))))
  (vector-ref table (idx m n)))

(displayln (edit-distance "kitten" "sitting"))
