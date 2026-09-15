(define (sift-down! vec start end)
  (let loop ((root start))
    (let ((left (+ (* 2 root) 1))
          (right (+ (* 2 root) 2))
          (largest root))
      (let* ((largest (if (and (< left end) (> (vector-ref vec left) (vector-ref vec largest)))
                           left
                           largest))
             (largest (if (and (< right end) (> (vector-ref vec right) (vector-ref vec largest)))
                           right
                           largest)))
        (if (= largest root)
            #t
            (let ((tmp (vector-ref vec root)))
              (vector-set! vec root (vector-ref vec largest))
              (vector-set! vec largest tmp)
              (loop largest)))))))

(define (build-heap! vec)
  (let ((n (vector-length vec)))
    (let loop ((i (- (quotient n 2) 1)))
      (if (>= i 0)
          (begin
            (sift-down! vec i n)
            (loop (- i 1)))))))

(define (heap-sort! vec)
  (build-heap! vec)
  (let loop ((end (- (vector-length vec) 1)))
    (if (> end 0)
        (begin
          (let ((tmp (vector-ref vec 0)))
            (vector-set! vec 0 (vector-ref vec end))
            (vector-set! vec end tmp))
          (sift-down! vec 0 end)
          (loop (- end 1)))))
  vec)

(display (heap-sort! (vector 5 3 8 1 9 2 7)))
(newline)
