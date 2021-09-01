# Andrew Tsai

# See main() below

# #############################################################################

# Sample function 1
def name_of_function1():
	'''
	Docstring
	'''
	print("Hello")

# Sample function 2
def name_of_function2(name):
	'''
	Docstring
	'''
	print("Hello " + name)

# Sample function 3
def name_of_function3(num1, num2):
	'''
	Docstring
	'''
	return num1 + num2

# #############################################################################

# Basics of Python functions

'''
- Python is dynamically typed
'''

# Examples
def say_hello():
	print("Hello")
	print("Hi")
'''
returns hello
		hi
'''

def say_hello(name):
	print(f"Hello {name}")
'''
returns Hello [user input]
'''

# Assigning default value if the user did not include parameters
def say_hello(name = 'Default'):
	print(f"Hello {name}")
'''
1.) If no parameters passed: Hello Default
2.) If parameters passed: Hello [user input]
'''

def add_num(num1, num2):
	return num1 + num2
'''
returns the sume of num1 + num2
'''

# prints result
def print_result():
	print(a + b)

# saves result
def return_result():
	return a + b

# prints and saves result
def myfunc(a,b):
	print(a + b)
	return a + b

# returns if a number is even or not
def even_check(number):
	return number % 2 == 0

# returns true if ANY number is even inside a list
def check_even_list(numList):
	for number in numList:
		if number % 2 == 0:
			return True
		else:
			pass
	return False

def employee_check(work_hours):
	'''
	work_hours will be a tuple
	'''
	current_max = 0
	employee_of_month = ''

	for employee, hours in work_hours:
		if hours > current_max:
			current_max = hours
			employee_of_month= employee
		else:
			pass

	return (employee_of_month, current_max)

# #############################################################################

# *args and **kwargs

'''
- Special symbols used for passing arguments
- *args: non-keyword arguments
	- args can be anything but args is always generally used
	- returns tuples
- **kwargs: keyword arguments. Builds a dictionary of key-value pairs.
	- returns dictionaries
	- kwargs is also arbitrary but kwargs is generally used
- Useful for outside libraries
- Accepts an arbitrary amount of arguments
- Can use in combination
'''

# example without args
def myfunc1(a, b, c = 0, d = 0, e = 0):
	# returns 5% of the sum of a and b
	return sum((a, b, c, d, e)) * 0.05

# Example with args
# By default, python will take all of the parameters and set them to be 
# inside a tuple
def myfunc2(*args):
	return sum(args) * 0.05

# Example with args and for loops
def myfunc3(*args):
	for item in args:
		print(item)

# Example with **kwargs
def myfunc4(**kwargs):
	if 'fruit' in kwargs:
		print('My fruit choice is {}'.format(kwargs['fruit']))
	else:
		print("I did not find any fruit here")

# Example with *args and **kwargs
def myfunc5(*args, **kwargs):
	print('I would like {} {}'.format(args[0], kwargs['food']))

# #############################################################################

# Object oriented programming in Python

'''
- Object oriented programming allows programmers to create their own objects
  that have methods and attributes.
- Recall that after defining a string, list, dictionary, or other objects,
  you were able to call methods off of them with the .method_name() syntax
- These methods act as functions that use information about the object, as well
  as the object itself to return results, or change the current object
- For example this includes appending to a lsit, or counting the occurences of an
  element in a tuple
- OOP allows users to create their own objects
- In general, OOP allows us to create code that is repeatable and organized
'''

# Syntax/Example for creating a class
# self is like the "this" keyword in java
# Note: self connects methods to a class
class NameOfClass():
	def __init__(self, param1, param2):
		self.param1 = param1
		self.param2 = param2

	def some_method(self):
		# perform some action
		print(self.param1)

# #############################################################################

# Attributes and Classes in Python

# Polymorphism
'''
- Polymorphism is the way that different object classes can share the same 
  method name and then those methods can be called in the same place even 
  though a variety of objects might be pased in
'''

class Cat():
	def __init__(self,name):
		self.name = name

	def speak(self):
		return self.name + ' says meow!'

