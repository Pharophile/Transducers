*Transducers-reducing
transduce: aTransducer reduce: aReducingFunction init: value
	"Firstly, the receiver transforms the reducing function using a transducer.
	Secondly, it evaluates the transformed function with the initial value and the first item, then with the result and the second item and so forth.
	Finally, the receiver sends #complete: with the last result (or the initial value if the receiver is empty) to the transformed function and returns the answer.
	(See also  #reduce:init: and #inject:into:)
	
	The reducing function may be binary or ternary, e.g., #+ or [:result :key :val | ... ].
	A proper reducing function responds to #arity, #complete and the #value: interface.
	If it is of arity two, it is evaluated with the intermediate result and the current value.
	If it is of arity three and the receiver is keyed, the function is evaluated with the intermediate result, the current key and the current value.
	
	For example, to sum the squares of the numbers in a reducible, use: 
		reducible transduce: [:x | x squared] mapping function: [:subTotal :next | subTotal + next] initialValue: 0.
	or equivalently:
		reducible transduce: #squared mapping function: #+ initialValue: 0."
	
	^self transduce: aTransducer reduce: aReducingFunction init: value pass:
			false