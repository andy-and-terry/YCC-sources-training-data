(define (heap-sort! vec)
  (define n (vector-length vec))

  (define (swap! i j)
    (let ((tmp (vector-ref vec i)))
      (vector-set! vec i (vector-ref vec j))
      (vector-set! vec j tmp)))

  (define (sift-down start end)
    (let loop ((root start))
      (let ((child (+ (* 2 root) 1)))
        (if (>= child end)
            'done
            (let ((larger (if (and (< (+ child 1) end)
                                    (< (vector-ref vec child) (vector-ref vec (+ child 1))))
                               (+ child 1)
                               child)))
              (if (< (vector-ref vec root) (vector-ref vec larger))
                  (begin (swap! root larger) (loop larger))
                  'done))))))

  (let build-loop ((start (quotient (- n 2) 2)))
    (if (>= start 0)
        (begin (sift-down start n) (build-loop (- start 1)))))

  (let sort-loop ((end (- n 1)))
    (if (> end 0)
        (begin
          (swap! 0 end)
          (sift-down 0 end)
          (sort-loop (- end 1)))))
  vec)

(display (heap-sort! (vector 5 3 8 1 9 2 7)))
(newline)
