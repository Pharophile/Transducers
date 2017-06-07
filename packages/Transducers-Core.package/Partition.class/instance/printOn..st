*Transducers-printing
printOn: aStream
	
	n printOn: aStream.
	aStream space.
	n = offset
		ifTrue: [aStream nextPutAll: #partition]
		ifFalse:
			[aStream
				nextPutAll: #partitionOffset:;
				space.
			offset printOn: aStream]