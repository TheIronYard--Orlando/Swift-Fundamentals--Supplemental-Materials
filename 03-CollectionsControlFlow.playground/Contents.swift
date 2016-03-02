//:# Collections and Control Flow
//:## Collections
//:Now that you can create and work with different pieces of data, it can be helpful to group these bits of data together. This allows you to move them around as a group, and even perform sorting/filtering on them. To accomplish these tasks we use *collections*. The two main collection types in Swift are *arrays* and *dictionaries*.
//:### Arrays
//:An array is an ordered list of objects. These could be a list of strings, integers, boolean values, etc. To create an array in Swift, you wrap the list with `[]` brackets. See an example below:

var shipCaptains = ["Malcolm Reynolds", "Jean-Luc Picard", "James T. Kirk", "Han Solo"]

//:An array can hold any kind of object, as long as each element are of the same type. Mixing data types in an array is not allowed in Swift.
//:To access a member of an array, simply reference it by its index value. Remember, arrays in most languages, including Swift, are indexed starting at 0. So the third element's index is actually 2.

let oldSchoolCap = shipCaptains[2]

//:`oldSchoolCap` would have a value of "James T. Kirk" after line 5. The same technique can be used to add a value to an array at a specific index, provided the array itself has been declared as a variable and not a constant (`var` vs. `let`).

shipCaptains[4] = "Kathryn Janeway"

//:The `shipCaptains` array now has 5 elements, with Janeway being added at the end.
//:#### Array Comparison
//:Now that we have an array, let's build another one so we can perform some comparison.

let engineers = ["Montgomery Scott", "Geordi LaForge", "B'Elanna Torres"]

//:To check if these two arrays are equivalent, we can use the *equality operator* `==`. A single `=` symbol is called the *assignment operator*, and it is used to assign a value on the right to a variable or constant on the left. Two `=` symbols check values on either side for equality.

print(shipCaptains == engineers)

//:The above expression will print a boolean answer, true or false. True, if the values are equal, and false if they are not. For arrays, equality means "equivalent objects, in the same order". Looking at the two arrays above, how would line 14 be evaluated? Since the objects in the two arrays are neither the equivalent nor in the same order, it would evaluate to `false`. Different objects respond differently to the `==` equality operator, so keep that in mind when using it.
//:### Dictionaries
//:Dictionaries are the other major collection type in Swift. They are known by other names in other languages: hashes in Ruby and Perl, maps in Java and Go, and hash tables in Lisp. The concept is the same in every language though. Dictionaries can be described as a collection of *key-value* pairs. Rather than referencing a value with an index like in an array, a dictionary *value* is fetched using a *key*. See the example below:

var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
let malcolmsJob = occupations["Malcolm"]
occupations["Jayne"] = "Public Relations"

//:Line 17 shows how to create a new dictionary from scratch. Just like with arrays `[]` brackets are used to bound the dictionary elements. Also like an array, each key-value pair is separated by a comma. Unique to a dictionary however is the formation of the pair itself. The object on the left of the `:` is the key, and the right-side object is the value. Just like with arrays, the datatypes for each can be any object, as long as they are consistent throughout the dictionary. So a dictionary with `String` keys and `Int` values must contain pairs over only these types.
//:Fetching a value from the dictionary can be done as shown in line 18. Similar to object fetching in an array, you simply wrap the key associated with the desired value in `[]` brackets and place it after the name of the dictionary. Also similar to arrays, adding a key-value pair is accomplished like you see in line 19. Just be sure that the dictionary has been declared as variable, not a constant.
//:## Control Flow
//:Now that you have an idea of how to write basic instructions (creating and manipulating constants and variables) you will want to be able to form more complicated blocks of instructions. Enter control flow. The concepts that follow allow the program order of execution to be modified at *runtime*. This means that you can set up different forks in the road and the computer will choose a particular road when the program executes. This is commonly used when you might have two or more sets of instructions you'd like to run, but you won't know which is appropriate until the application is running and it contains live data. Let's take a look a the first control flow mechanism, the *if statement*.
//:### If... or Else
//:Let's say you have some code that should only run *if* certain conditions are met at runtime. To do that, you wrap those instructions in an `if` block.

if shipCaptains == engineers
{
    print("Arrays are equal")
}
else
{
    print("Arrays are not equal")
}

