
-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Assignment 1

-- Take two numbers as parameters. Multiply the first number by 2 and the second by 3, then add them together. Function name: twoNumbers
twoNumbers x y = (x + x) + (y + y + y)

-- Create a function named countMe that takes no parameters and counts from 3 to 13 by twos.
countUs = [x | x <- [3, 5 .. 13]]

-- Use guards for this function named compareUs, which takes two parameters. If the first number is larger than the second number, 
-- the function should equal "Larger" otherwise "Smaller or Equal"
compareUs x y
  | x > y = "Larger"
  | otherwise = "Smaller or equal"


-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Potential Test Questions

{-
	IsPalindrome n = show n == reverse (show n)
	Check out projecteuler.net/archives - Leinecker likes this for his reviews and tests
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-
	Haskell Facts:
	- Named after Haskell Curry
	- is purely functional
	- is lazy
	- has type inference
	- ghci stands for Glascow Haskell Compiler in Interactive mode
	- '_' The underscore is a Wildcard and can be any input type
	- Haskell has the composite operator (.) which is like the dot
	  operator that chains functions
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-
	Command line commands:
	- stack ghci : opens the Haskell interpreter
	- stack new [Name of File] : Creates a new Haskell folder for your Haskell project
	- stack build : builds your Haskell project
	- stack run : runs your Haskell project
	- stack ghci [Path to your file] : Runs the specific file in the ghci compiler 
	- :quit : Exits the Haskell prelude compiler 
	- explorer . : (Windows Only) opens the file directory from command line
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- In Class Examples

doublePos1 xs = [x * 2 | x <- xs, x > 0]

doublePos2 xs = [if x > 0 then x * 2 else x | x <- xs]

spaces n = [' ' | _ <- [1..n]]

blah = sum [x | x <- [1..999], (x `mod` 3 == 0 || x `mod` 5 == 0)]

isPalindrome1 n = show n == reverse (show n)

isPalindrome2 = maximum [x * y | x <- [10..99], y <- [10..999], isPalindrome1 (x * y)]


-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Math in Haskell

math1 = 2 + 2 
-- returns 4

math2 = 2 + 3 * 5 
-- returns 17

math3 = 8 - 3 
-- returns 5

-- math4 = 2 * -4 
-- (returns an error)

math5 = 2 * (-4) 
-- Correct way and returns -8

math6 = 3 / 2 
-- returns 1.5

math7 = 3 ^ (19 * 19)
-- ^ is for exponentiation and returns a large number

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Conditions in Haskell

condition1 = True && True -- And
-- returns False

condition2 = True || False -- Or
-- returns True

condition3 = not True -- Not operator
-- returns False

condition4 = 3 == 4 -- Equality operator
-- returns False

condition5 = 3 /= 4 -- Not equals operator
-- returns True

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Built in functions in Haskell

fun1 = min 7 4 -- returns the smallest value of the two
-- returns 4

fun2 = max 7 4 -- returns the largest value of the two
-- returns 7

fun3 = (max 3 5) * 2
-- returns 10

fun4 = 3 `max` 5 -- infix notation 
-- returns 5 

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Functions in Haskell

{-
	- Functions cannot begin with a capital letter
	- Can use the keyword "let" to define functions on the fly
	- Functions can "act like" variable declarations on the fly
	- let double x = 2 * x : creates a function in the prelude on the fly
-}


-- function that takes in 2 parameters and performs math
hypotenuse a b = sqrt (a ^ 2 + b ^ 2)
-- returns the hypotenuse and takes in 2 parameters

-- function that uses conditions and returns a string
identifyCamel humps = if humps == 1
  then "dromedary"
  else "Bactrian"
-- note: a if statement NEEDS an else statement

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Lists in Haskell (Linked Lists)

{-
	- Haskell data structures are immutable
	- : this is the colon operator which constructs a new list node. Or cons operator
	- It is ok for two lists to share the same tail
	- head takes constant time O(1)
	- tail takes constant time O(1)
	- length takes linear time O(n)
	- reverse takes linear time O(n)
	- !! takes linear time O(n)
	- Haskell strings are just a list of characters
		['h', 'o', 'u', 's', 'e'] is the same as "house"
	- All of the elements of a list must be the same type
-}

-- Declaring a list (linked list) in Haskell
numbers = [4, 8, 15, 16, 23, 42]

{-
	NOTE: Run in ghci

	head numbers : gives us the first element of the list 
	returns 4 

	tail numbers : gives us the rest of the list
	returns [8, 15, 16, 23, 42]

	1 : 5 : []
	this will give you: [1, 5]

	99 : tail numbers 
	this will put 99 at the head of the numbers list
	[99, 8, 16, 23, 42]

	!! 2 : this operator gives us the value of a list at index 2
	returns 15

	last numbers : last gives you the last number of the list
	returns 42

	init number: gives you everything but the last number of the list 
	returns [4, 8, 15, 16, 23]

	null : determines if a list is empty 

	null numbers 
	returns False

	null []
	returns True

	elem 15 numbers : Tells us if a particular element is in the list
	returns True

	[1, 2, 3] ++ [4, 5, 6]: concatenation operator 
	returns [1, 2, 3, 4, 5, 6]

	"adam" < "ant" : The < operator checks for the alphabetical order of words. compares ASCII values
	returns True

	[[1, 2, 3], [4, 5, 6]] : This is a list of lists or a 2D list

	maximum numbers : returns the largest value in the list
	returns 42

	minumum numbers : returns the smallest value in the list
	returns 4

	sum numbers : sums the entire list
	returns 108

	product numbers : takes the product of the entire list
	returns 7418880

	-- summing the values from 1 to 100
	sum [1..100] - This is called a Texas range
	returns 5050

	Texas range of characters
	['a'..'e']
	returns "abcde"

	Counting by 2 from 2 to 10
	[2, 4,..10]
	returns [2, 4, 6, 8, 10]

	Counting down from 10 to 1
	[10, 9..1]
	returns [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

	You can brick your computer by running this
	[1..]
	returns a list from one to infinity or until your computer bricks itself

	takes the first 5 values from 1 through infinity
	take 5 [1..]
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- List Comprehensions in Haskell

{-
	- We can use list comprehensions on strings as well
	- List comprehension works mathematically as well
	- List comprehension is broken up into 3 parts:
		1.) The output
		2.) Where the variable values come from
		3.) The constraint/predicate/filter
	- List comprehensions can also be nested
	- Haskell is "concise"
	- List comprehension breaks down complicated expressions into smaller nested parts
-}

