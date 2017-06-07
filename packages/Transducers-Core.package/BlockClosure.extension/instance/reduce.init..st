*Transducers-Core-reducing
reduce: aReducingFunction init: value
	
	^self reduce: aReducingFunction init: value pass: false