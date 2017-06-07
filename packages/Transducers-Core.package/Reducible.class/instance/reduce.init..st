*Transducers-reducing
reduce: aReducingFunction init: value
	"The receiver evaluates the reducing function with the initial value and the receivers first item, then with the result and the second item and so forth.
	It returns the result of the last evaluation if the receiver is not empty and the initial value otherwise.
	(See also  #inject:into:)
	
	The reducing function may be binary or ternary, e.g., #+ or [:result :key :val | ... ].
	A proper reducing function responds to #arity and the #value: interface.
	If it is of arity two, it is evaluated with the intermediate result and the current value.
	If it is of arity three and the receiver is keyed, the function is evaluated with the intermediate result, the current key and the current value.

	For example, to sum a reducible, use: 
		reducible reduce: [:subTotal :next | subTotal + next] init: 0.
	or equivalently:
		reducible reduce: #+ init: 0."
	
	^self reduce: aReducingFunction init: value pass: false