-- suppose we want the first 10 powers of 2
powers = [2^n | n <- [1..10]]
-- when ran, returns [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

-- same as the powers function but limited to 2 digit numbers. Just add additional constraints
powersTwoDigits = [2^n | n <- [1..10], 2^n >= 10, 2^n < 100]
{-
	Note:
	- 2^n is the output
	- n <- [1..10] is where the variable values come from
	- 2^n >= 10 is a constraint/predicate/filter
	- 2^n < 100 is also a constraint/predicate/filter
-}
-- returns [16, 32, 64]

-- removing all of the vowels in a word
removeVowels = [x | x <- "outrageous", not (x `elem` "aeiou")]
-- returns "trgs"

-- removes all vowels of a list of a words
removeVowelsFromListOfWords = [[x | x <- word, not (x `elem` "aeiou")] | word <- ["bell", "book", "candle"]]
--                             ----------------------------------------             
--                         This part removes all of the vowels from word  
--                                                                      ------------------------------------
--                                                          This part removes vowels from each words from the list 
-- returns ["bll", "bk", "cndl"]

-- creating a multiplication table
multiplicationTable = [[x * y | y <- [1..5]] | x <- [1..5]]
-- returns a multiplication table

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Tuples in Haskell

{-
	- Binary tuples are sometimes called a pair
		- Example: (1,2)
	- Tuples can be as long as you want
	- The general term is tuple
	- Tuples use parenthesis: ()
	- Note: The length of the list is not part of its type
	- The size/length of a tuple is part of its type
	- The elements of tuples can be of different types
	- Similar to a struct in C or an object in Java
-}

{-
	[1,2] == [1,2,3]
	returns false

	cannot compare tuples of different sizes
	(1,2) == (1,2,3)
	returns an error and would not work

	(1, "two") 
	This is a valid tuple

	storing the make, model, and year of a car
	("Honda", "Civic", 2003)

	Special Functions that only works with a tuple pair"
		- fst : returns the first item in a pair
		- fst ("Fred", "Ginger") 
			returns "Fred"

		- snd : returns the second element in a pair
		- snd ("Fred", "Ginger")
			returns "Ginger"

		- zip : turns two lists into a list of pairs
		- zip ["cat", "dog"] ["girl", "boy"]
			returns [("cat", "girl"), ("dog", "boy")]
-}

-- Using tuples as function parameters 
dotProduct (a, b) (c, d) = (a * c) + (b * d)

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Types and typeclasses in Haskell

{-
	- Types are sets of values
	- Typeclasses are sets of types
	- The type "Integer" includes values like 3 and 8
	- The typeclass "Num" includes the types "Integer", "Int", "Float", and "Double"
	- Value -> Type -> Typeclass
	- Functions can also have types
-}

{-
	Within Prelude
	- Operator to get the type 
	- :t True
		returns True :: Bool
	
	- :t 'a'
		returns 'a' :: [Char]

	- :t "Hello"
		returns "Hello" :: [Char]

	- :t 3
		returns 3 :: Num a => a
		- 'a' is a type variable and Haskell is saying 3 can be an Integer, Double, etc.

	- let x = 3
	- :t x
		returns x :: Integer

	- :t head
		returns head :: [a] -> a
		- This means that head takes in a 'a' and returns a 'a'

	- :t (+)
		returns (+) :: Num a => a -> a -> a
		- This means that there is some type 'a' in the subclass 'Num'.
		- (+) takes two 'a' values and returns another 'a'

	- :t zip
		returns zip :: [a] -> [b] -> [(a, b)]
		- This means that zip takes two lists 'a' and 'b' and returns a list of tuples 
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Function Syntax in Haskell
-- https://www.youtube.com/watch?v=vuT8ts_neZw&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=8

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Guards (|)

{-
	- Guards are more like a switch
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Recursion

{-
	- Recursion requires base case
	- Generally the base case is above the recursive function 
	- "where" : is bound to a surrounding syntactic construct, 
	  like the pattern matching line of a function definition.
-}


count 100 = [] -- The base case
count n = n : count (n + 1) -- The recursive descent 

-- Fibonacci

fib 0 = 0 -- base case 1
fib 1 = 1 -- base case 2
fib n = fib (n - 1) + fib (n - 2)

-- Fibonacci with lists
fibList n = [fib x | x <- [1..n]]

fiblist2 n = go n 1 1
  where 
  go n f s
    | (f + s) > n = []
    | otherwise = (f + s) : go n s (f + s)

-- Fib with evens is similar to test style questions


