# FOCS Homework for Day 9

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Nur Shlapobersky
Check one:
[x] I completed this assignment without assistance or external resources.
[x] I completed this assignment with assistance from ___
   and/or using these external resources: Sipser Textbook-
```

## 1. For each of the following languages, decide whether it is regular

For each of the following languages, decide whether it is regular.  If it is regular, give a regular expression or finite automaton that recognizes the language.  If it is not regular, demonstrate that using the pumping lemma.

a) Strings containing only the symbol a whose length is a power of 2 (*i.e.* length 2^n)

[The strings `a`, `aa`, `aaaa`, and `aaaaaaaa` are in this language; the string `aaaaa` is not.]

>Assume a pumping length p >= 1, with a string |s| >= p.

>Let s = 0<sup>2<sup>p</sup></sup>. |s| > p, because 2<sup>p</sup> is > p.

>Let xyz = *e*  0<sup>p</sup>  0<sup>2<sup>p</sup>-1</sup>, in order to satisfy all conditions of the pumping lemma.

>The string xy<sup>2</sup>z = 0<sup>2<sup>n</sup>+1</sup> is not a meber of this language. Thus this language fails the pumping lemma, and the language cannot be regular.

b) All strings with an equal number of occurrences of the substrings `01` and `10`.

[010 is in this language; `000110` is in the language; `0101010` is in the language; but `010101` is not.]

This language is regular, because it can be described with the following regular expression: `/(.).*\1/`


c) All strings (over {0,1}) consisting of a substring _w_ followed by the reverse of the substring.

[The strings `00100100` and `11110101011010101111` are in this language; the strings `00100` and `010101 `are not.]

>Assume a pumping length p >= 1, with string s = a<sup>p</sup>ba<sup>p</sup>, which is a palindrome longer than p.

>Let xyz =  a<sup>k</sup>  a<sup>m</sup>  a<sup>p-m-k</sup>ba<sup>p</sup> in order to satisfy all conditions of the pumping

> xy<sup>2</sup>z = a<sup>p+1</sup>ba<sup>p</sup>, which is not a palindrome. Thus this language fails the pumping lemma, and the language cannot be regular.

## 2. Play the pumping game

Play the **pumping game** (referenced on the [Day 8 page](https://sites.google.com/site/focs16fall/in-class-exercises/day-8) and also found at [http://weitz.de/pump/](http://weitz.de/pump/)).  Solve at least two puzzles from that page (that do NOT appear in question 1, above) and provide the word you chose, the substring the computer chose, and your successfully pumped string.

Notation notes:

- The notation |w| sub a means the number of `a`'s in the word _w_.
- _a_^_n_ means _n_ occurrences of `a` (e.g. _a_^8 is `aaaaaaaa`)

###Puzzle 1 - Language of Palindromes

Word: aaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

Substring: a

Pumped: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

###Puzzle 2 - Less a's than b's

Word: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

Substring: aaaaaaaa

Pumped: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

If you have other questions about notation (or anything else), please post them to [Piazza](https://piazza.com) so that we can clarify for everyone.

## 3. Create a PDA

For one of the non-regular languages in problem 1 or 2 above, create a PDA (preferably in JFLAP) and include it with your completed homework.

![](./pdautomata.jpg)

## 4. Reading

Optionally read Sipser pp. 101–125.

Optionally read Stuart pp. 128–134.

## 5. Install gprolog

Please download and install [gprolog](http://www.gprolog.org) before coming to class:

**Ubuntu**:

	$ sudo apt-get install gprolog

**Mac**, with [Homebrew](http://brew.sh) installed:

	$ brew install gnu-prolog

**Mac** without Homebrew, and **Windows**:

- Follow the instructions at [http://www.gprolog.org/#download](http://www.gprolog.org/#download).
