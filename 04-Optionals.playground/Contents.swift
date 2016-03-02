//:# Optionals
//:## Optional Values
//:Just what is an *optional* in Swift anyway? As we've seen, a value held in an identifier can be either constant (declared with `let`) or variable (declared with `var`). An optional can either *contain* a value or *not* contain a value. We refer to an optional with no value as being equal to something called *nil* (means nothing or no value). Since constants cannot be changed after they are initialized, it wouldn't make sense to allow a constant to have an optional value, as that would negate its **unchanging** nature. Thus, only variables can be optional. To indicate to the compiler that a variable is optional, add a question mark (?) after the data type.

var possibleName: String?

//:The variable declared in line 2 is called `possibleName` and will eventually contain a value of type `String`, though it is currently initialized with no value, or `nil`. Because Swift is a *strongly typed* language, all variables must be declared with a data type. This can either happen with an explicit declaration of type, like in line 2, or through *type inference*, where the type is inferred by the value given to the variable to initialize it. The problem with optionals is that they can be declared with no value, so type inference isn't applicable. Thus we are forced to explicitly declare the data type like we do in line 2. Now, let's see how we can check a variable's optional state.

print(possibleName == nil)

//:What do you think prints to the screen here? To find out, look inside the print statement and evaluate the expression. `possibleName == nil` is an equality expression, and the output of an equality expression is always `true` or `false`. When this expression is evaluated at runtime, the value of `possibleName` is compared with `nil`. Since back in line 2 we didn't initialize `possibleName` to any value, it contains `nil`. `nil` and `nil` are equal, so the expression evaluates to `true`. Thus, the print statement prints out `true`.
//:What would happen if added a line between lines 2 and 5 and set `possibleName` to a particular string? Would the output of the print statement be affected? Since the value of `possibleName` would no longer be `nil`, the expression would evaluate to `false`, changing the output of the print statement accordingly.
//:So it looks like you can always compare an optional value with `nil` using an equality expression, but that can get a little cumbersome if you're referencing the optional value in several places. Let's see if there is a better way of checking the state of an optional.
//:NOTE: Why are we checking the state of the optional at all? Well, if you try to use an optional variable, for instance performing arithmetic on an optional integer that is set to `nil`, the application will crash at runtime. Not a great user experience to say the least.
//:### Optional Binding

if let name = possibleName
{
    print("Hello, \(name)!")
}
else
{
    print("Hello, Friend!")
}

//:Line 8 above uses an if statement to check the value of the optional variable `possibleName`. Let's unpack what's happening here. If the value of `possibleName` is not `nil`, that value is *unwrapped*, assigned to the constant `name` and the expression overall in the conditional evaluates to `true`, allowing the code at line 10 to execute. If however, the value of `possibleName` is `nil`, the constant `name` is never created, the expression overall evaluates to `false`, and the line inside the `else` block (line 14) is executed instead. This technique is referred to as *optional binding*, meaning the optional is bound to the constant if it has a value. Also, realize the constant `name` is only available for use inside the if block (lines 9-11). This is because its *scope* is confined to the if block because it was created in the if conditional.
//:NOTE: The same pattern can be used where the optional value is instead bound to a variable rather than a constant if mutability is desired. Just replace the keyword `let` with `var`. The resulting variable can then be changed inside the if block.
//:Another way to deal with optional values when they need to be used is to assign a default value, in case no value exists when accessed.

print("Hello, \(possibleName ?? "Friend")!")

//:Lines 8-15 and line 18 accomplish the same goal, printing "Hello, " followed by either a name if one is provided in `possibleName`, or the default name "Friend" if not. While you might prefer the second approach because of its concise nature, both approaches have their time and place and neither are universally applicable to all problems.
//:### Forced Unwrapping
//:If you know for sure that an optional has a value (not equal to `nil`), you can place an `!` exclamation point after the name of the optional to *force unwrap* it. WARNING: force unwrapping an optional that is actually `nil` will cause a runtime error (i.e. a crash). So only use the `!` if you know for sure the optional has a value. See an example below:

var possibleNumber: Int? = 6
if possibleNumber != nil
{
    print("The value of possibleNumber is \(possibleNumber!)")
}

//:In this example, line 24 won't cause a crash because we first check that `possibleNumber` is NOT equal to `nil`. If we hadn't set a value at line 21, the conditional at line 22 would evaluate to `false` and the line that force unwraps the optional (line 24) would never run.
//:## Recap
//:Let's take a look at the concepts covered in this lesson:
//:* Optional values and how to create them
//:* Optional binding and unwrapping
//:* Forced unwrapping with `!`
