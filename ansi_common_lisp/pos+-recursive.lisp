(defun plus(lst pos)
  (if (atom lst)
    nil
    (cons (+ (car lst) pos)
	  (plus (cdr lst) (+ pos 1)))))

(defun pos+ (lst)
  (plus lst 0))

(format t "~A~%" (pos+ '(1 2 3 4 5)))
