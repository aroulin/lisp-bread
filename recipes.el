(defconst *tessinois-bread* '(
    (ingredients
        (ap-flour           (grams 250))
        (water              (ml 160))
        (active-dry-yeast   (tsp 1))
        (oil                (grams 12))
        (salt               (tsp (/ 1 2)))
        (sugar              (grams 5)))
    (steps
        (prepare-yeast  active  (minutes 10)
            (mix active-dry-yeast in water and wait for bubbles))
        (mixing         active  (minutes 15)
            (mix ap-flour sugar salt and slowly incorporate lukewarm-water while kneading))
        (first-rise     passive (hours 1)
            (shape into a ball and let rise for an hour till doubled in size))
        (shape          active  (minutes 15)
            (divide into 5 or 6 balls make them longer on one size and align them.
             Make the incision. Preheat oven to 400F))
        (second-rise    passive (minutes 45)
            (rise for 40 minutes))
        (brush          active  (minutes 5)
            (brush with lukewarm-water or egg yolk with milk))
        (bake           passive (minutes 30)
            (bake for 30 minutes or until golden))
     )))

(defconst *naan* '(
    (ingredients
        (ap-flour           (oz 13.75))
        (water              (cups 1))
        (active-dry-yeast   (tsp 2.25))
        (oil                (tbsp 1))
        (salt               (tsp 1.5))
        (sugar              (tsp 2))
        (whole-milk-yogurt  (oz 2))
	(butter             (tbsp 1.5)))
    (steps
        (mixing         active  (minutes 20)
            (mix ap-flour active-dry-yeast salt and slowly incorporate mixed water oil sugar and whole-milk-yogurt while kneading))
        (first-rise     passive (hours 1.5)
            (shape into a ball and let rise for an hour till doubled in size))
        (shape          active  (minutes 15)
            (divide into 4 balls
            Preheat oven to 200F))
        (second-rise    passive (minutes 10)
            (rise for 10 minutes))
        (roll-and-bake  active  (minutes 30)
	    (brush cast iron with oil. Heat on medium for 5 minutes. Wipe excess oil.
	    Press and roll each ball into 9-inch circle. Poke 20-25 times.
	    cook each side for 2-4 minutes until puffy/brown. Poke any air bubble.
	    keep warm in oven, covered with aluminium foil))
        (brush          active (minutes 10)
            (brush with melted butter))
     )))
