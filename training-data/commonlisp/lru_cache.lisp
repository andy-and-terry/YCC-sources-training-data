(defstruct lru-cache
  (capacity 2)
  (store (make-hash-table))
  (order nil))

(defun lru-touch (cache key)
  (setf (lru-cache-order cache)
        (cons key (remove key (lru-cache-order cache)))))

(defun lru-get (cache key)
  (multiple-value-bind (value found) (gethash key (lru-cache-store cache))
    (if found
        (progn (lru-touch cache key) value)
        nil)))

(defun lru-put (cache key value)
  (setf (gethash key (lru-cache-store cache)) value)
  (lru-touch cache key)
  (when (> (length (lru-cache-order cache)) (lru-cache-capacity cache))
    (let ((evict (car (last (lru-cache-order cache)))))
      (setf (lru-cache-order cache) (butlast (lru-cache-order cache)))
      (remhash evict (lru-cache-store cache)))))

(let ((cache (make-lru-cache :capacity 2)))
  (lru-put cache :a 1)
  (lru-put cache :b 2)
  (format t "~a~%" (lru-get cache :a))
  (lru-put cache :c 3)
  (format t "~a~%" (lru-get cache :b))
  (format t "~a~%" (lru-get cache :c)))
