;; Narayana's cows N(n)=N(n-1)+N(n-3)
(define (grow v len)
  (if (= len 10)
      v
      (grow (append v (list (+ (list-ref v (- len 1)) (list-ref v (- len 3))))) (+ len 1))))

(for-each (lambda (x) (display x) (display " ")) (grow '(1 1 1) 3))
(newline)
