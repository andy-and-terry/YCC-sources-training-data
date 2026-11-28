(define (rail i k)
  (let* ((cycle (* 2 (- k 1))) (r (modulo i cycle)))
    (if (< r k) r (- cycle r))))

(define (encrypt text k)
  (let ((chars (string->list text)))
    (list->string
     (apply append
            (map (lambda (r)
                   (let loop ((cs chars) (i 0) (acc '()))
                     (cond ((null? cs) (reverse acc))
                           ((= (rail i k) r) (loop (cdr cs) (+ i 1) (cons (car cs) acc)))
                           (else (loop (cdr cs) (+ i 1) acc)))))
                 (iota k))))))

(display (encrypt "WEAREDISCOVERED" 3))
(newline)
