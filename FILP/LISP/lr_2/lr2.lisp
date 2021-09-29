;; Задание 2

(defvar L '(1 2 3 4 5))
;; второй элемент
(print (car (cdr L)))
;; третый элемент
(print (car (cdr (cdr L))))
;; четверый элемент
(print (car (cdr (cdr (cdr L)))))

(describe 'cadr)



;; Задание 3
(defvar A '((blue cube) (red pyramid)))
(defvar B '((abc) (def) (ghi)))

(print (caadr A))
(print (cdar B))
(print (cadr B))
(print (caddr B))

;; Задание 4

;(print (list 'Fred 'and 'Wilma)) ;;; (FRED AND WILMA)
;(print (list 'Fred '(and Wilma))) ;;; (FRED (AND WILMA))
;(print (cons Nil Nil))
;(print (cons Nil 'T))
;(print (list Nil))
;(print (cons '(T) Nil))
;(print (list '(one two) '(free temp)))


;; Задание 5
(defun my-f (ar1 ar2 ar3 ar4)
(cons '(ar1 ar2) (list '(ar3 ar4)))
)

(print (my-f 'A 'B 'C 'D))

(defun my-f2 (ar1 ar2)
(list '(ar1) '(ar2))
)

(print (my-f2 'A 'B))

(defun my-f3 (ar1)
(list '((ar1)))
)

(print (my-f3 'A))


((1((2) (3))(4))((5))6((7)8(9)))

(defun mf-fl(ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 ar9)
(list (list ar1 (list (list ar2)(list ar3))(list ar4))(list (list ar5)) ar6 (list (list ar7) ar8 (list 9))
)
