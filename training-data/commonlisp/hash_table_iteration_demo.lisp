(let ((table (make-hash-table :test 'equal)))
  (setf (gethash "one" table) 1
        (gethash "two" table) 2
        (gethash "three" table) 3)
  (print (hash-table-count table))
  (print (gethash "two" table))
  (print (sort (loop for k being the hash-keys of table collect k) #'string<))
  (print (loop for v being the hash-values of table sum v))
  (remhash "one" table)
  (maphash (lambda (k v) (declare (ignore k v))) table)
  (print (nth-value 1 (gethash "one" table))))
