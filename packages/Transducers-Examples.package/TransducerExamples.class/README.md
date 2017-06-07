For lack of a better place at the moment...


The short answer is that the compact notation turned out to work much better for me in my code, especially, if multiple transducers are involved. But that's my personal taste. You can choose which suits you better. In fact,

  1000 take.

just sits on top and simply calls

  Take number: 1000.

If the need arises, we could of course factor the compact notation out into a separate package. Btw, would you prefer (Take n: 1000) over (Take number: 1000)?

Damien, you're right, I experimented with additional styles. Right now, we already have in the basic Transducer package:

  (collection transduce: #squared map * 1000 take. "which is equal to"
  (collection transduce: #squared map) transduce: 1000 take.

Basically, one can split #transduce:reduce:init: into single calls of #transduce:, #reduce:, and #init:, depending on the needs.
I also have an (unfinished) extension, that allows to write:

  (collection transduce map: #squared) take: 1000.

This feels familiar, but becomes a bit hard to read if more than two steps are needed.

  collection transduce
               map: #squared;
               take: 1000.

I think, this alternative would reads nicely. But as the message chain has to modify the underlying object (an eduction), very snaky side effects may occur. E.g., consider

  eduction := collection transduce.
  squared  := eduction map: #squared.
  take     := squared take: 1000.

Now, all three variables hold onto the same object, which first squares all elements and than takes the first 1000.