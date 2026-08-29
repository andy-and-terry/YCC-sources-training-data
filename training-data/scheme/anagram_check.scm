(define (sort-chars chars)
  (if (null? chars)
      '()
      (insert-char (car chars) (sort-chars (cdr chars)))))

(define (insert-char c lst)
  (cond
    ((null? lst) (list c))
    ((char<=? c (car lst)) (cons c lst))
    (else (cons (car lst) (insert-char c (cdr lst))))))

(define (normalize-str s)
  (sort-chars (filter (lambda (c) (not (char=? c #\space)))
                       (string->list (string-downcase s)))))

(define (anagram? a b)
  (equal? (normalize-str a) (normalize-str b)))

(display (anagram? "listen" "silent"))
(newline)
(display (anagram? "hello" "world"))
(newline)
