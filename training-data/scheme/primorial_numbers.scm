;; Primorials up to 1e6, including 1; expect 8.
(define (prime? n)
  (and (> n 1)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (modulo n d)) #f)
               (else (loop (+ d 1)))))))

(define (count-range lo hi pred)
  (let loop ((i lo) (c 0))
    (if (>= i hi) c (loop (+ i 1) (if (pred i) (+ c 1) c)))))

(define (primorials)
  (let loop ((p 2) (acc 1) (count 1))
    (cond ((not (prime? p)) (loop (+ p 1) acc count))
          ((> (* acc p) 1000000) count)
          (else (loop (+ p 1) (* acc p) (+ count 1))))))
(display (primorials))
(newline)
