*Transducers-transforming
transformTernary: aReducingFunction
	
	| innerFunction innerResult outerReduced transformed |
	innerFunction := reduction function nonCompleting.
	innerResult := reduction value.
	outerReduced := false.
	transformed := reduction function arity = 3
		ifTrue:
			[[:result :key :value | 
			| outerResult |
			[outerResult := aReducingFunction
				value: result
				value: key -> value
				value: innerResult]
				on: Reduced
				do:
					[:reduced | 
					outerReduced := true.
					reduced pass].
			[innerResult := innerFunction value: innerResult value: key value: value]
				on: Reduced
				do:
					[:reduced | 
					innerResult := reduced parameter.
					Reduced signalWith: outerResult].
			outerResult]]
		ifFalse:
			[[:result :value | 
			| outerResult |
			[outerResult := aReducingFunction value: result value: value value:
					innerResult]
				on: Reduced
				do:
					[:reduced | 
					outerReduced := true.
					reduced pass].
			[innerResult := innerFunction value: innerResult value: value]
				on: Reduced
				do:
					[:reduced | 
					innerResult := reduced parameter.
					Reduced signalWith: outerResult].
			outerResult]].
	^transformed
		completing:
			[:result | 
			outerReduced
				ifTrue: [result]
				ifFalse:
					[aReducingFunction value: result value: nil value: innerResult]]