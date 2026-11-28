;; Build each rail's characters by walking the zig-zag pattern.
(define (rail-of i rails)
  (let* ((period (* 2 (- rails 1))) (m (modulo i period)))
    (if (< m rails) m (- period m))))

(define (encode text rails)
  (let ((chars (string->list text)))
    (let loop ((r 0) (acc '()))
      (if (= r rails)
          (list->string (apply append (reverse acc)))
          (loop (+ r 1)
                (cons (let walk ((cs chars) (i 0) (out '()))
                        (cond ((null? cs) (reverse out))
                              ((= (rail-of i rails) r) (walk (cdr cs) (+ i 1) (cons (car cs) out)))
                              (else (walk (cdr cs) (+ i 1) out))))
                      acc))))))

(display (encode "WEAREDISCOVERED" 3))
(newline)
