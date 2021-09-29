(defun alloddr (lst)
  (alloddr_rec lst Nil)
)

(defun alloddr_rec (lst state)
  (cond
    ((null lst) state)
    ((evenp (car lst)) Nil)
    (t (alloddr_rec (cdr lst) (setq state T)))
  )
)

(print (alloddr '(1 1)))