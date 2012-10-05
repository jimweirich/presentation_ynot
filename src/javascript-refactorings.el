;; The following are 4 of the 5 functional refactorings used in the
;; Y-Combinator deriviation.  Function inlining is not included
;; because it is pretty trivial to do by hand.

;; Perform a Tennent Correspondence Principle refactoring
(defun refactor-tennent ()
  (interactive)
  (save-excursion
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (insert-string "function() { return ")
    (exchange-point-and-mark)
    (insert-string " }()")))

;; Peform an Introduce Binding refactoring
(defun refactor-introduce-binding (variable-name value)
  (interactive "MVariable: \nMValue: ")
  (save-excursion
    (search-forward "(")
    (insert-string variable-name))
  (save-excursion
    (search-forward "{")
    (backward-char)
    (forward-sexp)
    (search-forward "()")
    (backward-char)
    (insert-string value)))

;; Preform a Rebind refactoring
(defun refactor-rebind (variable-name)
  (interactive "MVariable to rebind: ")
  (save-excursion
    (search-forward "(")
    (insert-string variable-name))
  (save-excursion
    (search-forward "{")
    (backward-char)
    (forward-sexp)
    (search-forward "()")
    (backward-char)
    (insert-string variable-name)))

;; Perform a Wrap Function refactoring
(defun refactor-wrap-function (argument-name)
  (interactive "MArgument Name: ")
  (save-excursion
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (insert-string "function(")
    (insert-string argument-name)
    (insert-string ") { return ")
    (exchange-point-and-mark)
    (insert-string "(")
    (insert-string argument-name)
    (insert-string ") }")))
