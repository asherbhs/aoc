(ns clojure-aoc.core
  (:gen-class)
  (:require clojure-aoc.year2015.day01))

; calva shotcuts:
; ctrl+left/right      - left/right sexp on this level
; shift+alt+right/left - expand/shrink selection
; ctrl+alt+./,         - slurp/barf forward
; ctrl_end             - end of list

(defn -main [year day part path]
  (let [input (slurp path)]
    (println (case year
               "2015" (case day
                        "01" (case part
                               "1" (clojure-aoc.year2015.day01/solve-part-1 input)
                               "2" (clojure-aoc.year2015.day01/solve-part-2 input)))))))
