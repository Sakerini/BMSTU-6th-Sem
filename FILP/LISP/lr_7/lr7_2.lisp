(defun check-sets-equal (set1 set2)
	(and
		(is-subset set1 set2)
		(is-subset set2 set1)
	)
)

(defun is-subset (set subset)
	(cond
		(
			(null subset)
		)
		(
			(and 
				(contains set (car subset))
				(is-subset set (cdr subset))
			)
		)
	)
)

(defun contains (lst element)
	(cond
		(
		    (null lst)
			nil
		)
		(
			(equal (car lst) element)
		)
		(
			(contains (cdr lst) element)
		)
	)
)

(print (check-sets-equal '(1 2 3) '(1 2 3)))