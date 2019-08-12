(defun our-assoc (sym lst)
  (and (consp lst)
       (consp (car lst))
       (let ((x (car lst)))
	 (if (equal sym (car x))
	   (car lst)
	   (our-assoc sym (cdr lst))))))

(defparameter *t* '*)
(defparameter *l* '((+ . "add") (- . "substract")))

(format t "~A~%" (our-assoc *t* *l*))
