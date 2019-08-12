(defun index (x y)
  (and (not (null y))
       (if (eql x (car y))
	 0
	 (let ((z (index x (cdr y))))
	       (and z (+ z 1))))))

(format t "~A~%" (funcall #'index 8 '(1 2 3 4 5)))
