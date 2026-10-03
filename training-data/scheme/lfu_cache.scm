;; An LFU cache over an association list of (key value . freq) entries;
;; evicts whichever key has the lowest freq when capacity is exceeded.

(define (make-lfu capacity) (list capacity '()))
(define (lfu-capacity cache) (car cache))
(define (lfu-entries cache) (cadr cache))

(define (bump-freq entries key)
  (map (lambda (e) (if (eq? (car e) key) (cons (car e) (cons (cadr e) (+ 1 (cddr e)))) e))
       entries))

(define (lfu-get cache key)
  (let ((entry (assq key (lfu-entries cache))))
    (if entry
        (cons (cadr entry) (list (lfu-capacity cache) (bump-freq (lfu-entries cache) key)))
        (cons #f cache))))

;; On a frequency tie, <= lets a later (older, since new puts are
;; prepended) entry win, so a just-inserted key is not the first one
;; evicted again immediately.
(define (least-frequent entries)
  (car (fold-left (lambda (best e) (if (<= (cddr e) (cddr best)) e best))
                   (car entries)
                   (cdr entries))))

(define (lfu-put cache key value)
  (let* ((without (filter (lambda (e) (not (eq? (car e) key))) (lfu-entries cache)))
         (added (cons (cons key (cons value 1)) without))
         (trimmed (if (> (length added) (lfu-capacity cache))
                      (filter (lambda (e) (not (eq? (car e) (least-frequent added)))) added)
                      added)))
    (list (lfu-capacity cache) trimmed)))

(define c1 (make-lfu 2))
(define c2 (lfu-put (lfu-put c1 'a 1) 'b 2))
(define get-a (lfu-get c2 'a))
(define c3 (cdr get-a))
(define c4 (lfu-put c3 'c 3))

(display (car (lfu-get c4 'b)))
(newline)
(display (car (lfu-get c4 'c)))
(newline)
