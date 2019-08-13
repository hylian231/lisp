(defun binary-search (target vec)
  (let ((end (- (length vec) 1)))
    (next target vec 0 end)))

(defun next (target vec start end)
  (let ((mid (+ start (round (/ (- end start) 2)))))
    (let ((num (aref vec mid)))
      (if (> num target)
	(next target vec start (- mid 1))
	(if (< num target)
	  (next target vec (+ mid 1) end)
	  (if (equal num target)
	    mid
	    nil))))))

(defparameter *vec* (vector 1 2 3 4 5 6 7 8 9 10))
;(defparameter *vec* (vector 1 2 3 4 5 6 7 8 9))
;(defparameter *vec* (vector 0 1 2 3 4 5 6 7 8 9 10))
;(defparameter *vec* (vector 0 1 2 3 4 5 6 7 8 9))

(format t "~A~%" (binary-search 5 *vec*))
(format t "~A~%" (binary-search 8 *vec*))
