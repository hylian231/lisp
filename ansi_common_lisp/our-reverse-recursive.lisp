(defun our-reverse (lst)
  (if (atom lst)
    lst
    (let ((len (length lst)))
      (cons (nth (- len 1) lst)
	    (our-reverse (subseq lst 0 (- len 1)))))))

(format t "~A~%" (our-reverse '(1 2 3 4 5)))
