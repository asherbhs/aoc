(ns clojure-aoc.year2015.day01)

(defn solve-part-1 [input]
  (reduce (fn [floor c] (+ floor (case c \( 1 \) -1)))
          0
          input))

(defn solve-part-2 [input]
  (->> input
       (reductions (fn [floor c] (+ floor (case c \( 1 \) -1)))
                   0)
       (take-while nat-int?)
       (count)))