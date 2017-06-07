A ReducingFunction it is an accumulation function. It may be binary or ternary and takes as arguemnts an accumulated result (R), optionally a new key (K), and a new value (V).
	fn : R x V -> A (binary)
	fn : R x K x V -> R (ternary)

Typical instances are binary/ternary blocks and symbols.

Subclasses must implement the following messages:
	accessing
		arity
			Answer the number of arguments required to evaluate the receiver.
	completing
		complete:
			Perform an completing action. The default action does nothing.
		completing:
			Attach an additional completing action.
	evaluating
		value:value:
			Evaluate the reducing function if it is binary.
		value:value:value:
			Evaluate the reducing function if it is ternary.
