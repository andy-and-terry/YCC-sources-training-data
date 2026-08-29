(define (string-split-space s)
  (let loop ((chars (string->list s)) (current '()) (words '()))
    (cond
      ((null? chars)
       (reverse (if (null? current) words (cons (list->string (reverse current)) words))))
      ((char=? (car chars) #\space)
       (loop (cdr chars) '() (if (null? current) words (cons (list->string (reverse current)) words))))
      (else (loop (cdr chars) (cons (car chars) current) words)))))

(define (word-frequency text)
  (define words (string-split-space (string-downcase text)))
  (define (count-word w lst) (length (filter (lambda (x) (string=? x w)) lst)))
  (define unique (delete-duplicates words))
  (map (lambda (w) (cons w (count-word w words))) unique))

(display (word-frequency "the quick brown fox the lazy fox"))
(newline)
