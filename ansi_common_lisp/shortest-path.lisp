(defun get-paths (node path net)
  (mapcar #'(lambda (x) (cons x path))
	      (cdr (assoc node net))))

(defun search-broadly (end queue net)
  (if (null queue)
    nil
    (let ((path (car queue)))
      (let ((node (car path)))
	(if (eql end node)
	  (reverse path)
	  (search-broadly end
			  (append (cdr queue)
				  (get-paths node path net))
			  net))))))

(defun shortest-path (start end net)
  (search-broadly end (list (list start)) net))

(defconstant *n* '((a b c) (b c) (c d)))

(format t "~A~%" (shortest-path 'a 'd *n*))
