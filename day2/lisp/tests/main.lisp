(defpackage day2/tests/main
  (:use :cl
        :day2
        :rove))
(in-package :day2/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :day2)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
