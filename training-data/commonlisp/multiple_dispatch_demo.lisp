(defclass rock () ())
(defclass paper () ())
(defclass scissors () ())

(defgeneric fight (a b))

(defmethod fight ((a rock) (b scissors)) :a-wins)
(defmethod fight ((a scissors) (b paper)) :a-wins)
(defmethod fight ((a paper) (b rock)) :a-wins)
(defmethod fight ((a rock) (b paper)) :b-wins)
(defmethod fight ((a scissors) (b rock)) :b-wins)
(defmethod fight ((a paper) (b scissors)) :b-wins)
(defmethod fight (a b) (declare (ignore a b)) :tie)

(print (fight (make-instance 'rock) (make-instance 'scissors)))
(print (fight (make-instance 'paper) (make-instance 'rock)))
(print (fight (make-instance 'rock) (make-instance 'rock)))
