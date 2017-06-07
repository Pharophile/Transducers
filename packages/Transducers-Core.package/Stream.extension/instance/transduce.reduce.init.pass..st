*Transducers-Core-reducing
transduce: aTransducer reduce: aReducingFunction init: value pass: pass
	"Generic transduce implementation for all streams, see Reducible>>transduce:function:initialValue.
	The reducing function may be binary or ternary, e.g., #+ or [:result :key :val | ... ].

	Pass ReducedNotification iff pass is true"
	
	| transformed |
	transformed := aTransducer transform: aReducingFunction.
	^self reduce: transformed init: value pass: pass