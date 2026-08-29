(define (digits n)
  (map (lambda (c) (- (char->integer c) (char->integer #\0)))
       (string->list (number->string n))))

(define (armstrong? n)
  (let* ((ds (digits n))
         (power (length ds)))
    (= n (apply + (map (lambda (d) (expt d power)) ds)))))

(display (armstrong? 153))
(newline)
(display (armstrong? 154))
(newline)
