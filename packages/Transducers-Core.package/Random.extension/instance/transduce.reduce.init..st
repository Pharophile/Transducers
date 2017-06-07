*Transducers-Core-reducing
transduce: aTransducer reduce: aReducingFunction init: value

	^self transduce: aTransducer reduce: aReducingFunction init: value pass:
			false