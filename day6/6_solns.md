#Transition Table for Deterministic Automaton

                  | 0             | 1
 ---              |---            |---
 -> q<sub>0</sub> | q<sub>0</sub> | q<sub>1</sub>
    q<sub>1</sub> | q<sub>2</sub> | q<sub>1</sub>
    q<sub>2</sub> | q<sub>0</sub> | q<sub>3</sub>
    q<sub>3</sub> | q<sub>2</sub> | q<sub>4</sub>
  * q<sub>4</sub> | q<sub>4</sub> | q<sub>4</sub>

#Larger Alphabet

Any alphabet can ultimately be represented by the alphabet `{0, 1}`.

A can be represented as `00`, B as `01`, C as `10`, and D as `11`.

So while our automaton may look like it has less states and transitions when written for the language `{A, B, C, D}`, implying that it can complete a certain computation in a more efficient (or powerful) way, it is ultimately identical.

Any of the states or transitions that exist for the ABCD language can be rewritten using the 01 langague, which means that the languages are computationally identical.

#Regular Expressions

The language has any number of `0`'s, followed by a `1`, followed by any amount of `0`'s:

`0*10*`