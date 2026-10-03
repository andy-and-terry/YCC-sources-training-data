;; A Bloom filter: three independent hash seeds set bits in a shared
;; vector; membership is "maybe" (all bits set) or "definitely not".

(define (make-bloom size) (cons size (make-vector size #f)))
(define (bloom-size b) (car b))
(define (bloom-bits b) (cdr b))

(define (string-sum s)
  (let loop ((i 0) (acc 0))
    (if (= i (string-length s))
        acc
        (loop (+ i 1) (+ acc (char->integer (string-ref s i)))))))

(define (bloom-hash b s seed)
  (modulo (+ (* (string-sum s) seed) seed) (bloom-size b)))

(define (bloom-add! b s)
  (for-each (lambda (seed) (vector-set! (bloom-bits b) (bloom-hash b s seed) #t))
            '(1 7 13)))

(define (bloom-might-contain? b s)
  (every (lambda (seed) (vector-ref (bloom-bits b) (bloom-hash b s seed)))
         '(1 7 13)))

(define (every pred lst)
  (or (null? lst) (and (pred (car lst)) (every pred (cdr lst)))))

(define filter-bits (make-bloom 32))
(bloom-add! filter-bits "apple")
(bloom-add! filter-bits "banana")

(display (bloom-might-contain? filter-bits "apple"))
(newline)
(display (bloom-might-contain? filter-bits "cherry"))
(newline)
