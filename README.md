# cyclic-S-rings

This code repository consists of a single file giving MAGMA code to produce all of the Schur rings (S-rings) over the cyclic group of order *n*, where *n* is a positive integer.

Structure of the code
---------------------

The code relies on the classification result of Leung and Man (1996, 1998): any S-ring over a cyclic group is of one of four types:
* the trivial S-ring
* an orbit S-ring
* a dot product S-ring
* a wedge product S-ring.

There are auxiliary functions *triv*, *auts*, *dot*, *swdg* which produce sets containing the S-rings of these respective types. In this code, an S-ring over the cyclic group of order *n* is represented as a partition of the integers *{0,...,n-1}*; for example,

    {{0},{1,2,3,4}};

would represent the trivial S-ring over the cyclic group of order 5.

In turn, there are two main functions. First, *cycls* when called as

    cycls(n);

where n is a positive integer, produces an ordered list, the *k*th index of which consists of the S-rings over the cyclic group of order *k*.

The second main function, called as

    cyc(n);

where *n* is once again a positive integer returns a set of the S-rings over the cyclic group of order *n*.

How to run
----------

Since the S-rings are produced recursively, using information about the S-rings of smaller order, the computational load is much higher for a group order with a large number of divisors. For example, when *cyc(100)* is run, about 86% of the time taken in the computation (on the order of one hour) is spent on the cyclic group of order 96.