# Example class
class Animal():

	def __init__(self):
		print("Animal Created")

	def who_am_i(self):
		print("I am an animal")

	def eat(self):
		print("I am eating")

	# Abstract method
	def speak(self):
		raise NotImplementedError("Subclass must implement this abstract method")

# Example class that inherits from Animal
class Dog(Animal):

	# Class object attribute
	# Same for any instance of a class
	species = 'mammal'

	# Special initialization method
	def __init__(self, breed, name, spots):
		# Inheritance from the Animal class
		Animal.__init__(self)
		print("Dog Created")

		# Attributes of an object
		# We take in the argument
		# Assignment it using self.attribute_name
		
		# Expect string
		self.breed = breed
		# Expect string
		self.name = name
		# Expect boolean
		self.spots = spots

	# Operations/Actions ---> Methods
	# Can take outside argument
	def bark(self, number):
		print(f'OWA OWA! My name is {self.name} and the number is {number}')

	def who_am_i(self):
		print("I am a dog")

	def speak(self):
		return self.name + ' says OWA OWA!'

# Polymorphism in a function call
def pet_speak(pet):
	print(pet.speak())

# Example class
class Circle():
	# Class object attribute
	pi = 3.14

	def __init__(self, radius = 1):
		self.radius = radius
		self.area = radius * radius * self.pi

	# method
	def get_circumference(self):
		return self.radius * self.pi *2

# #############################################################################

# Magic methods/dunder methods

class Book():
	def __init__(self, title, author, pages):
		self.title = title
		self.author = author
		self.pages = pages

	# String representation of a book
	def __str__(self):
		return f"{self.title} by {self.author}"

	def __len__(self):
		return self.pages

	def __del__(self):
		print("A book object has been deleted")

# #############################################################################

