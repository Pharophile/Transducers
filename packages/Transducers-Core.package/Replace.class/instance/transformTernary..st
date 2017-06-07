*Transducers-transforming
transformTernary: aReducingFunction
	
	| copyLut |
	copyLut := lookup.	"copy lookup table reference to have less indirection in copying block"
	^[:result :key :value | 
	aReducingFunction
		value: result
		value: key
		value:
			(copyLut
				at: value
				ifAbsent: [value])]