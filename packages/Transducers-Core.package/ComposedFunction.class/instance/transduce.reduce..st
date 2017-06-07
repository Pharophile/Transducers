*Transducers-reducing
transduce: aTransducer reduce: aReduction
	
	^self
		transduce: aTransducer
		reduce: aReduction function
		init: aReduction value