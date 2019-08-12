(defun have-list (x)
  (if (null x)
    nil
    (or (listp (car x))
	(have-list (cdr x)))))

(format t "~A~%" (have-list '(1 2 nil 4 5)))
