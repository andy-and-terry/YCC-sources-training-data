(define edges
  '((a b 4) (a c 5) (b c -3) (c d 4) (d b 1)))

(define nodes '(a b c d))

(define infinity 999999)

(define (get-dist dist-alist node)
  (let ((entry (assq node dist-alist)))
    (if entry (cdr entry) infinity)))

(define (set-dist dist-alist node val)
  (cons (cons node val) (filter (lambda (e) (not (eq? (car e) node))) dist-alist)))

(define (relax-once dist)
  (fold-left (lambda (d edge)
               (let* ((u (car edge)) (v (cadr edge)) (w (caddr edge))
                      (du (get-dist d u)))
                 (if (and (< du infinity) (< (+ du w) (get-dist d v)))
                     (set-dist d v (+ du w))
                     d)))
             dist edges))

(define (has-negative-cycle? dist)
  (let loop ((es edges))
    (cond
      ((null? es) #f)
      (else
       (let* ((edge (car es)) (u (car edge)) (v (cadr edge)) (w (caddr edge))
              (du (get-dist dist u)))
         (if (and (< du infinity) (< (+ du w) (get-dist dist v)))
             #t
             (loop (cdr es))))))))

(define (bellman-ford source)
  (let* ((initial (set-dist (map (lambda (n) (cons n infinity)) nodes) source 0))
         (final (let loop ((d initial) (i 0))
                  (if (= i (- (length nodes) 1)) d (loop (relax-once d) (+ i 1))))))
    (if (has-negative-cycle? final)
        'negative-cycle
        final)))

(display (bellman-ford 'a))
(newline)
