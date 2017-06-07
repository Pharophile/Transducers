*Transducers-printing
printOn: aStream
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: #collection:;
		space.
	collection printOn: aStream