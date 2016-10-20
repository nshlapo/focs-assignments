# FOCS Day 11 In Class

## I. Truth Tables

### 1. AND

Fill in the truth table for _a AND b_

_a_ | _b_ | _a_ AND _b_
----|-----|---
 F  |  F  |
 F  |  T  |
 T  |  F  |
 T  |  T  |

This truth table is written with the rows in *canonical order*.  Do you know why this order is canonical (i.e. standard)?  [Hint:  If you represent `false` as 0 and `true` as 1, in what order are these rows?]





### 2. Lots of NOTs

Now complete the truth table for _NOT ((NOT a) AND (NOT b))_

_a_ | _b_ | _NOT a_ | _NOT b_ | _(NOT a) AND (NOT b)_ | _NOT ((NOT a) AND (NOT b))_
----|-----|-----|-----|-----|---
 F  |  F  |     |     |     |
 F  |  T  |     |     |     |
 T  |  F  |     |     |     |
 T  |  T  |     |     |     |

Do you recognize this function by another name?





### 3. Not here or there

Build the truth table for _(NOT a) OR b_.  [_OR_ is true if *at least*` one of its arguments is true.]

_a_ | _b_ | _NOT a_ | _(NOT a) OR b_
----|-----|-----|---
 F  |  F  |     |
 F  |  T  |     |
 T  |  F  |     |
 T  |  T  |     |



### 4. Six of one, half a dozen of the other

Finally, build a truth table for _(a AND (NOT b)) OR (b AND (NOT a))_

_a_ | _b_ | _NOT a_ | _NOT b_ | _a AND (NOT b)_ | _b AND (NOT a)_ | _(a AND (NOT b)) OR (b AND (NOT a))_
----|-----|-----|-----|-----|-----|---
 F  |  F  |     |     |     |     |
 F  |  T  |     |     |     |     |
 T  |  F  |     |     |     |     |
 T  |  T  |     |     |     |     |

Can you write another expression with the same truth values as _(a AND (NOT b)) OR (b AND (NOT a))_?  (Can you write more than one?)




## II. Knights and Knaves

Knights always tell the truth; knaves always lie.  Everyone on a particular island is either a knight or a knave.

These problems are adapted from that most Normal of Sorcerers, Raymond Smullyan, *What is the Name of this Book?*, Chapter 3.

### 1. An old problem

A stranger on the island encounters three inhabitants -- A, B, and C -- and asks A, "Are you a knight or a knave?"  A's answer is not intelligible.  The stranger asks B, "What did A say?"  B answers, "A said that he is a knave."  C interrupts, saying "Don't believe B; he is lying."

What are B and C?

It is paradoxical for a knight and a knave to say that they are a knave. Thus A could not have said that, and B must be lying.
If B is lying, then C is telling the truth.

A is a knight, B is a knave, and C is a Knight.

### 2. Smullyan's improvement

In the previous problem, Smullyan notes that C is irrelevant.  His proposed revision:
A's answer is still intelligible.  B says "A says there is one knight among us."  C interrupts, saying "Don't believe B; he is lying."

Now what are B and C?

If B is telling the truth, then he is a knight. If A is telling the truth, then there are now two knights, in contradiction to his "truthful" statement.

### 3. At least one...

Suppose there are two inhabitants, A and B.  A says "At least one of us is a knave."  What are A and B?

If A is lying, then that corroborates his statement, making it truthful. Thus A must be telling the truth and is a knight, and B must be the knave.

### 4. Or else...

Suppose A says instead, "Either I am a knave or B is a knight."  Now what are A and B?

If A is lying, then


### 5. Knight after knight

Three inhabitants are present.  A says, "All of us are knights."  B says, "Exactly one of us is a knight."  What are A, B, and C?

A and B are contradictory statements, thus one of them must be false, so A's statement must be false, because there is at least one knave. If B's statement is true, then he is the only knight, and A and C are knaves.

### 6. Knight's end

Suppose instead, A says, "All of us are knaves" and B says, "Exactly one of us is a knight."  Can you tell what B is?  What C is?



### 7. Not me!

If A says, "I am a knave, but B isn't", what are A and B?

A cannot be telling the truth, because then he would be a knave and that is paradoxical. However, A can be lying because that negates the entire statement, meaning that B is a knave, as well as A.

### 8. Same as another

A says, "B is a knave."  B says, "A and C are of the same type."  What is C?

C is a knave, because if A is a knight, then B has lied, and C must be a knave. But if A is a knave, then B is a knight, and A and C must be the same, i.e. knaves.

### 9. Mind reading

A says, "B and C are of the same type."  If someone asks C, "Are A and B of the same type?" what does C answer?

Yes. If A, B, and C are knights, then C answers yes. If A is a knight and B and C are knaves, then C will lie and say yes. If A and B are knaves, then C must truthfully answer yes. If A and C are knaves, and B is a knight, then C must lie and say yes.

### 10. Smullyan's adventure

Once when Smullyan was on the island, he encountered two inhabitants.  He asked one, "Is either of you a knight?"  When the inhabitant responded, Smullyan knew the answer to his question.  What is each of the two inhabitants?  Smullyan promises there's plenty of information here to solve the problem.

A knight and a knave, regardless of the answer. It simply changes whether the one who answered is the knave or the knight.


## III. Proofs

### 1. Use truth tables to prove De Morgan's Laws













### 2. Use rules of inference to prove the following:

Assume:

	_(NOT p) -> (q AND r)_
	_p -> s_
	_NOT s_

Prove:  _q_

1. NOT s        assumed
2. NOT p        MT - 1, assumed
3. q AND r      MP - 2, assumed
4. q            Generalization - 3





### 3. Use rules of inference to prove the following:

Assume:

	_p AND q_
	_p -> NOT (q AND r)_
	_s -> r_

Prove:  _NOT s_

1. p AND q      assumed
2. p            Specialization - 2
3. NOT (q AND r)    MP - 2, assumed
4. NOT (r)      Specialization - 3
5. NOT s        MT - 4, assumed



### 4. Use rules of inference to prove the following:

Assume:

	_(NOT (p OR q)) -> r_
	_NOT p_
	_NOT r_

Prove:  _q_




### 5. Replicate any of the proofs in 2, 3, or 4 using truth tables.








