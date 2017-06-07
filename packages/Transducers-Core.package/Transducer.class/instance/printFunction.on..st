*Transducers-printing
printFunction: fn on: aStream
	
	(fn respondsTo: #printAsFunctionOn:)
		ifTrue: [fn printAsFunctionOn: aStream]
		ifFalse: [fn printOn: aStream]