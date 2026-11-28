(define (max-area heights)
  (let ((v (list->vector heights)))
    (let loop ((lo 0) (hi (- (vector-length v) 1)) (best 0))
      (if (>= lo hi)
          best
          (let* ((a (vector-ref v lo))
                 (b (vector-ref v hi))
                 (best (max best (* (min a b) (- hi lo)))))
            (if (< a b)
                (loop (+ lo 1) hi best)
                (loop lo (- hi 1) best)))))))

(display (max-area '(1 8 6 2 5 4 8 3 7))) (newline) ; 49
