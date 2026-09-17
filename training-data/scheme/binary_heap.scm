;; A mutable array-based min-heap using a fixed-capacity vector and a size box.

(define (make-heap capacity) (cons (make-vector capacity 0) (vector 0)))

(define (heap-data h) (car h))
(define (heap-size h) (vector-ref (cdr h) 0))
(define (heap-size-set! h n) (vector-set! (cdr h) 0 n))

(define (heap-swap! h i j)
  (let* ((data (heap-data h)) (tmp (vector-ref data i)))
    (vector-set! data i (vector-ref data j))
    (vector-set! data j tmp)))

(define (heap-push! h value)
  (let* ((data (heap-data h)) (i (heap-size h)))
    (vector-set! data i value)
    (heap-size-set! h (+ i 1))
    (let loop ((child i))
      (let ((parent (quotient (- child 1) 2)))
        (if (and (> child 0) (< (vector-ref data child) (vector-ref data parent)))
            (begin (heap-swap! h child parent) (loop parent)))))))

(define (heap-pop! h)
  (let* ((data (heap-data h)) (n (heap-size h)) (top (vector-ref data 0)))
    (vector-set! data 0 (vector-ref data (- n 1)))
    (heap-size-set! h (- n 1))
    (let loop ((parent 0))
      (let* ((left (+ (* 2 parent) 1)) (right (+ (* 2 parent) 2)) (size (heap-size h))
             (smallest (if (and (< left size) (< (vector-ref data left) (vector-ref data parent))) left parent))
             (smallest2 (if (and (< right size) (< (vector-ref data right) (vector-ref data smallest))) right smallest)))
        (if (not (= smallest2 parent))
            (begin (heap-swap! h parent smallest2) (loop smallest2)))))
    top))

(define h (make-heap 10))
(for-each (lambda (x) (heap-push! h x)) '(5 3 8 1 9 2))
(display (list (heap-pop! h) (heap-pop! h) (heap-pop! h)))
(newline)
