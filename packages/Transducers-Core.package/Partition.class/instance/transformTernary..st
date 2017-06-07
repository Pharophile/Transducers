*Transducers-transforming
transformTernary: aReducingFunction
	
	| size distance isReduced parts count transformed |
	size := n.
	distance := offset.
	isReduced := false.
	parts := OrderedCollection new.
	count := -1.
	transformed := [:result :key :value | 
	(count := (count + 1) \\ distance) = 0
		ifTrue: [parts add: key -> (OrderedCollection new: size)].
	parts do: [:part | part value add: value].
	(parts notEmpty and: [parts first value size = size])
		ifTrue:
			[[| part |
			part := parts removeFirst.
			aReducingFunction
				value: result
				value: part key
				value: part value]
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
						into:
							[:res :part | 
							aReducingFunction
								value: res
								value: part key
								value: part value]]
						on: Reduced
						do: [:reduced | reduced parameter]]]