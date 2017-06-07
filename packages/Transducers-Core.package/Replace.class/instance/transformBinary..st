*Transducers-transforming
transformBinary: aReducingFunction
	
	| copyLut |
	copyLut := lookup.	"copy lookup table reference to have less indirection in copying block"
	^[:result :value | 
	aReducingFunction
		value: result
		value:
			(copyLut
				at: value
				ifAbsent: [value])]