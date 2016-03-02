import Foundation
//:# Classes and Objects
//:## Functions
//:The best part of computer programming is the ability to leverage the strengths of the computer to perform tasks that would be tedious and error prone if done by a human. Take, for example, calculating a tip on a restaurant bill. The math isn't too difficult, but one of the computer's biggest strengths is fast and reliable arithmetic. Let's write some code to calculate the tip on a bill.

let subtotal = 25.95
let tipPercentage = 0.2
let tipAmount = subtotal * tipPercentage
let total = subtotal + tipAmount
print(total)

//:A simple implementation of the description above, but one we can't use again. The logic for calculating the tip is commingled with the specific numbers from this bill. What if we wanted to calculate another bill's tip? Or change the percentage of this bill's tip? Let's modify this code so we can use it repeatedly, by placing it inside a *function*. A function is a block of code that can be *called* in other parts of the program, thus making it reusable.

func calculateTip(subtotal: Double, tipPercentage: Double) -> String
{
    let tipAmount = subtotal * tipPercentage
    return String(format: "%d%% of $%0.2f is $%0.2f", Int(tipPercentage * 100), subtotal, tipAmount)
}

calculateTip(25.95, tipPercentage: 0.2)

//:There is a lot going on here so we'll break this down line-by-line. Lines 10-14 comprise the function, which is named `calculateTip`. The first line specifies it to be a function with the reserved keyword `func`. The name can be any string of characters you want, but the convention is to use *camel case* and to make it short and descriptive. The items in the parentheses are called *arguments*, and the data type following the `->` arrow is called the *return type*, or the kind of item the function will return to its caller. Line 12 is essentially the same as line 5 from the previous example. Line 13 creates a string and returns the information in a human-readable format. Using the *function call* from line 16, the function would return the following string:
//:`20% of $25.95 is $5.19`
//:Understanding every bit of the above example isn't necessary right now. The point is that with this function, we can calculate a tip whenever we desire without needing to know how. We instead just call the function with the appropriate *parameters* (another name for arguments). The best functions are black boxes, they do what we ask without fail each time we call them. As you delve deeper into programming, you will no doubt call functions for which you can't even see the implementation. That's why proper function naming, argument selection, and documentation surrounding your code is crucial -- so others can use your code without needing to inspect the implementation themselves to understand the functionality.
//:## Classes
//:Functions are great. They allow the programmer to group instructions into logical units and perform them as a whole by simply calling the function by its name. Functions can't store information longterm however. Each time they run, the information contained within is only stored in memory for the life of the function. Once it finishes (i.e. *returns*), the data it stored is gone. To understand classes and how they fit into the *object-oriented* paradigm, imagine a real-world item you'd like to model with code. Let's use a car as an example. To properly model it, you'd need the computer to store things about the car that define what the car *is*, as well as what the car *does*. The object-oriented paradigm defines these things as *properties* and *methods*. A property is something *about* the object. The fuel level of a car could be a property. The action of driving could be a method. In Swift, methods are also called functions (these two terms are used interchangeably by Swift developers, but here, I'll call them functions).
//:A *class* is a grouping of code used to create *objects*. You can think of the class as the blueprint, and the object as the thing made using the blueprint as a guide. Using our above example, a specific car is the object, say a blue Honda Civic. The blueprint we use to build that car is a class named `Car`. Let's look at a code example:

class Car
{
    var make: String
    var model: String
    var color: String
    var fuelLevel = 1.0
    var odometer = 0
    
    init(make: String, model: String, color: String)
    {
        self.make = make
        self.model = model
        self.color = color
    }
    
    func drive() -> Bool
    {
        var hasDriven = false
        if fuelLevel >= 0.2
        {
            fuelLevel -= 0.2
            odometer += 5
            hasDriven = true
        }
        return hasDriven
    }
}

let hondaCivic = Car(make: "Honda", model:"Civic", color: "blue")

//:Lines 19-45 define a class called `Car`. This is a blueprint for creating `Car` type objects. The `Car` class has three properties, `make`, `model`, and `color`. To create an *instance* of the `Car` class (another way to describe an object), you must provide all three attributes, which we do when we *instantiate* a `Car` object at line 47. The computer knows how to set the various arguments at line 47 to the appropriate properties of the object created because of the `init` function at line 27 in the class. This maps the arguments that are  *passed into* the `init` function to the *instance properties* of the object. Again, understanding every bit of the above example isn't necessary right now. The important concept here is that real-world systems can be modeled in code with classes to define what it *is* and what it *does*. The Swift compiler can then use this blueprint to create *instances* of the class (objects) using specific data (line 47).
//:### Drive My Car
//:Notice we've also defined a method (function) called `drive` in the `Car` class. It can be called on a `Car` object as follows:

hondaCivic.drive()

//:The `drive` method uses the following properties to determine whether the car can move:
//:* `fuelLevel`: a `Double` property with an initial value of `1.0`
//:* `odometer`: an `Int` property with an initial value of `0`
//:As you can see in the `drive` function, the car can only move if it has at least 20% of its gas left, and if so, it uses a 20% portion of gas and adds 5 miles to the odometer. This is not a very fuel efficient vehicle, but it'll do for our purposes. The cool thing about custom classes and methods is you can model your real-world object however you'd like. In this case, we only care about fuel usage and miles driven. We'll be using classes and objects throughout, so don't worry if these concepts are still a little foggy.
//:## Recap
//:Let's take a look at the concepts covered in this lesson:
//:* Using functions to group together related instructions
//:* Using objects to model real-world elements in code
//:* Instructing the computer on how to build objects using its class as a blueprint
