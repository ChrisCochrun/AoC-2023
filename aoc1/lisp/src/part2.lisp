(defpackage aoc1-lisp
  (:use :cl))
(in-package :aoc1-lisp)

(setf *file* (alexandria:read-file-into-string "input.txt"))
(setf *list* (uiop:split-string *file* :separator "
"))
(setf *numstrs* '("one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
(setf *nums* '("1" "2" "3" "4" "5" "6" "7" "8" "9"))
(setf *value* 0)
(loop for string in *list*
      do 
         (let* ((first (find-if #'digit-char-p string))
                (last (find-if #'digit-char-p string :from-end t)))

           (loop for num in *nums*
                 do (let* ((first-num (position first string
                                                :test #'string=))
                           (last-num (position last string
                                               :test #'string= :from-end t))
                           (first-str (position num string
                                                :test #'string=))
                           (last-str (position num string
                                               :test #'string=
                                               :from-end t))
                           (first (if (< first-num first-str)
                                      first-num
                                      first-str))
                           (last (if (> last-num last-str)
                                     last-num
                                     last-str))
                           (cv (uiop:strcat first last)))
                      (setf *value* (+ *value* (parse-integer cv)))
                      (format t "~&~a" *value*)))))


;; blah blah blah.
