(defun mf-fl(ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
(list (list ar1 (list (list ar2)(list ar3))(list ar4))(list (list ar5)) ar6 (list (list ar7) ar8 (list 9)))
)

;(defun mf-fq(ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
;'((,ar1((,ar2)(,ar3))(,ar4))((,ar5)) ,ar6 ((,ar7) ,ar8 (,ar9)))
;)

;(defun mf-fq(ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
;(cons (cons ((cons (cons ar1 (cons (cons (cons ar2 nil)(cons (cons ar3 nil) nil)) nil)))(cons (cons 4 nil) nil)(cons (cons (cons ar 5 nil) nil) nil)) (cons ((cons (cons (cons ar7 nil) ar8) (cons (cons ar9 nil))))))nil)
;)

;(print (mf-fq '1 '2 '3 '4 '5 '6 '7 '8 '9))


;(defun lol (x)
;(if (= x 5)
;    'eval 
;    `funcall))


;(print (funcall (lol 5) `(- ,(funcall (lol 4) '+ 1 3) 7)))
;(print (funcall 'eval `(- , (funcall (lol 4) '+ 1 3) 7)))
;(print (funcall 'eval `(-, (funcall 'funcall '+ 1 3) 7)))

;(defun x() 9)
;(setq x 'y)
;(setq y 'x)
;(defun y() 7)
;(print (funcall(eval x)))


(defun swap-first-last (lst)
    (cond
        ((null lst) Nil)
        ((eql (length lst) 1) lst)
        (T
            (append
                (last lst)
                (mapcar #'(lambda (el _) el) (cdr lst) (cddr lst))
                (list (first lst))
            )
        )
    )
)

(print (swap-first-last ())) ;;; Nil
(print (swap-first-last '(1))) ;;; (1)
(print (swap-first-last '(1 2))) ;;; (2 1)
(print (swap-first-last '(1 2 3 4 5))) ;;; (5 2 3 4 1)


