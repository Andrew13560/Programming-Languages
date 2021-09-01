
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
	Basic setup!!!

	func x = [output expression | input1, input2, predicate1, predicate2]

-}

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
{-
	- The "=>" symbol means it takes in the following parameters
	- The "->" symbol represents the return type  
-}

-- This is a recursive function that checks if a list is in increasing order 
increasing1 :: (Ord a) => [a] -> Bool
increasing1 xs = if xs == []
  then True
  else if tail xs == []
    then True
    else if head xs <= head (tail xs)
      then increasing1 (tail xs)
      else False

-- This is the same as the previous function but uses Haskell's pattern matching
increasing2 :: (Ord a) => [a] -> Bool
increasing2 [] = True -- Empty list is increasing
increasing2 [x] = True -- One item is increasing
increasing2 (x : y : ys) = x <= y && increasing2 (y : ys)
{-
	x - 1st number
	y - 2nd number
	ys - rest of the list
	The list is increasing if the first number is less than the second number and then it recursively checks continously
-} 

-- Takes a string and returns a string with no vowels
noVowels1 :: [Char] -> [Char]
noVowels1 word = if word == ""
  then ""
  else if head word `elem` "aeiouAEIOU"
    then noVowels1 (tail word)
    else (head word) : noVowels1 (tail word)

-- Same as previous noVowels but using pattern matching and guards
noVowels2 :: [Char] -> [Char]
noVowels2 "" = ""
noVowels2 (x : xs)
  | x `elem` "aeiouAEIOU" = noVowels2 xs
  | otherwise = x : noVowels2 xs

-- This function calls out an alert at a certain time
watch1 :: Int -> [Char]
watch1 n = if n == 7
  then "7 o'clock and ... SHARKNADO!"
  else show n ++ " o'clock and all is well."
-- show is kind of like a print statement 

-- Same as watch1 but with pattern matching
watch2 :: Int -> [Char]
watch2 n = show n ++ " o'clock and " ++ message n
  where message 7 = "... SHARKNADO!"
        message _ = "all is well" -- Note: with where statements, the message needs to be spaced on same line

-- Same as watch2 but with case statements (Switch statement)
watch3 :: Int -> [Char]
watch3 n = show n ++ " o'clock and " ++ case n of 7 -> "... SHARKNADO!"
                                                  _ -> "all is well."

-- Function that calculates the acceleration due to gravity
gravity1 :: (Fractional a) => a -> a 
gravity1 r = 6.674e-11 * 5.972e24 / (r ^ 2) --Haskell can handle exponential numbers

-- Same as gravity1 but uses a "let" expression
gravity2 :: (Fractional a) => a -> a 
gravity2 r = let g = 6.674e-11
                 earthMass = 5.972e24 -- Can chain and add more variables after the let statement
             in g * earthMass / (r ^ 2)

