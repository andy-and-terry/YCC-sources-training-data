;; Reverse the order of words in a sentence, and each word in place.

(define (split-spaces str)
  (let loop ((cs (string->list str)) (cur '()) (acc '()))
    (define (flush) (if (null? cur) acc (cons (list->string (reverse cur)) acc)))
    (cond ((null? cs) (reverse (flush)))
          ((char=? (car cs) #\space) (loop (cdr cs) '() (flush)))
          (else (loop (cdr cs) (cons (car cs) cur) acc)))))

(define (join words)
  (cond ((null? words) "")
        ((null? (cdr words)) (car words))
        (else (string-append (car words) " " (join (cdr words))))))

(define (string-reverse* s) (list->string (reverse (string->list s))))

(define sentence "the quick brown fox")
(display (join (reverse (split-spaces sentence)))) (newline)
(display (join (map string-reverse* (split-spaces sentence)))) (newline)
