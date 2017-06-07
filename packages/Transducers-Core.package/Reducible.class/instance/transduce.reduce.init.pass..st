*Transducers-reducing
transduce: aTransducer reduce: aReducingFunction init: value pass: aBoolean
	"Pass ReducedNotification iff pass is true."
	
	| transformed |
	transformed := aTransducer transform: aReducingFunction.
	^self reduce: transformed init: value pass: aBoolean