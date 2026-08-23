(defparameter *config* '(:host "localhost" :port 8080 :debug t))

(print (getf *config* :host))
(print (getf *config* :port))
(print (getf *config* :missing "default"))
