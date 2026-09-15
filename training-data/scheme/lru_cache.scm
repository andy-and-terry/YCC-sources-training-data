;; A simple LRU cache over an association list, most-recently-used first.

(define (make-lru capacity) (list capacity '()))

(define (lru-capacity cache) (car cache))
(define (lru-entries cache) (cadr cache))

(define (lru-get cache key)
  (let ((entry (assq key (lru-entries cache))))
    (if entry
        (cons (cdr entry)
              (list (lru-capacity cache)
                    (cons entry (filter (lambda (e) (not (eq? (car e) key))) (lru-entries cache)))))
        (cons #f cache))))

(define (lru-put cache key value)
  (let* ((without (filter (lambda (e) (not (eq? (car e) key))) (lru-entries cache)))
         (updated (cons (cons key value) without))
         (trimmed (if (> (length updated) (lru-capacity cache))
                      (reverse (cdr (reverse updated)))
                      updated)))
    (list (lru-capacity cache) trimmed)))

(define cache1 (make-lru 2))
(define cache2 (lru-put (lru-put cache1 'a 1) 'b 2))
(display (car (lru-get cache2 'a)))
(newline)

(define cache3 (cdr (lru-get cache2 'a)))
(define cache4 (lru-put cache3 'c 3))
(display (car (lru-get cache4 'b)))
(newline)
(display (car (lru-get cache4 'a)))
(newline)
