*Transducers-transforming
transformTernary: aReducingFunction
	
	^[:result :key :value | 
	(value respondsTo: #reduce:init:)
		ifTrue:
			[value transduce: self reduce: aReducingFunction init: result pass: true]
		ifFalse: [aReducingFunction value: result value: key value: value]]