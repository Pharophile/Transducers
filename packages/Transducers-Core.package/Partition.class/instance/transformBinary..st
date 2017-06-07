*Transducers-transforming
transformBinary: aReducingFunction
	
	| size distance isReduced parts count transformed |
	size := n.
	distance := offset.
	isReduced := false.
	parts := OrderedCollection new.
	count := -1.
	transformed := [:result :value | 
	(count := (count + 1) \\ distance) = 0
		ifTrue: [parts add: (OrderedCollection new: size)].
	parts do: [:part | part add: value].
	(parts notEmpty and: [parts first size = size])
		ifTrue:
			[[aReducingFunction
				value: result
				value: parts removeFirst]
				on: Reduced
				do:
					[:reduced | 
					isReduced := true.
					reduced pass]]
		ifFalse: [result]].
	^transformed
		completing:
			[:result | 
			isReduced
				ifTrue: [result]
				ifFalse:
					[[parts
						inject: result
						into: [:res :part | aReducingFunction value: res value: part]]
						on: Reduced
						do: [:reduced | reduced parameter]]]