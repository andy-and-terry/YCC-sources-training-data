(defun quicksort (items)
  (if (or (null items) (null (cdr items)))
      items
      (let* ((pivot (car items))
             (rest (cdr items))
             (smaller (remove-if-not (lambda (x) (< x pivot)) rest))
             (larger (remove-if-not (lambda (x) (>= x pivot)) rest)))
        (append (quicksort smaller) (list pivot) (quicksort larger)))))

(print (quicksort '(5 3 8 1 9 2)))
