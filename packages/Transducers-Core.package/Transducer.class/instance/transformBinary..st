*Transducers-transforming
transformBinary: aReducingFunction
	"The reducing function has to be binary, e.g., #+ or [:result :value | ... ]."
	
	self subclassResponsibility