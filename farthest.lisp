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

;(defun advent (path goal net queue reached)
  ;(if (equal goal (car path))
    ;(progn
      ;(push path reached)
      ;(if (null (car queue))
	;reached
	;(advent (pop queue) goal net queue reached)))
    ;(let ((new (get-newpath path net)))
      ;(setf new (delete-duplicate new))
      ;(if (not(null (car new)))
	;(append queue new))
      ;(advent (pop queue) goal net queue reached))))

;(defun advent (path goal net queue reached)
  ;(if (equal goal (car path))
    ;(isgoal path goal net queue reached)
    ;(let ((new (get-newpath path net)))
      ;(setf new (delete-duplicate new))
      ;(if (not(null (car new)))
	;(append queue new))
      ;(advent (pop queue) goal net queue reached))))

;(defun isgoal (path goal net queue reached)
  ;(push path reached)
  ;(if (null (car queue))
    ;reached
    ;(advent (pop queue) goal net queue reached)))

(defun isgoal (path goal net queue reached)
  (push path reached)
  (restpath goal net queue reached))

(defun isnotgoal (path goal net queue reached)
  (let ((new (get-newpath path net)))
    (setf new (delete-duplicate new))
    (if (not(null (car new)))
      (append queue new))
    (restpath goal net queue reached)))

(defun restpath (goal net queue reached)
  (if (null (car queue))
    reached
    (advent (pop queue) goal net queue reached)))

(defun advent (path goal net queue reached)
  (if (equal goal (car path))
    (isgoal path goal net queue reached)
    (isnotgoal path goal net queue reached)))

(format t "~A~%" (advent '(c b a) 'e '((a b c) (c d f)) '((e g h)) nil))
;(format t "~A~%" (delete-duplicate '((c c b a) (c b a) (c b c d a) (c d a) (b d b c) (b c d))))
;(format t "~A~%" (get-newpath '(c b a) '((a b c) (c d f))))
