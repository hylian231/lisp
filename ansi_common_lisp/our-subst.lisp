(defun our-subst (new old tree)
  (if (eql old tree)
    new
    (if (atom tree)
      tree
      (cons (our-subst new old (car tree))
	    (our-subst new old (cdr tree))))))

(defparameter *lst* '(1 2 3 (1 1 2 ( 1 3 2 ( 2 1 ) 1 ( 1 2 ) (3 1) 3 (1 2 3 ) 1 2) 1)))

(format t "~A~%" (our-subst 1 2 *lst*))
