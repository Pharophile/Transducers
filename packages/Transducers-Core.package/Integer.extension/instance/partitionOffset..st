*Transducers-Core-transforming
partitionOffset: offset
	"Create a transducer that splits a reducible in sub-collections of the size of the receiver and starts a new sub-collections after offset elements"
	
	^Partition size: self offset: offset