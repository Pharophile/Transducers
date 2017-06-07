*Transducers-reducing
reduce: aReducingFunction init: value pass: pass
	
	^reducible transduce: transducer reduce: aReducingFunction init: value
		pass: pass