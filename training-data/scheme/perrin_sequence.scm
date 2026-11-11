;; Perrin sequence P(n)=P(n-2)+P(n-3)
(define (grow v len)
  (if (= len 10)
      v
      (grow (append v (list (+ (list-ref v (- len 2)) (list-ref v (- len 3))))) (+ len 1))))

(for-each (lambda (x) (display x) (display " ")) (grow '(3 0 2) 3))
(newline)
