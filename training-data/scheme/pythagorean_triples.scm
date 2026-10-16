;; Generate Pythagorean triples with nested named-let loops.

(define (triples limit)
  (let loop-a ((a 1) (acc '()))
    (if (> a limit)
        (reverse acc)
        (loop-a (+ a 1)
                (let loop-b ((b a) (acc acc))
                  (if (> b limit)
                      acc
                      (loop-b (+ b 1)
                              (let* ((c2 (+ (* a a) (* b b)))
                                     (c (inexact->exact (floor (sqrt c2)))))
                                (if (and (<= c limit) (= (* c c) c2))
                                    (cons (list a b c) acc)
                                    acc)))))))))

(for-each (lambda (t) (display t) (newline)) (triples 25))