# python3 [filename]
def main():

	# Class calls:

	# Using built in python methods in use created objects
	b = Book('Python rocks', 'Jose', 200)
	print(b)
	print(len(b))
	# Deletes the Book object from our memory
	# Also a way to delete variables
	del b

	b = Book('Python is cool', 'Andrew', 200)
	print(b)
	del b

	# Creates a dog
	my_dog = Dog(breed = 'lab', name = 'Pudgy', spots = False)
	print(my_dog.breed)
	print(my_dog.name)
	print(my_dog.spots)
	# Inherited class from animal
	my_dog.who_am_i()
	my_dog.eat()
	# Calling a dog method
	my_dog.bark(12)

	# Creates a circle
	my_circle = Circle()
	# Calls a circle method
	print(my_circle.get_circumference())
	# Calls class attribute
	my_circle.pi

	# Polymorphism example
	niko = Dog(breed = 'crusty white dog', name = 'niko', spots = True)
	felix = Cat(name = 'felix')

	for pet in [niko, felix]:
		print(type(pet))
		print(pet.speak())

	# Polymorphism function call
	pet_speak(niko)
	pet_speak(felix)

	# #########################################################################

	# *args **kwargs function calls

	# myfunc() with **kwargs example
	myfunc4(fruit = 'apple', veggie = 'lettuce')

	# myfunc() with args/kwargs combination
	myfunc5(10, 20, 30, fruit = 'orange', food = 'eggs', animal = 'dog')

	# #########################################################################
	# Functions with tuple unpacking
	'''
	- utilizes tuple unpacking with functions
	'''

	workHours = [('Abby', 100), ('Billy', 4000), ('Cassie', 800)]

	# tuple unpacking function. Prints Billy and 4000
	name,hours = employee_check(workHours)
	print(name)
	print(hours)

	# non tuple unpacking. prints (Billy, 4000)
	result = employee_check(workHours)
	print(result)

    # #########################################################################

	# Print statement
	print("Hello World")

	'''
	Quick notes:
	- NONE acts like null
	'''

    # #########################################################################
	"""
    # STRINGS

    - Strings are immutable
 	- [start:stop:step]
 	- start: Is a numerical index for the slice start
 	- stop: Is the index you will go up to(but not include)
 	- step: Is the size of the "jump" you take. (Way of iterating)
 	- strings can also have negative indeces for characters in the end 
	"""

	hello = "hello"
	sentence = "this-is-a-string"
	letters = "abcdefghijk"
	theStringX = 'x'
	morning = "good"
	paragraph = "this is a very very long paragraph that I will split"

	# reverses a string
	hello = hello[::-1]
	print(hello)

	# Starts at index 1, stops at but not including 5 and iterates by 2 spaces
	sentence = sentence[1:10:2]
	print(sentence)

	# You can multiply strings for multiple instances
	print(theStringX * 10)

	# You can concatenate strings with the (+)
	print(morning + " morning")

	# Addition of strings
	print("2" + "3")

	# Square root
	print(16**0.5)

	# string methods (upper and lower)
	print(letters.upper())
	print(letters.lower())

	# split method. Puts things into a list
	print(paragraph.split())
	# Can also split by delimiter
	print(paragraph.split("very"))

	# #########################################################################
	"""
	String Formatting

	2 method:
	1.) .format() method
	2.) f-strings (formatted string literals)
	- known as interpolation
	"""

	print("This is another string {}".format('INSERTED'))
	print('The {} {} {}'.format('fox', 'brown', 'quick'))
	# can format by position. Indexed at 0. Can repeat 
	print('The {2} {1} {0}'.format('fox', 'brown', 'quick'))
	# can give the formatted strings a variable name
	print('The {q} {b} {f}'.format(f = 'fox', b = 'brown', q = 'quick'))

	# #########################################################################

	# Float formatting
	result = 100/777
	# no precision
	print("The result was {r}".format(r = result))
	# with precision. f must be included
	print("The result was {r:1.3f}".format(r = result))

	# f-string
	name = "Jose"
	# f needs to be included in front of the string
	print(f"Hello, his name is {name}")
	
	# works with multiple variabes
	name = "Sam"
	age = 3
	print(f'{name} is {age} years old.')

	# #########################################################################

	# Lists
	"""
	- Lists are ordered sequences that can hold a variety of object types.
	- They use [] brackets and commas to separate objects in the list
		Example: [1,2,3,4,5]
	- Lists support indexing and slicing. Lists can be nested and also have a 
	  varietey of useful methods that can be called off of them.
	- Indexing and slicing works on lists
	- Can be mutated!
	- Can have nested lists
	- Lists are objects retrieved by location.
	  Ordered sequence can be indexed or sliced.
	"""

	# Creates a list
	myList = [1,2,3]
	myList = ['STRING', 100, 23.2]

	# prints the length of the list
	print(len(myList))

	myList = ['one', 'two', 'three']
	# gets index
	print(myList[1])
	# index slicing (works like strings)
	print(myList[1:])

	anotherList = ['four', 'five']
	# List concatenation
	print(myList + anotherList)

	newList = myList + anotherList

	# Exampel of mutation
	newList[0] = 'ONE ALL CAPS'
	print(newList)

	# adding element at the end of the list (append)
	newList.append("six")
	print(newList)

	# removing element at the end of the list. Also returns the popped value
	newList.pop()
	print(newList)

	# saving popped item
	poppedItem = newList.pop()
	print(poppedItem)

	# can pop items at specific parts of the list
	newList.pop(0)
	print(newList)

	# sorting
	newList = ['a', 'e', 'x', 'b', 'c']
	numList = [4,1,8,3];
	# .sort()
	newList.sort()
	numList.sort()

	# Sorts a list in place
	unsortedList = [9,8,7,6,5,5,4,3,3,2,1]
	# sorts in place and returns the list
	sorted(unsortedList)

	print(newList)
	print(numList)

	# List reversal
	numList.reverse()
	print(numList)

	# #########################################################################

	# Dictionaries in Python (similar to hashmap)
	'''
	- Dictionaries use curly braces and colons 
	  to signify the keys and their associated values.
		- {'key1' : 'value1', 'key2' : 'value2'}
	- Dictionaries are objects retrieved by key name.
	- Unordered and cannot be sorted
	- If you want the capabilities of a dictionary but you would like ordering as 
	  well, check out the orderddict object
	'''

	# Dictionary creation
	myDict = {'key1' : 'value1', 'key2' : 'value2'}
	print(myDict)

	# Gets item by key
	priceLookup = {'apple' : 2.99, 'oranges' : 1.99, 'milk' : 5.80}
	print(priceLookup['apple'])

	# Dictionaries can store lists and other dictionaries
	d = {'k1':123, 'k2':[0,1,2], 'k3':{'insideKey':100}}
	print(d)
	print(d['k2'])
	# gets the value of the inside key
	print(d['k3']['insideKey'])

	# Setting list to a list inside a dictionary
	d = {'key1':['a','b','c']}
	myList = d['key1']
	print(myList)

	# showing python flexibility
	print(d['key1'][2].upper())

	# adding a new key value pairs to a dictionary
	d = {'k1':100, 'k2':200}
	# adding k3
	d['k3'] = 300
	print(d)

	# changing value in dictionary
	d['k1'] = 'NEW VALUE'

	'''
	Some dictionary methods that may be helpful
	- .keys()
	- .values()
	- .items()
	'''
	d = {'k1': 100, 'k2': 200, 'k3': 300}
	print(d.keys())
	print(d.values())
	print(d.items())

	# #########################################################################

	# Tuples
	'''
	- Tuples are very similare to lists. Howerver they have one key difference.
	  Immutability 
	- Once an elementy is inside a tuple, it cannot be reassigned
	- Tuples use parenthesis:
		- (1,2,3)
	- Can have mixed object types
	- Mainly used for passing objects around programs for data integrity
	'''

	# Tuple creation
	t = (1,2,3)
	# Shows that t is a tuple
	print(type(t))
	# shows length of tuple
	print(len(t))
	# gets index of an item in a tuple
	print(t[0])
	print(t[-1])

	# Gets the number of a specific item in a tuple (.count())
	t = ('a', 'a', 'b')
	print(t.count('a'))

	# gets index item of a tuple
	print(t.index('b'))

	# Demonstrating tuple immutability
	myList[0] = "NEW"
	# This does not work
	# t[0] = "NEW"

	# #########################################################################

	# Sets
	'''
	- Sets are UNORDERED collections of UNIQUE elements
	- Meaning there can only be one representative of the same object
	- Can cast a list to a set
	'''

	# Set creation
	mySet = set()

	# adding items to a set
	mySet.add(1)
	mySet.add(2)
	# There will only be one instance of 2 inside the set
	mySet.add(2)

	# Casting list with multiple repeats to a set
	myList = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3]
	# Converts a list to a set
	print(set(myList))

	# #########################################################################

	# Booleans

	'''
	- Booleans are operators that allow you to convey True or False statements
	- Helps with control flow and logic
	- use:
		True and False
	- use bool to create a boolean
	- None can be used as a placeholder
	'''
	False
	True

	# type demonstration
	print(type(True))

	bool = True

	# Comparison operator. There are more!
	print(1 > 2)
	print(1 == 1)

	# None placeholder
	b = None

	# #########################################################################

	# File I/O

	'''
	- Can support audio files, text files, other files, etc
	- File must be same name and in the same directory
	'''

	# opening a file
	myfile = open('test.txt')

	# Methods:
	# -----------
	# .read() returns a giant string of everything inside the text file
	# cannot read again as cursor is at the end of the file
	myfile.read()
	# .seek() resets the cursor to the beginning of the file
	# no we can reread the file
	myfile.seek(0)
	# stores as string
	contents = myfile.read()
	myfile.seek(0)
	print(contents)
	# .readlines() reads in input for a file line by line
	line = myfile.readlines();
	print(line)

	# File Locations

	'''
	- If you want to open files at another location on your computer, simply
	  pass in the entire file path.
	- For windows you need to use double \\ so python doesn't treat the second \
	  as an escape character
	  	- Example: myfile = open("C:\\Users\\UserName\\Folder\\test.txt")
	- For MacOS and Linux you use slashes in the opposite direction:
		- Example: myfile = open("/Users/YourUserName/Folder/myfile.txt")
	- Can use pwd to print current working directory
	'''

	# closes file. Good practice
	myfile.close()

	# Other way to open files. Automatically closes the file when done
	with open('test.txt') as myNewFile:
		# Any code in this indentation will be for this file opening
		contents = myNewFile.read()

	# Can still grab contents from new file
	print(contents)

	# Shortcut: shift + tab next to function to get documentation
	# r stands for read. Can use w to write to a file. a to append to file
	with open('test.txt', mode = 'r') as myfile:
		contents = myfile.read()

	'''
	Reading, Writing, Appending Modes
	- mode = 'r' is read only
	- mode = 'w' is write only (will overwrite files or create new!)
	- mode = 'a' is append only (will add on to files)
	- mode = 'r+' is reading and writing 
	- mode = 'w+' is writing and reading (Overwrites existing files or creates 
	              a new file!)
	'''

	# Reading file
	with open('test.txt', mode = 'r') as f:
		print(f.read())

	# Appends to a file with .write()
	with open('myNewFile.txt', mode = 'a') as f:
		f.write('\nFour on Fourth')

	# Reads a file
	with open('myNewFile.txt', mode = 'r') as f:
		print(f.read())

	# Writes to a file. Overwrites or creates
	with open('randomStuff.txt', mode = 'w') as f:
		f.write('I created this file!')

	# Reads
	with open('randomStuff.txt', mode = 'r') as f:
		print(f.read())

	# #########################################################################

	# Comparison Operators

	'''
	- Same as any other programming language
	- You can straight up compare a string to another string with ==
	'''

	# true
	print(2 == 2)
	# false
	print(2 == 1)
	# false
	print("hello" == "bye")
	# true
	print("hello" == "hello")
	# false
	print('2' == 2)
	# true
	print(2.0 == 2)
	# false
	print(3 != 3)
	# true
	print(4 != 5)
	# true
	print(2 > 1)
	# false
	print(1 > 2)

	# #########################################################################

	#  Chaining comparison operators in Python with logical operators

	'''
	- We can use logical operators to combine comparisons:
		- and
		- or
		- not()
	'''

	# false
	2 < 3
	# false
	1 < 2 > 3
	# utilizing and 
	1 < 2 and 2 < 3
	# prints true. (some libraries require parenthesis)
	print('h' == 'h' and 2 == 2)
	# utilizing or
	1 == 1 or 2 == 2
	# utilizing not()
	not 1 == 1
	# another way
	not (1 == 1)
	# 2nd method is easier to read
	not 400 > 5000
	not (400 > 5000)

	# #########################################################################

	# if elif and else Statements in python (control flow)

	'''
	- To control the flow of logic we use some keywords:
		- if
		- elif
		- else
	- Parenthesis for these are optional
	- But must end with :
	'''

	some_condition = False
	some_other_condition = False

	# Syntax of an if statement
	if (some_condition):
		print("Execute some code for if")

	# Syntax of an if/else statement
	if some_condition:
		print("Execute some code for if")
	else:
		print("Execute some code for else")

	# Syntax of an if/else statement
	if some_condition:
		print("Execute some code")
	elif some_other_condition:
		print("Execute some code for elif")
	else:
		print("Execute some code for else")

	# Example:

	loc = 'Auto Shop'

	if loc == 'Auto Shop':
		print("Cars are cool!")
	elif loc == 'Bank':
		print("Money is cool!")
	elif loc == 'Store':
		print("Welcome to the store!")
	else:
		print("I do not know much.") 

	# #########################################################################

	# For loops in python

	'''
	- Many objects in Python are "iterable", meaning we can iterate over every
	  element in the object
	- Such as every element is a list or every character in a string
	- We can use for loops to execute a block of code fro every iteration
	- Strings work in for loops too
	- common syntax for indexing variable is the underscoe (_) if we do nothing
	  with the indexing variable
	'''

	myIterable = [1,2,3]

	# syntax of a for loop
	for itemName in myIterable:
		print(itemName)

	# Example
	myList = [1,2,3,4,5,6,7,8,9,10]

	# num can be exchanged for any variable you want
	for num in myList:
		print(num)

	# for loop with control flow
	for num in myList:
		# check for even
		if num % 2 == 0:
			print(num)
		else:
			print(f'Odd Number: {num}')

	listSum = 0;

	# for loops that gets sum
	for num in myList:
		listSum += num
		print(listSum)

	print(listSum)

	# for loop with strings
	myString = 'Hello World'
	# method 1
	for letter in myString:
		print(letter)
	# method 2
	for letter in myString:
		print(letter)

	# for loop with tuples
	tup = (1,2,3)

	for item in tup:
		print(item)

	# Example of tuple unpacking
	# list with tuple pairs
	myList = [(1,2), (3,4), (5,6), (7,8)]
	print(f"Length of myList: {len(myList)}")
	# Extremely popular in python
	for item in myList:
		print(item)

	# tuple unpacking
	for (a,b) in myList:
		print(a)
		print(b)

	myList = [(1,2,3), (4,5,6), (7,8,9)]

	# regular for loop
	for item in myList:
		print(item)

	# tuple unpacking
	for a,b,c in myList:
		print(b)

	# Iterating through a dictionary
	d = {'k1':1, 'k2':2, 'k3':3}
	# Iterates through dictionary by key
	for item in d:
		print(item)
	# Iterates through dictionary by value/items. Prints tuple pairs
	for item in d.items():
		print(item)
	# Utilizing tuple unpacking for dictionaries
	for key,value in d.items():
		print(value)
	# Gets only values
	for value in d.values():
		print(value)

	# REMEMBER: Dictionaries are UNORDERED

	# #########################################################################

	# While loops in Python

	'''
	- While loops continue to execute a block of code 
	  while some condition remains true
	- You can attatch else statements to while loops
	'''

	# Syntax of while loop
	someBooleanCondition = False
	while someBooleanCondition:
		print("Do something")

	# Example
	x = 0
	while x < 5:
		print(f"the current value of x is {x}")
		x += 1

	# While loop with else statement
	x = 0
	while x < 5:
		print(f"the current value of x is {x}")
		x += 1
	else:
		print("x is not less than 5")

	# #########################################################################

	# 3 Useful keywords with loops

	'''
	- break: Breaks out of the current closest encling loop.
	- continue: Goes to the top of the closest enclosing loop.
	- pass: Does nothing at all (helpful for debugging)
	'''

	# pass example
	x = [1,2,3]

	for item in x:
		# comment
		pass
	print("end of my script")

	# continue example
	myString = "Saaaaaaammy"

	for letter in myString:
		if letter == 'a':
			continue
		print(letter)

	# break example
	myString = "Saaaaaaammy"

	for letter in myString:
		if letter == 'a':
			break
		print(letter)

	# break with while loop
	x = 0

	while x < 5:
		if x == 2:
			break
		print(x)
		x += 1

	# #########################################################################

	# Useful Operators

	'''
	- range(): used in a for loop to get things in range of something
		- Syntax: range(start, stop, step size)
	- enumerate(): returns tuples. Does index counting for us automatically
		- returns (index, content)
	- zip(): kind of like an opposite to enumerate. Zips together 2 lists.
	  Also returns tuples. Zips ONLY as far as the shortest list
	- in: returns a boolean if something is in something. Works on iterable object
	  types and dictionaries
	- min()
	- max()
	- random() : utilizes a library
	- shuffle() : from random library and shuffles lists and things. Runs in place.
		- How to call: from random import shuffle
	- randint:
		- How to call: from random import randint
	- input(): gets user input. Always returns string
	'''
	myList = [1,2,3]

	# range example
	for num in range(10):
		print(num)

	# range example. Gets 3 through 10
	for num in range(3,10,2):
		print(num)

	# casting a range to a list
	list(range(0,11,2))

	# Normal without enumeration
	indexCount = 0

	for letter in 'abcde':
		print("At index {} the letter is {}".format(indexCount, letter))
		indexCount += 1

	# without enumeration
	indexCount = 0
	word = "abcde"

	for letter in word:
		print(word[indexCount])
		indexCount += 1

	# enumerate example
	for item in enumerate(word):
		print(item)

	# enumerate example with tuple unpacking
	for index, item in enumerate(word):
		print(index)
		print(letter)
		print("\n")

	# list example
	myList1 = [1,2,3]
	myList2 = ['a', 'b', 'c']
	myList3 = [100,200,300]

	zip(myList1, myList2)
 
	# iterating through a zip
	for item in zip(myList1, myList2):
		print(item)

	# can zip more than 2 lists
	for item in zip(myList1, myList2, myList3):
		print(item)

	# can cast a zip to a list
	list(zip(myList1, myList2))

	# Can also tuple unpack zips
	for a,b,c in zip(myList1, myList2, myList3):
		print(item)

	# in example
	'x' in [1,2,3]
	'x' in ['x','y','z']

	# in dictionary example for key
	'mykey' in {'mykey':345}

	d = {'mykey':345}
	# in dictionary example for values
	345 in d.values()

	myList = [10,20,30,40,50,60,70,80,90,100]

	# min example
	min(myList)

	# max example
	max(myList) 

	# random importing shuffle. Shuffle does not return anything
	from random import shuffle

	myList = [1,2,3,4,5,6,7,8,9]

	# Shuffle function runs in place
	print(shuffle(myList))

	# random example (randint)
	from random import randint

	# the parameters are the ranges. returns int
	randint(0, 100)
	print(randint(0, 100))

	# input() example
	'''
	result = input("Enter a number: ")
	'''

	# Casting:

	'''
	- float(result): casts result to a float
	- int(result): casts result to an integer
	'''

	# casting examples
	float(result)
	int(result)


	# #########################################################################

	# List Comprehension in Python

	'''
	- May get hard to read so keep it simple
	'''

	myString = 'hello'
	myList = []

	# appending characters to a list
	for letter in myString:
		myList.append(letter)
	print(myList)

	# More efficient method
	# 'Flattened out for loop'
	myList = []

	myList = [letter for letter in myString]
	print(myList)

	# Examples
	myList = []
	myList = [x for x in 'word two']
	print(myList)

	# Example. Prints squared values of integers in the range 0-11
	mylist = []
	myList = [num**2 for num in range(0,11)]
	print(myList)

	# Example with if statements
	# prints only squared even numbers
	myList = [x**2 for x in range(0,11) if x % 2 == 0]
	print(myList)

	# Example with complex aritmnetic
	# Converts celcius to fahrenheit in a list
	celcius = [0, 10, 20, 34.5]
	fahrenheit = [((9 / 5) * temp + 32) for temp in celcius]
	print(fahrenheit)

	# Same as previous example but less efficient
	fahrenheit = []
	for temp in celcius:
		fahrenheit.append(((9 / 5) * temp + 32))
	print(fahrenheit)

	# if else statements in list comprehension
	results = [x if x % 2 == 0 else 'ODD' for x in range(0,11)]
	print(results)

	# nested loops
	myList = []

	for x in [2,4,6]:
		for y in [100,200,300]:
			myList.append(x * y)
	print(myList)

	# nested loops with list comprehension
	myList = [x * y for x in [2,4,6] for y in [1,10,1000]]
	print(myList)

	# #########################################################################

	# Methods in Python

	'''
	- Built in objects in python have a variety of methods you can use!
	- Document website: https://docs.python.org/3/
	'''

	# Method examples
	myList = [1, 2, 3]
	myList.pop()
	# Some text editors you can use: shift + tab to get method documentation
	# myList.insert()

	# #########################################################################

	# Functions in Python

	'''
	- Creating clean repeatable code is a key part of becomming an effective
	  programmer.
	- Functions allow us to create blocks of code that cane be easily executed many
	  times, without needing to constantly rewrite the entire block of code
	- See sample function at the top of the program
	- Functions must be above another function for it to be called properly
	- Typically we use the return keyword to send back the result of the function,
	  instead of just printing it out.
	- return allows us to assign the output of the finction to a new variable
	'''

	# #########################################################################

	# Creating functions in python

	'''
	- Creating a function requires a very specific syntax, including the def
	  keyword, correct indentation and proper structure
	'''

	# Examples:
	'''
	def name_of_function():
	
	- Note: Everything indented is inside the function
	- Note: function calls generally use snake casing. I.E underscores to seperate,
	  and all lowercase
	- Note: class calls use camel casing 
	'''
	
	# def name_of_function():
	'''
	Docstring explains function.(docstring)
	'''

	'''
	- The docstring is optional and is used to describe a function
	'''

	# Calling function 1:
	name_of_function1()

	# Calling function 2:
	name_of_function2("Andrew")

	# Calling function 3:
	name_of_function3(1, 2)
	print(name_of_function3(4, 5))

main()