(defun count-symbol (c lst)
  (let ((n 0))
    (dolist (obj lst)
      (if (eql c obj)
	(setf n (+ n 1))))
    n))

(format t "~A~%" (count-symbol 'a '(a b a b a)))
