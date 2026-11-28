(define (equilibrium-index nums)
  (let ((total (apply + nums)))
    (let loop ((xs nums) (i 0) (left 0))
      (cond ((null? xs) -1)
            ((= left (- total left (car xs))) i)
            (else (loop (cdr xs) (+ i 1) (+ left (car xs))))))))

(display (equilibrium-index '(1 7 3 6 5 6))) (newline) ; 3
