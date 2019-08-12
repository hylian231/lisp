(defun pos+ (lst)
  (let ((pos 0))
    (mapcar #'(lambda (x)
		(setf pos (+ 1 pos))
		(+ x (- pos 1)))
	    lst)))

(format t "~A~%" (pos+ '(1 2 3 4 5)))
