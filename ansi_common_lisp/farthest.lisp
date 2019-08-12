(defun farthest (start goal net)
  (let ((reached (advent (list start) goal net nil nil)))
    (reverse (get-longest nil reached))))

(defun get-newpath (path net)
  (let ((new (assoc (car path) net)))
    (if (null new)
      nil
      (mapcar #'(lambda (x) (cons x path))
	      (cdr new)))))

(defun delete-duplicate (lst)
  (let ((new nil))
  (dolist (obj lst)
    (if (member (car obj) (cdr obj))
      nil
      (setf new (push obj new))))
  new))

(defun advent (path goal net queue reached)
  (if (equal goal (car path))
    (isgoal path goal net queue reached)
    (isnotgoal path goal net queue reached)))

(defun isgoal (path goal net queue reached)
  (push path reached)
  (nextpath goal net queue reached))
  
(defun isnotgoal (path goal net queue reached)
  (let ((new (get-newpath path net)))
    (setf new (delete-duplicate new))
    (if (not(null (car new)))
      (setf queue (append queue new)))
    (nextpath goal net queue reached)))

(defun nextpath (goal net queue reached)
  (if (null (car queue))
    reached
    (advent (pop queue) goal net queue reached)))

(defun get-longest (longest lst)
  (if (null (cdr lst))
    longest
    (if (< (length longest) (length (car lst)))
      (get-longest (car lst) (cdr lst))
      (get-longest longest (cdr lst)))))

;test code
(format t "~A~%" (farthest 'a 'h '((a b c)
				   (b a c d)
				   (c a d e f)
				   (d b c a h i)
				   (h b a c d e i)
				   (i f h)
				   (f g o p)
				   (p s d f a q l)
				   (l g h j z n)
				   (n o p s f q)
				   (o g h))))

;(format t "~A~%" (get-longest nil '((a b c) (a b) (a b c d e) (a) (a b c d))))
;(isnotgoal '(c b a) 'e '((a b c) (c d e a b f g)) '((e g h)) nil)
;(isgoal '(c b a) 'e '((a b c) (c d f)) '((e g h)) nil)
;(format t "~A~%" (isgoal '(c b a) 'e '((a b c) (c d f)) '((e g h)) nil))
;(format t "~A~%" (advent '(c b a) 'e '((a b c) (c d f)) '((e g h)) nil))
;(format t "~A~%" (delete-duplicate '((c c b a) (c b a) (c b c d a) (c d a) (b d b c) (b c d))))
;(format t "~A~%" (get-newpath '(c b a) '((a b c) (c d f))))
