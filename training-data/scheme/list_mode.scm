(define (count-of x lst)
  (length (filter (lambda (y) (= x y)) lst)))

(define (modes items)
  (let* ((counts (map (lambda (x) (cons x (count-of x items))) items))
         (top (apply max (map cdr counts))))
    (let loop ((cs counts) (seen '()))
      (cond ((null? cs) (reverse seen))
            ((and (= (cdar cs) top) (not (memv (caar cs) seen)))
             (loop (cdr cs) (cons (caar cs) seen)))
            (else (loop (cdr cs) seen))))))

(display (modes '(1 2 2 3 3 4)))
(newline)
