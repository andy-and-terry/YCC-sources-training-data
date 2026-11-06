;; Count contiguous subarrays whose sum equals k (prefix sums + alist).
(define (count-subarrays nums k)
  (let loop ((nums nums) (total 0) (seen '((0 . 1))) (count 0))
    (if (null? nums)
        count
        (let* ((t (+ total (car nums)))
               (hit (assv (- t k) seen))
               (cur (assv t seen))
               (seen2 (cons (cons t (+ 1 (if cur (cdr cur) 0)))
                            (if cur (filter (lambda (p) (not (= (car p) t))) seen) seen))))
          (loop (cdr nums) t seen2 (+ count (if hit (cdr hit) 0)))))))

(display (count-subarrays '(1 1 1) 2))
(newline)
