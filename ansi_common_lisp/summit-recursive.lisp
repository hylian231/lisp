(defun summit (lst)
  (let ((n (if (cdr lst)
	     (summit (cdr lst))
	     0)))
    (if (car lst)
      (setf n (+ n (car lst)))
      n)))

(format t "~A~%" (summit '(nil 1 nil 2 nil 3 nil 4 nil 5 nil)))
