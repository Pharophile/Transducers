# Transducers
Composable Algorithm Transformations

Transducers are building blocks that encapsulate how to process elements
of a data sequence independently of the underlying input and output source.

# Overview

## Encapsulate
Implementations of enumeration methods, such as #collect:, have the logic
how to process a single element in common.
However, that logic is reimplemented each and every time. Transducers make
it explicit and facilitate re-use and coherent behavior.
For example:
- #collect: requires mapping: (aBlock1 map)
- #select: requires filtering: (aBlock2 filter)


## Compose
In practice, algorithms often require multiple processing steps, e.g.,
mapping only a filtered set of elements.
Transducers are inherently composable, and hereby, allow to make the
combination of steps explicit.
Since transducers do not build intermediate collections, their composition
is memory-efficient.
For example:
- (aBlock1 filter) * (aBlock2 map)   "(1.) filter and (2.) map elements"


## Re-Use
Transducers are decoupled from the input and output sources, and hence,
they can be reused in different contexts.
For example:
- enumeration of collections
- processing of streams
- communicating via channels



# Usage by Example

We build a coin flipping experiment and count the occurrence of heads and
tails.

First, we associate random numbers with the sides of a coin.

    scale := [:x | (x * 2 + 1) floor] map.
    sides := #(heads tails) replace.

Scale is a transducer that maps numbers x between 0 and 1 to 1 and 2.
Sides is a transducer that replaces the numbers with heads an tails by
lookup in an array.
Next, we choose a number of samples.

    count := 1000 take.

Count is a transducer that takes 1000 elements from a source.
We keep track of the occurrences of heads an tails using a bag.

    collect := [:bag :c | bag add: c; yourself].

Collect is binary block (reducing function) that collects events in a bag.
We assemble the experiment by transforming the block using the transducers.

    experiment := (scale * sides * count) transform: collect.

  From left to right we see the steps involved: scale, sides, count and
collect.
Transforming assembles these steps into a binary block (reducing function)
we can use to run the experiment.

    samples := Random new
                  reduce: experiment
                  init: Bag new.

Here, we use #reduce:init:, which is mostly similar to #inject:into:.
To execute a transformation and a reduction together, we can use
#transduce:reduce:init:.

    samples := Random new
                  transduce: scale * sides * count
                  reduce: collect
                  init: Bag new.

We can also express the experiment as data-flow using #<~.
This enables us to build objects that can be re-used in other experiments.

    coin := sides <~ scale <~ Random new.
    flip := Bag <~ count.

Coin is an eduction, i.e., it binds transducers to a source and
understands #reduce:init: among others.
Flip is a transformed reduction, i.e., it binds transducers to a reducing
function and an initial value.
By sending #<~, we draw further samples from flipping the coin.

    samples := flip <~ coin.

This yields a new Bag with another 1000 samples.



# Basic Concepts

## Reducing Functions

A reducing function represents a single step in processing a data sequence.
It takes an accumulated result and a value, and returns a new accumulated
result.
For example:

    collect := [:col :e | col add: e; yourself].
    sum := #+.

A reducing function can also be ternary, i.e., it takes an accumulated
result, a key and a value.
For example:

    collect := [:dic :k :v | dict at: k put: v; yourself].

Reducing functions may be equipped with an optional completing action.
After finishing processing, it is invoked exactly once, e.g., to free
resources.

    stream := [:str :e | str nextPut: each; yourself] completing: #close.
    absSum := #+ completing: #abs

A reducing function can end processing early by signaling Reduced with a
result.
This mechanism also enables the treatment of infinite sources.

    nonNil := [:res :e | e ifNil: [Reduced signalWith: res] ifFalse: [res]].

The primary approach to process a data sequence is the reducing protocol
with the messages #reduce:init: and #transduce:reduce:init: if transducers
are involved.
The behavior is similar to #inject:into: but in addition it takes care of:
- handling binary and ternary reducing functions,
- invoking the completing action after finishing, and
- stopping the reduction if Reduced is signaled.
The message #transduce:reduce:init: just combines the transformation and
the reducing step.

However, as reducing functions are step-wise in nature, an application may
choose other means to process its data.


## Reducibles

A data source is called reducible if it implements the reducing protocol.
Default implementations are provided for collections and streams.
Additionally, blocks without an argument are reducible, too.
This allows to adapt to custom data sources without additional effort.
For example:

    "XStreams adaptor"
    xstream := filename reading.
    reducible := [[xstream get] on: Incomplete do: [Reduced signal]].

    "natural numbers"
    n := 0.
    reducible := [n := n+1].


## Transducers

A transducer is an object that transforms a reducing function into another.
Transducers encapsulate common steps in processing data sequences, such as
map, filter, concatenate, and flatten.
A transducer transforms a reducing function into another via #transform:
in order to add those steps.
They can be composed using #* which yields a new transducer that does both
transformations.
Most transducers require an argument, typically blocks, symbols or numbers:

    square := Map function: #squared.
    take := Take number: 1000.

To facilitate compact notation, the argument types implement corresponding
methods:

    squareAndTake := #squared map * 1000 take.

Transducers requiring no argument are singletons and can be accessed by
their class name.

    flattenAndDedupe := Flatten * Dedupe.



# Advanced Concepts

## Data flows

Processing a sequence of data can often be regarded as a data flow.
The operator #<~ allows define a flow from a data source through
processing steps to a drain.
For example:

    squares := Set <~ 1000 take <~ #squared map <~ (1 to: 1000).
    fileOut writeStream <~ #isSeparator filter <~ fileIn readStream.

In both examples #<~ is only used to set up the data flow using reducing
functions and transducers.
In contrast to streams, transducers are completely independent from input
and output sources.
Hence, we have a clear separation of reading data, writing data and
processing elements.
- Sources know how to iterate over data with a reducing function, e.g.,
via #reduce:init:.
- Drains know how to collect data using a reducing function.
- Transducers know how to process single elements.


## Reductions

A reduction binds an initial value or a block yielding an initial value to
a reducing function.
The idea is to define a ready-to-use process that can be applied in
different contexts.
Reducibles handle reductions via #reduce: and #transduce:reduce:
For example:

    sum := #+ init: 0.
    sum1 := #(1 1 1) reduce: sum.
    sum2 := (1 to: 1000) transduce: #odd filter reduce: sum.

    asSet := [:set :e | set add: e; yourself] initializer: [Set new].
    set1 := #(1 1 1) reduce: asSet.
    set2 := #(1 to: 1000) transduce: #odd filter reduce: asSet.

By combining a transducer with a reduction, a process can be further
modified.

    sumOdds := sum <~ #odd filter
    setOdds := asSet <~ #odd filter


## Eductions

An eduction combines a reducible data sources with a transducer.
The idea is to define a transformed (virtual) data source that needs not
to be stored in memory.

    odds1 := #odd filter <~ #(1 2 3) readStream.
    odds2 := #odd filter <~ (1 to 1000).

Depending on the underlying source, eductions can be processed once
(streams, e.g., odds1) or multiple times (collections, e.g., odds2).
Since no intermediate data is stored, transducers actions are lazy, i.e.,
they are invoked each time the eduction is processed.



# Origins

Transducers is based on the same-named Clojure library and its ideas.
Please see:
http://clojure.org/transducers
