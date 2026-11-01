;; Reverse-and-add until a palindrome; count the steps.
(define (rev n)
  (string->number (list->string (reverse (string->list (number->string n))))))

(define (steps start)
  (let loop ((n start) (count 0))
    (cond ((and (> count 0) (= n (rev n))) count)
          ((>= count 100) -1)
          (else (loop (+ n (rev n)) (+ count 1))))))

(for-each (lambda (n) (display (steps n)) (display " ")) '(56 57 59 79 89))
(newline)
