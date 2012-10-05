;; The following are 4 of the 5 functional refactorings used in the
;; Y-Combinator deriviation.  Function inlining is not included
;; because it is pretty trivial to do by hand.

;; Perform a Tennent Correspondence Principle refactoring
(defun rrf-tennent (pt mk)
  (interactive "r")
  (save-excursion
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (goto-char mk)
    (insert-string " }.()")
    (goto-char pt)
    (insert-string "->() { ")))

;; Peform an Introduce Binding refactoring
(defun rrf-introduce-binding (variable-name value)
  (interactive "MVariable: \nMValue: ")
  (save-excursion
    (search-forward "(")
    (insert-string variable-name))
  (save-excursion
    (search-forward ")")
    (forward-sexp)
    (search-forward "(")
    (insert-string value)))

;; Preform a Rebind refactoring
(defun rrf-rebind (variable-name)
  (interactive "MVariable to rebind: ")
  (save-excursion
    (search-forward "(")
    (insert-string variable-name))
  (save-excursion
    (search-forward ")")
    (forward-sexp)
    (search-forward "(")
    (insert-string variable-name)))

;; Perform a Wrap Function refactoring
(defun rrf-wrap-function (argument-name)
  (interactive "MArgument Name: ")
  (save-excursion
    (insert-string "->(")
    (insert-string argument-name)
    (insert-string ") { ")
    (search-forward "{")
    (backward-char 1)
    (forward-sexp)
    (insert-string ".(")
    (insert-string argument-name)
    (insert-string ") }")))

;; (defun rrf-inline-definition (start finish)
;;   (interactive "r")
;;   (copy-to-register 2 start finish)
;;   (save-excursion
;;     (if (> (point) (mark))
;;         (exchange-point-and-mark))
;;     (move-beginning-of-line 1)
;;     (search-forward " = ")
;;     (backward-char 3)
;;     (let ((wpoint (point)))
;;       (search-backward " ")
;;       (forward-char 1)
;;       (copy-to-register 1 (point) wpoint))
;;     (replace-string (get-register 1) (get-register 2))
;;     (goto-char start)
;;     (move-beginning-of-line 1)
;;     (kill-region (point) finish)))
