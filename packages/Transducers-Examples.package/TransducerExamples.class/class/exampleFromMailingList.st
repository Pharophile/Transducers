as yet unclassified
exampleFromMailingList
	| scale sides count collect experiment samples coin flip |
	scale := [ :x | (x * 2 + 1) floor ] map.
	sides := #(heads tails) replace.
	count := 1000 take.
	collect := [ :bag :c | 
	bag
		add: c;
		yourself ].
	experiment := scale * sides * count transform: collect.
	"experiment cannot be re-used"
	samples := Random new reduce: experiment init: Bag new.
	"transform and reduce in one step"
	samples := Random new transduce: scale * sides * count reduce: collect init: Bag new.
	"assemble coin (eduction) and flip (reduction) objects"
	coin := sides <~ scale <~ Random new.
	flip := Bag <~ count.
	"flip coin =)"
	samples := flip <~ coin