To run this, paste the code found in cyc_rings.m at the [MAGMA calculator](http://magma.maths.usyd.edu.au/calc/) and adding a line at the end to run one of the two main functions.

Table summarizing results
-------------------------

Finally, we give a table summarizing the results of the computation for cyclic groups of order up to 191. In the table, *Ω(n)* gives the number of cyclic S-rings over the cyclic group of order *n* while *Λ(n)* gives the number of such S-rings that are also *symmetric*. For more detail, see the publication “Central Schur rings over the projective special linear groups.” Communications in Algebra 45, no. 12 (2017): 5325-5337.


| n | Ω(n) | Λ(n) |
|:--|:--:|:--:|
| 1 | 1 | 1 |
| 2 | 1 | 1 |
| 3 | 2 | 1 |
| 4 | 3 | 2 |
| 5 | 3 | 2 |
| 6 | 7 | 4 |
| 7 | 4 | 2 |
| 8 | 10 | 5 |
| 9 | 7 | 3 |
| 10 | 10 | 7 |
| 11 | 4 | 2 |
| 12 | 32 | 13 |
| 13 | 6 | 4 |
| 14 | 13 | 7 |
| 15 | 21 | 8 |
| 16 | 37 | 12 |
| 17 | 5 | 4 |
| 18 | 42 | 17 |
| 19 | 6 | 3 |
| 20 | 47 | 22 |
| 21 | 27 | 9 |
| 22 | 13 | 7 |
| 23 | 4 | 2 |
| 24 | 172 | 49 |
| 25 | 13 | 7 |
| 26 | 19 | 13 |
| 27 | 25 | 8 |
| 28 | 61 | 23 |
| 29 | 6 | 4 |
| 30 | 147 | 58 |
| 31 | 8 | 4 |
| 32 | 151 | 31 |
| 33 | 27 | 9 |
| 34 | 16 | 13 |
| 35 | 41 | 15 |
| 36 | 284 | 81 |
| 37 | 9 | 6 |
| 38 | 19 | 10 |
| 39 | 41 | 15 |
| 40 | 262 | 82 |
| 41 | 8 | 6 |
| 42 | 188 | 65 |
| 43 | 8 | 4 |
| 44 | 61 | 23 |
| 45 | 140 | 39 |
| 46 | 13 | 7 |
| 47 | 4 | 2 |
| 48 | 1033 | 194 |
| 49 | 21 | 7 |
| 50 | 79 | 42 |
| 51 | 35 | 14 |
| 52 | 91 | 41 |
| 53 | 6 | 4 |
| 54 | 232 | 68 |
| 55 | 41 | 15 |
| 56 | 334 | 90 |
| 57 | 40 | 13 |
| 58 | 19 | 13 |
| 59 | 4 | 2 |
| 60 | 1103 | 307 |
| 61 | 12 | 8 |
| 62 | 25 | 13 |
| 63 | 187 | 51 |
| 64 | 657 | 85 |
| 65 | 67 | 33 |
| 66 | 188 | 65 |
| 67 | 8 | 4 |
| 68 | 77 | 40 |
| 69 | 27 | 9 |
| 70 | 281 | 106 |
| 71 | 8 | 4 |
| 72 | 2311 | 471 |
| 73 | 12 | 9 |
| 74 | 28 | 19 |
| 75 | 185 | 54 |
| 76 | 90 | 33 |
| 77 | 53 | 17 |
| 78 | 284 | 109 |
| 79 | 8 | 4 |
| 80 | 1646 | 315 |
| 81 | 92 | 23 |
| 82 | 25 | 19 |
| 83 | 4 | 2 |
| 84 | 1397 | 361 |
| 85 | 60 | 31 |
| 86 | 25 | 13 |
| 87 | 41 | 15 |
| 88 | 334 | 90 |
| 89 | 8 | 6 |
| 90 | 1581 | 427 |
| 91 | 97 | 35 |
| 92 | 61 | 23 |
| 93 | 53 | 17 |
| 94 | 13 | 7 |
| 95 | 61 | 22 |
| 96 | 6719 | 833 |
| 97 | 12 | 10 |
| 98 | 128 | 42 |
| 99 | 177 | 47 |
| 100 | 563 | 195 |
| 101 | 9 | 6 |
| 102 | 243 | 102 |
| 103 | 8 | 4 |
| 104 | 514 | 156 |
| 105 | 670 | 164 |
| 106 | 19 | 13 |
| 107 | 4 | 2 |
| 108 | 2219 | 470 |
| 109 | 12 | 8 |
| 110 | 281 | 106 |
| 111 | 61 | 22 |
| 112 | 2030 | 366 |
| 113 | 10 | 8 |
| 114 | 277 | 94 |
| 115 | 41 | 15 |
| 116 | 91 | 41 |
| 117 | 291 | 81 |
| 118 | 13 | 7 |
| 119 | 69 | 27 |
| 120 | 10130 | 1915 |
| 121 | 21 | 7 |
| 122 | 37 | 25 |
| 123 | 55 | 21 |
| 124 | 119 | 43 |
| 125 | 58 | 25 |
| 126 | 2099 | 566 |
| 127 | 12 | 6 |
| 128 | 2989 | 246 |
| 129 | 53 | 17 |
| 130 | 457 | 230 |
| 131 | 8 | 4 |
| 132 | 1397 | 361 |
| 133 | 99 | 33 |
| 134 | 25 | 13 |
| 135 | 854 | 177 |
| 136 | 442 | 148 |
| 137 | 8 | 6 |
| 138 | 188 | 65 |
| 139 | 8 | 4 |
| 140 | 2142 | 570 |
| 141 | 27 | 9 |
| 142 | 25 | 13 |
| 143 | 81 | 29 |
| 144 | 21451 | 3103 |
| 145 | 67 | 33 |
| 146 | 37 | 28 |
| 147 | 289 | 68 |
| 148 | 135 | 60 |
| 149 | 6 | 4 |
| 150 | 2124 | 622 |
| 151 | 12 | 6 |
| 152 | 496 | 131 |
| 153 | 238 | 67 |
| 154 | 360 | 120 |
| 155 | 81 | 29 |
| 156 | 2157 | 585 |
| 157 | 12 | 8 |
| 158 | 25 | 13 |
| 159 | 41 | 15 |
| 160 | 11256 | 1322 |
| 161 | 53 | 17 |
| 162 | 1224 | 274 |
| 163 | 10 | 5 |
| 164 | 121 | 59 |
| 165 | 670 | 164 |
| 166 | 13 | 7 |
| 167 | 4 | 2 |
| 168 | 12494 | 2381 |
| 169 | 43 | 21 |
| 170 | 411 | 216 |
| 171 | 283 | 77 |
| 172 | 119 | 43 |
| 173 | 6 | 4 |
| 174 | 284 | 109 |
| 175 | 363 | 103 |
| 176 | 2030 | 366 |
| 177 | 27 | 9 |
| 178 | 25 | 19 |
| 179 | 4 | 2 |
| 180 | 17888 | 3513 |
| 181 | 18 | 12 |
| 182 | 658 | 244 |
| 183 | 81 | 29 |
| 184 | 334 | 90 |
| 185 | 100 | 49 |
| 186 | 366 | 123 |
| 187 | 69 | 27 |
| 188 | 61 | 23 |
| 189 | 1225 | 280 |
| 190 | 415 | 154 |
| 191 | 8 | 4 |
