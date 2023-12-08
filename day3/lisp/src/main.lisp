(defpackage day3
  (:use :cl :iterate :serapeum :str))
(in-package :day3)

(defvar input (alexandria:read-file-into-string #p"../../input.txt"))
(defvar lines (str:lines input))

(deftype value () '(member :empty :symbol :num))

;; in lisp structs name-prop is the way to get values
;; (setf name-prop x) is how to set them
(defstruct num
  (x 0 :type integer)
  (y 0 :type integer)
  (kind :empty :type value)
  (value 0 :type integer))

(setf value-list '())

(iter (for line in lines)
  (generate index from 0)
  (let ((index (next index)))
    (iter (for char in (coerce line 'list))
      (uiop:println char)
      (generate i from 0)
      (cond ((string= "." char)
             (push (make-num :x (next i) :y index) value-list))
            ((digit-char-p char)
             (push (make-num :x (next i) :y index
                             :value (digit-char-p char)
                             :kind :num) value-list))
            (t (push (make-num :x (next i) :y index :kind :symbol) value-list))))))


(iter (for item in value-list)
  (if (eql (num-kind item) :num)
      (let (()))))

;; Useful for filtering list
;; :when (str:starts-with? "4" line)

;; This time I'm trying with the iterate macro functions instead of loop.

;; blah blah blah.
