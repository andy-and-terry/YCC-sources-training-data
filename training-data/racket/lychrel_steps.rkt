#lang racket

;; Reverse-and-add until a palindrome; count the steps.
(define (rev n)
  (string->number (list->string (reverse (string->list (number->string n))))))

(define (steps start)
  (let loop ([n start] [count 0])
    (cond [(and (> count 0) (= n (rev n))) count]
          [(>= count 100) -1]
          [else (loop (+ n (rev n)) (add1 count))])))

(displayln (string-join (map (compose number->string steps) '(56 57 59 79 89)) " "))