-- Some Templates
{-
	- Definition (Should be exhaustive. Good idea to have last pattern match everything):
		pattern = result
		...

	- Guard expression (otherwise is not required but good to be exhaustive):
	  pattern
	    | expression = result
	    ...
	    | otherwise = result

	- Where Clause (Cannot be nested and can only be used inside a definition):
		result where
		pattern = result
		...

	- Let expression (Can be used anywhere and can be nested)
	  let pattern = result
	      ...
	  in result

	- Case expression
		case expression of pattern -> result
		                   ...

  - NOTE: Haskell cares about indentation!!!
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Guards (|)

{-
	- Guards are more like a switch
-}

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Recursion

{-
	- Recursion requires base case
	- A function that calls itself
	- Generally the base case is above the recursive function 
	- "where" : is bound to a surrounding syntactic construct, 
	  like the pattern matching line of a function definition.
	- The double colon "::" means "has the type of"
-}

count 100 = [] -- The base case
count n = n : count (n + 1) -- The recursive descent 

-- Fibonacci
fib :: (Eq a, Num a, Num p) => a -> p
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

-- Gets the length of a list of any type
lengthRec :: [a] -> Int
lengthRec [] = 1
lengthRec (_:xs) = 1 + lengthRec xs

-- Gets the summation of a list of numbers
sumRec :: (Num a) => [a] -> a 
sumRec [] = 0
sumRec (x:xs) = x + sumRec xs

-- Takes the product summation of the list of numbers
productRec :: (Num a) => [a] -> a 
productRec [] = 1
productRec (x:xs) = x * productRec xs

-- Finds the largest value in the list recursively
maxRec :: (Ord a) => [a] -> a 
maxRec [x] = x
maxRec (x:xs)
       | x > mx     = x -- mx is max
       | otherwise  = mx
       where mx = maxRec xs

-- Factorial function
factorial :: (Eq p, Num p) => p -> p -- Remember this is a type definition
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Example visual:
{-
	4! = 4 * fact 3
			     3 * fact 2
			     		 2 * fact 1
			     		     1 * fact 0
			     		         1
-}

-- Recursive sum of a list
recursiveSum :: Num p => [p] -> p 
recursiveSum [] = 0
recursiveSum (x:xs) = x + recursiveSum xs

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Recursion Practice Problems 

{-3. Define a function, cubeOdds, which takes a list of intergers and returns that same
list but with all the odd numbers cubed and the even numbers left untouched. Solve cubeOdds 
with list comprehension and cubeOdds` with recursion.-}
{- Tests:
		input:            output:
		[]            ->  [] 
		[1,2,3,4,5]   ->  [1,2,27,4,125]
		[2]           ->  [2]
		[7]           ->  [343]
-}

-- List comprehension
cubeOdds :: Integral a => [a] -> [a]
cubeOdds ints = [if (odd x) then (x ^ 3) else x | x <- ints]

isOddHelper1 x = if (odd x) then x ^ 3 else x

isOddHelper2 x
    | odd x = x ^ 3
    | otherwise = x 

-- Same but with helper function 
cubeOddsWithHelper :: Integral a => [a] -> [a]
cubeOddsWithHelper ints = [isOddHelper2 x | x <- ints]

-- Recursion
cubeOddsRec :: Integral a => [a] -> [a]
cubeOddsRec [] = [] -- 99% of the time dealing with lists and recursion, the base case is the empty list 
cubeOddsRec (x:xs) = (if odd x then x ^ 3 else x) : cubeOddsRec xs

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-4. Define a function, myMapper, which takes a function, funct, and a list, and returns a list
where funct has been applied to each element in the list. solve myMapper with list comprehension
and myMapper` with recursion-}
{- Tests:
    inputs:                                         output:
    (+3)          []                             -> []
    (+3)          [1,2,3]                        -> [4,5,6]
    (++ "!")      ["ha", "hi", "hohoho"]         -> ["ha!", "hi!", "hohoho!"]
    factorial     [0,1,3,8]                      -> [1,1,6,40320]
    cubeOdds	    [[1..10], [2,4,6], [1,3,17]]   -> [[1,2,27,4,125,6,343,8,729,10], [2,4,6], [1,27,4913]]
-}

myMapper :: (t -> a) -> [t] -> [a]
myMapper func list = [func x | x <- list]

-- Recursion
myMapperRec _ [] = []
myMapperRec func (x:xs) = func x : myMapperRec func xs

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-5. Define a function, myFilter, which takes a predicate, pred, and a list, and returns a list
containing every element from the original list that satisfies the predicate.
Solve myFilter with a list comprehension and myFilterRec with recursion-}

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter pred list = [x | x <- list, pred x]

myFilterRec :: (a -> Bool) -> [a] -> [a]
myFilterRec _ [] = []
myFilterRec pred (x:xs)
  | pred x = x : myFilterRec pred xs
  | otherwise = myFilterRec pred xs

-- Useful Higher order functions
-- fold
-- scan

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-6. Define a function, deleteNth, which takes a non-negative integer n, an element, elem,
and a list, and returns a list with the nth occurence of elem deleted from the original list.
Hints: Use recursion, think carefully about your base case, use conditionals-}

deleteNth :: (Num t, Eq t, Eq a) => t -> a -> [a] -> [a]
deleteNth _ _ [] = [] -- base case
deleteNth 1 elem (x:xs) -- base case 
    | elem == x = xs
    | otherwise = x : deleteNth 1 elem xs
deleteNth n elem (x:xs) -- recursive descent
    | elem == x = x : deleteNth (n - 1) elem  xs
    | otherwise = deleteNth n elem xs 

-- ----------------------------------------------------------------------------------------------------------------------------------------

{-BONUS. Define a function, compose, which takes two lists of Binary Relations and returns
a list of their Relational Compositions. A Binary Relation is a key-value pair held in a tuple.
A Relatiuonal Composition returns the key of one pair with the value of a second pair, when value
of the first corresponds to the key of the second. So (x,y) and (y,z) produce (x,z).
Hint: Can be solved with a single list comprehension. Use pattern mathching on the tuples-}

compose :: Eq a1 => [(a2, a1)] -> [(a1, b)] -> [(a2, b)]
compose list1 list2 = [(x,z) | (x,y) <- list1, (y',z) <- list2, y == y']

-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Haskell 6a: Higher order functions
-- https://www.youtube.com/watch?v=XKUsGSjnITc&list=PLS6urCrsYES24Fwzg5-Uga1QEbNm9kiU_&index=10