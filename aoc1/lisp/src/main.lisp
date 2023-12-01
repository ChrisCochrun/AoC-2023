(defpackage aoc1-lisp
  (:use :cl))
(in-package :aoc1-lisp)

(setf *file* (alexandria:read-file-into-string "input.txt"))
(setf *list* (uiop:split-string *file* :separator "
"))
(setf *value* 0)
(loop for string in *list*
      do (let* ((first (find-if #'digit-char-p string))
                (last (find-if #'digit-char-p string :from-end t))
                (cv (uiop:strcat first last)))
           (setf *value* (+ *value* (parse-integer cv)))
           (format t "~&~a" *value*)))


;; blah blah blah.
