(defun count-symbol (c lst)
  (if (null lst)
    0
    (let ((n (count-symbol c (cdr lst))))
	  (if (eql c (car lst))
	    (+ n 1)
	    n))))

(format t "~A~%" (count-symbol 'a '(a b a b a)))
