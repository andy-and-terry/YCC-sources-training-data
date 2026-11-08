(define (rail-index i rails)
  (let* ((period (* 2 (- rails 1))) (m (modulo i period)))
    (if (< m rails) m (- period m))))

(define (rail-fence s rails)
  (let* ((chars (string->list s))
         (tagged (let loop ((cs chars) (i 0) (acc '()))
                   (if (null? cs) (reverse acc)
                       (loop (cdr cs) (+ i 1) (cons (cons (rail-index i rails) (car cs)) acc))))))
    (list->string
     (map cdr
          (let loop ((r 0) (acc '()))
            (if (= r rails) acc
                (loop (+ r 1)
                      (append acc (filter (lambda (p) (= (car p) r)) tagged)))))))))

(display (rail-fence "WEAREDISCOVERED" 3))
(newline)