//:To re-use some of our previously defined arrays, let's run one of two possible print statements. You'll notice in line 22 we type `if` followed by something called a *conditional statement*. This statement must evaluate to a boolean answer, i.e. `true` or `false`. Since we're checking here whether the `shipCaptains` array is equal to the `engineers` array with the equality operator, the statement will be evaluated to a boolean answer. What follow this line is a set of `{}` where you place all instructions that need to be run if the conditional line evaluates to `true`. Lines 26-29 are optional. `if` blocks are not required to have an `else` clause, but you may use one if you have instructions that should run only if the conditional statement is `false`. In this case, we want a sentence to print either way, so we have and `if` clause and and `else` clause. Based on what we know of the two arrays referenced here, which print statement will execute at runtime?
//:The two arrays are not equal, so the instructions inside the `if` clause are skipped and the instructions inside `else` are run instead.
//:NOTE: several languages demand that a set of `()` parentheses be used to wrap the conditional expression after the word `if`. In Swift these parentheses are allowed but not required. So feel free to use them if they help you and skip them if they don't.
//:### Switch it Up
//:Believe it or not, most control flow issues can actually be resolved with if-else blocks. You might need to chain several of them together, but you can actually create a pretty complicated path of code using just `if`'s. The problem with that is many nested `if`'s can be very difficult to follow and debug. Because of that, what follows is a set of control flow concepts that allow for both more complicated `switch`ing (see what I did there?) as well as looping.
//:If you have several different paths of code, but only want to execute one of them at runtime, use a `switch` block. See below for an example:

let a = 3
switch a
{
case 1:
    print("Got 1")
case 2:
    print("Got 2")
case 3, 4, 5:
    print("Got 3 or 4 or 5")
case 6...22:
    print("Got 6 to 22")
default:
    print("Got Default")
}

//:As you can see above, the `switch` block is bounded by a set of `{}` braces. The value that you're "switching" from is listed after the reserved keyword `switch`. Each possible outcome is listed inside the braces as a `case`. A few notes about cases: values can be chained together (see line 39), values can be a range (every number between the lower and upper bound, see line 41), and Swift requires every `switch` block to include a `default` case (see line 43). This default is a catch-all so that no matter what value you switch off of, a case will be listed to cover that value, even if it is a default. Also of note: the value switched can be of any object type, a difference with some other languages that restrict the datatypes possible.
//:Bottom line: many different cases can be listed (and each case can have multiple lines of instructions), but at runtime, since the value of the switched variable or constant (in this example, `a`) will only be satisfied by one case, only one block of instructions will run. All other cases will be skipped.
//:## Looping
//:We've been so far talking about deciding which block of code to run based on certain runtime conditional values, but what if we wanted to run a block of code repeatedly for a certain number of times? Or run until certain conditions are met? For that I give you looping. Let's take a look at `for` loops first.
//:### `for`
//:These loops allow you to run a set of instructions a certain finite number of times. The most common way to bound a for loop is to provide it with a collection of data and have it iterate over each element in that collection. Thus if the collection has 10 items, the `for` loop will run its block 10 times.
//:As an example, let's imagine a game that has different scoring rules for individuals vs. teams. The team score is based the individual scores of each team member. When a team member scores more than 50 individual points, the team scores 3 points. If the individual score is 50 or less, the team only scores 1 point. Given a list of individual scores for a particular team, let's build a loop that will determine the overall team score.

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores
{
    if score > 50
    {
        teamScore += 3
    } else
    {
        teamScore += 1
    }
}
print(teamScore)

//:### `while`
//:`while` loops are used to perform an instruction or set of instructions until some condition is met. The loop runs an undefined number of times rather than a predefined number like with a `for` loop. Let's say we wanted to count to 100 by a factor of 5 each time. We could arrange a loop such that it will end after we reach 100. See below for an example:

var n = 0
while n <= 100
{
    n += 5
    print(n)
}

//:The above code block will print each number between 5 and 100, jumping by 5 each time. The block is evaluated as follows: line 64 evaluates to `true` or `false` depending on the value of `n`. As long as the value is less than 100, lines 66 and 67 are evaluated. The value of `n` is increased by 5 and then printed. Once line 68 is reached, the loop begins again, as long as `n` is still less than 100. At some point the value of `n` will be increased beyond 100, and when the loop begins again at that point, the conditional on line 64 will evaluate to `false`, thus ending the loop.
//:## Recap
//:Let's take a look at the concepts covered in this lesson:
//:* Different collection data types: arrays and dictionaries
//:* Controlling the flow of code with `if-else` and `switch` blocks
//:* Running the same block of code multiple times with loops: `for` and `while`
