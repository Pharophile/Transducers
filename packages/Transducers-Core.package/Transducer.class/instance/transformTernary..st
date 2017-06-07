*Transducers-transforming
transformTernary: aReducingFunction
	"The reducing function has to be ternary, e.g., [:result :key :value | ... ]."
	
	self subclassResponsibility