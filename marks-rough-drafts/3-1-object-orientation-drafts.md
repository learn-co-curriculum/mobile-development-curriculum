# Visibility Of Properties & Methods

## Objectives

## Public vs Private

So far, all of the properties and methods that we've either shown to you in examples or had you write in labs have been *public*. Like playing around in the open of your front yard, this means that everything you've been doing so far has been *visible* to outside classes. Much of the time, this can be appropriate—but not always.

![](https://upload.wikimedia.org/wikipedia/en/1/18/Private_Property_Sign_on_Fence.jpg)  
—*"Private Property" sign on a chain link fence*, David Lottito, 2010. [Wikipedia Commons](https://en.wikipedia.org/wiki/File:Private_Property_Sign_on_Fence.jpg)

====not finished====

## `@interface`: `.h` vs `.m`

You've likely wondered by this point why it is that Objective-C requires *two* files for every class. What's the purpose behind the `.h` and the `.m` files? It sure feels redundant some of the time.

Well, the answer to that is **visibility**. Everything contained in the `.h` header file is what's publicly visible. The `@interface` section is just that: a declaration of the available "interface" for interacting with that class or an instance of it. The interface is, in effect, the "control panel" for that class. It's the set of commands and input/output that's available to the *public*, meaning outside the device itself. The inner workings of a class actually functions is its *implementation* which it keeps *private*. 

Imagine an old analog car radio:

![](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Car_Radio_of_Analog_Era.jpg/1280px-Car_Radio_of_Analog_Era.jpg)
—*Typical car radio of analog era. For Toyota's car, made by Fujitsu Ten.* [Wikipedia Commons](https://commons.wikimedia.org/wiki/File:Car_Radio_of_Analog_Era.jpg)

That front panel with all of the buttons is its *interface*—the public presentation of all the ways the object is intended to be used. Its *implementation*, however, is kept privately enclosed in a metal box that slides into the dashboard. This is partly for safety (we don't want to electrocute a passenger!), but mainly for security: the radio manufacturer doesn't want the internal circuitry to get disturbed! That might cause unexpected behavior. 

Providing an interface about public usability via the `.h` header file is how Objective-C classes share information about themselves to other classes. However, *within* that class file's `.m` implementation file, an optional *private interface* can be used for declaring *private properties*. 

The private `@interface` is placed in the `.m` implementation file between the `#import` lines and the `@implementation` section and must be closed with an `@end` keyword before the `@implementation` keyword. Private properties can be added here without making them visible outside of the class. Private *methods*, however, don't need to be declared in the private interface section—the method names in the `@implementation` section make them visible within the current class file.

So, an incomplete representation of that radio in Objective-C might look something like this:

```objc
//  FISRadio.h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>   // imports CGFloat

@interface FISRadio : NSObject

@property (nonatomic) CGFloat swBal;
@property (nonatomic) CGFloat tuning;

@property (nonatomic, readonly) CGFloat amTuning;
@property (nonatomic, readonly) CGFloat fmTuning;

@property (nonatomic) CGFloat tone;
@property (nonatomic) CGFloat volume;

@property (nonatomic, readonly) BOOL stereo;

@property (nonatomic) CGFloat fmPreset1;
@property (nonatomic) CGFloat fmPreset2;
@property (nonatomic) CGFloat amPreset1;
@property (nonatomic) CGFloat amPreset2;
@property (nonatomic) CGFloat amPreset3;

- (void)toggleStereo;

@end
```

```objc
//  FISRadio.m

#import "FISRadio.h"

@interface FISRadio ()

@property (nonatomic) BOOL power;

@property (nonatomic, readwrite) CGFloat amTuning;
@property (nonatomic, readwrite) CGFloat fmTuning;

@property (nonatomic, readwrite) BOOL stereo;

@end

@implementation FISRadio

- (void)toggleStereo {
    if (self.stereo) {
        self.stereo = NO;
        NSLog(@"Mono mode selected.");
    } else if (!self.stereo) {
        self.stereo = YES;
        NSLog(@"Stereo mode selected.");
    }
}

@end
```

### The `readonly` & `readwrite` Property Options

The `readonly` property option does just that: it makes the property unwritable, or "read only". 

## The Anatomy Of A Property


When we set up our `Warship` class, its member variables `name`, `length`, `beam`, `keel`, etc., would most likely get programmed as *properties*. A **property** generally refers to a toolset of three things: an instance variable, a setter method, and a getter method.

The **instance variable** is the actual piece of data that the property manages, typically named after the property but prefixed with and underscore (`_`).

The **setter** is a method that is responsible for writing to the instance variable, typically named after the property that it writes to (or "sets"), but is prefixed with "`set`", as in `setLength:` for the `length` property.

The **getter** is a method that is responsible for reading the instance variable, typically named after the property whose value it retrieves (or "gets"), as in `length` (method) for the `length` property.

**Advanced:** *A read-only property is, in effect, just an instance variable with no associated setter method—only a getter method.*

Whenever possible, use the setters and getters to interact with an instance variable. Avoid modifying it directly.

You've already interacted with the `count` getter method on arrays:













# Writing Initializers

## Objectives

## Defensive Programming ?

## Designated Initializers

## Overriding the Default Initializer `init`

## Convenience Initializers




^^^Mark^^^


## Initializers 

Let's say though that we do want to setup a default set of arms, legs, height, weight, and sense of humor. We can do that when we "initialize" a new instance of `Human`. What does initialization mean in the context of programming? Well, think of the class `HumanBeing` as the instruction manual for creating a `Human` object. When we initialize a new instance of a `Human`, we are really giving that instance of the `Human` being all of the properties and behaviors of the class. Initialization is the point at which the `Human` instance becomes formed, or is born, you might say. And every human is born with some innate properties. Generally speaking, the default initialization of a `Human` includes 2 arms, 2 legs, 7.5 lbs, 20 inches long, and no sense of humor. (Babies don't laugh for a few weeks to months!) 

Additionally, every `Human` has a name. And it wouldn't make much sense for a `Human` to be nameless. So, we use custom initializers to ensure that the required properties of a `Human` are setup from the start and never `nil`. 

Here's how that might look:

######Example
```objc
//Human.m

#import "Human.h";

...

@implementation Human

- (instancetype)init
{
	self = [super init];

	if (self) 
	{
		_name = @"Average Joe"
		_weight = 7.5;
		_height = 20;
		_arms = 2;
		_legs = 2;
		_senseOfHumor = @"average";
	}

	return self;
}

@end

```

Line by line, this code is first making sure our superclass is initialized. It is an odd line of code but will always exist in our designated initializer. There will only be one designated initializer in the class. All others will point to this initializer. (You will see this in our next example.)

Then, assuming we initialize our superclass successfully, we will initialize all of the instance variables of our class.

And finally, we return ourselves, fully formed!

But what if we don't want to wait to hold an in-depth conversation with them about computer programming? In that case we would like to build a custom initializer that allows us to set the properties of our new `Human` object such that they are more of an adult from the start (or an oversized baby?)

```objc
//Human.m

#import "Human.h";

...

@implementation Human

- (instancetype)initWithName:(NSString *)name WeightInPounds:(NSNumber *)weight HeightInInches:(NSNumber *)height SenseOfHumor:(NSString *)senseOfHumor 
{
	self = [super init];

	if (self) 
	{
		_name = name;
		_weight = weight;
		_height = height;
		_senseOfHumor = senseOfHumor;
		_arms = 2;
		_legs = 2;
	}

	return self;
}

- (instancetype)init
{
	return [self initWithName:@"Average Joe" WeightInPounds:7.5 HeightInInches:20 SenseOfHumor:@"average"];
}

@end

```
Here we have both a designated initializer (`initWithName:WeightInPounds:HeightInInches:SenseOfHumor:`) and what we call the default initializer (`init`). Our designated initializer is also known as a convenience initializer, because it provides us the convenience of initializing the properties of our `Human` instance all up front. Note also the fact that our designated initializer has the boilerplate code that checks to ensure our super class has been initialized, while our default only returns values to the designated initializer. This is what we meant earlier when we said that other initializers point us to the designated initializer.

## Public vs. Private methods

If you place a method or property in your `.h` file, it will be "public", visible to other classes / users of the class in which those methods or properties are declared and defined.

######Example
```objc
//Human.h

@interface Human : NSObject

@property (nonatomic, strong) NSNumber *weight;
@property (nonatomic, strong) NSNumber *height;

- (void)socializeWithAnotherHuman:(Human *)otherHuman;

@end
```

If you place a method or property in your `.m` file, it will be "private", and only visible to other users of the class in which those methods and/or properties are defined. Just an aside: Methods and properties defined in your .m are not actually unavailable to a third party; however, they do not announce themselves either. Someone who really wanted to know what the insides of your classes looked like could get in their and check out your classes' innards. (In fact, programmers do this regularly with Apple's proprietary Cocoa framework!) 

######Example
```objc
//Human.m

@interface Human()

@property (nonatomic, retain) NSString * name;
@property (nonatomic, strong) NSNumber *birthdate;

- (NSString *)sayHi
{
	return @"Hi!";
}

@end

```

The thing to keep in mind, and how to decide whether something belongs in the `.h.` or `.m` file, is this: When you put something in your `.h` file you are responsible to the classes' users of that method. So, in order to avoid excess accountability, we try to keep things private. In other words, if you are not sure whether a method should be public or private, you should default to making it private.

##Collections of Objects

As you become more familiar with objects, you'll begin to realize that an object's properties are really just other objects. Until now, those objects were standard data types such as `NSString` or `NSNumber`. But once we build our own objects, they also may be properties of an object. For instance, consider the `House` object. Every `House` has `Room` objects, it is painted a certain `color`, and is a certain number of `squarefeet`. So our house interface might look like this, with some added properties:

######Example
```objc

//  House.m

#import "Room.h"
#import "Chimney.h"
#import "WaterHeater.h"
@interface House ()

@property (strong, nonatomic) NSArray *rooms;
@property (strong, nonatomic) NSArray *chimneys;
@property (strong, nonatomic) NSNumber *squarefeet;
@property (strong, nonatomic) NSNumber *floors;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) WaterHeater *waterHeater;

@end

@implementation House
...
@end
```

Besides our standard `NSString` and `NSNumber` objects above, we have collections of custom objects. Somewhere in our project there is a `Room` class, and another class called `Chimney`, and these classes define the properties of a `Room` and a `Chimney`, respectively. This allows us to really capture the complexity at any level of granularity we wish. There is also a `WaterHeater` class, and given each home has only one `WaterHeater` by default, the property for this custom object is not a collection. 

Some folks we have spoken with in the past have had trouble with separating this concept from inheritance. Let us be clear now -- a room is not a subclass, or type of house. A room is in a house, but a `Room` is not a type of `House`, nor is a `Chimney` a type of `House`. If we had a class called `Residence`, then `House` might inherit from that class, because it is a type of `Residence` (as is `Apartment`, `Condo`, `Yurt`, and `MobileHome`). 

There is a major difference between an object being made up of other objects as in the case of `House` and `Room` or `Engine` and `Cylinders`, and an object being a subclass or type of another object as with `Residence` and `House`. Be sure to read up on inheritance as well if you haven't already, and make sure you understand the difference between these concepts!
#Properties  



###Private instance variables within a method 
#####(or with "local" scope)
Every variable we create within an instance method has been an "instance variable" by definition. It has "local" scope, because it is limited to being used within the method in which it has been created. In other words, if you were to try to access that variable in another method, even within the same class, the compiler would not recognize it, and your program would not run.



###Private instance variables available to an entire class 
#####(or with "protected" scope)
But what if we want to share the information stored in a variable across multiple methods within a class? We could pass the variable from method to method via a method's arguments. However, this might get tedious quickly if the variable we wish to pass appears in many places.

Fortunately, we are also able to add variables to our `@interface`, giving our instance variable "protected" scope, or scope across an entire instance of an object. If we add the variable to an `@interface` in our `.m` file, it will still be private. However, if we add the variable to an `@interface` our `.h` file, it will be public. As a reminder, public vs. private is really just another way to describe who can read and/or write to variables of a class and call methods of a class. When a variable is public, other classes have access to it. (But you'll have to read on to find out how to actually use a public variable in another class!)

It has become convention to place an underscore in front of an instance variable with "protected" scope.

######Example

```objc
//Product.h

@interface Product : NSObject {
	NSNumber *_size;
}

//Any other interface related details go outside of the brackets, such as method declarations

@end
```

Having defined this `_size` variable, we can now set its value and get its value throughout the class!

Keep in mind: Instance variables with protected scope are held in memory until the entire instance of the object is released from memory. For instance, a variable that holds a `UIView` would be held in memory until the `UIViewController` class it is instantiated within has also been released from memory.



###Public instance variables 
#####(or instance variables with "global" scope)

So what if we want to access this variable from outside of the class? What if we want to set its state when something changes in another class? We can do that with "accessor" methods.

There are two standard types of accessor methods: "Getters" and "Setters". Let's take a look at each.



###Getter

In order to get the value of the `_size` instance variable from outside the class `Product`, we must declare and define a method that "gets" that value. We call this method, quite appropriately, the "getter" method. Here is an example of a default getter for the `NSNumber` instance variable called `_size`. 

######Example
```objc
//Product.m

-(NSNumber *)size {
    return _size;
}

```



###Setter

Similarly, we must declare and define a method that "sets" the value of this instance variable. Here is a default "setter" method.

######Example
```objc
//Product.m

-(void)setSize:(NSNumber *)size {
    _size = size;
}
```

Getters and setters are collectively known as "accessors", and with them, we can store information at a memory address to which we give a name (a.k.a. an instance variable).

Don't forget to declare these methods and the instance variable itself in the `.h` of your `Product` class!



##Properties
So...you've been lied to. Kind of. But it was the good kind of lie. Because you've learned the old, harder way of doing things, and now you are going to learn a more elegant method.

You see, over time, the folks at Apple got smart about instance variables and recognized that all that work was a bit repetitious for basic uses of instance variables. And thus, "properties" were born.

Properties are a form of abstraction. They encapsulate an instance variable, a setter, and a getter method and we only have to write one line of code!

######Example
```objc
//Product.h

@interface Product : NSObject 

@property (strong, nonatomic) NSNumber *size;

@end
```

With just a single line of code, we have indicated that we are creating an instance variable, and we have an implicit setter and getter. To be clear, we can still write our accessor methods as we did before, but it is not necessary unless we wish to customize them with additional code.

So, let's walk through what we have written above in more detail.

First, take note of the fact that properties do not get written within brackets as instance variables do.

In order to declare a property, we start with the syntax `@property`. Pretty straightforward.

####Property attributes

Then we provide any attributes of this property in parentheses.


#####`readwrite`/`readonly`
We have already discussed the difference between public and private variables, but sometimes you would like a variable to be publically available for other classes to see, but not for other classes to be able to change. When this is the case we add `readonly` to the property attributes and we also redeclare the property in the `@interface` of our `.m` file with the `readwrite` attribute set. (If we do not have it set to `readwrite` in our `.m` file, no one will be able to set the value of the property!)


#####Other attributes
Other attributes you will want to learn about in the future include: `atomic`, `weak`, `copy`, `unsafe_unretained`, and attributes to rename your getter and setter methods. 

However, as a beginner, let's stick with the standard `(strong, nonatomic)` attributes with the occasional `readonly`/`readwrite` added in.


####Property type and name
Finally, we tell the program what type the property is, and then give it a name. As you can see, we do not include an underscore before the name of the property. However if we access the instance variable within the property, it will by default, include the underscore. (We won't get into that here, but just know that if you see the underscore, you are again looking at an instance variable.)


###Accessing properties
So if we're in another class and we wish to set the `size` property (a.k.a. instance variable) of our `Product`, how do we do it?

Well, we could call the accessor methods (`[aProduct size]`), but there is another, slightly more concise option: Dot notation. Let's take a look at an example in which we call the `size` property of our `Product` class from another class called `SizeConverter`.

######Example
```objc
//SizeConverter.m

- (NSNumber *)ouncesToPounds:(Product *)aProduct {
	return aProduct.size / 16.0;
}
```

Within the same class, we would use `self.size`.



###`@synthesize`

You may see a line of code in older objective-C projects that looks something like this in the `.m` file:

```objc
@synthesize product = _product;
```
This line of code would autogenerate your setter and getter and also create the instance variable for your property.

In more recent versions of xcode, Apple made it such that simply by declaring a property, you autogenerated all of the boilerplate underlying code, so you no longer have to concern yourself with this (but now you know what it means if you come across it!)



##Common mistakes

- When writing a getter / setter / or initializer, it is common to see folks do something like this:

######Example
```objc
//Product.m

-(void)setSize:(NSNumber *)size {
    self.size = size;
}
```

What is wrong with the above? By trying to set the property rather than the instance variable with in the setter (or returning the property from the getter), we will find ourselves within an infinite loop. Recall that the property is actually shorthand for an instance variable, a setter method, and a getter method. So the following is another way to write what we have just above:

######Example
```objc
//Product.m

-(void)setSize:(NSNumber *)size {
    [self setSize:size];
}
```

See the problem? We have effectively called the same method, and doing so will happen again and again until our app crashes!

So the rule is, in setters, getters, and initializers we use the instance variable (`_size`); everywhere else, use the property.

Summary

You have now learned the basics of properties: how to create them, how to use them, and where they come from. Get used to using them. And if you see someone declare an instance variable in their `@interface`, show them the way of the property!

### Person

#### About Properties
Properties provide a way to create instance variables and accessor methods (getters and setters) in a single step.  Say for instance we created a class called cats.  If Cats has a property (of type NSNumber) numberOfLegs, the cat class will automatically, behind the scenes generate two methods for us: 

```objc 

 - (NSNumber *)numberOfLegs; // getter
 - (void)setNumberOfLegs:(NSNumber *)numberOfLegs; // setter

```

We can use these methods to both set and get our class's properties.  Let's say we create a Cat 'myCat' in our AppDelegates' didFinishLaunchingWithOptions method.  We can set the cats number of legs and get the cats number of legs using the following code.  

```objc

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   [myCat setNumberOfLegs:@4]; //sets number of legs 
   NSNumber *numLegs = [myCat numberOfLegs]; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }

```

But it gets better! Objective-C allows us to use dot notation to both get and set properties.  I could (and in fact should), write the above code like this: 

```objc
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   myCat.numberOfLegs = @4; //sets number of legs 
   NSNumber *numLegs = myCat.numberOfLegs; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }
```

Last, remember that the classes you make are just like any other class such as `NSString` or `NSNumber`. You can add them to arrays like this:

```
NSMutableArray *myArray = [[NSMutableArray alloc] init];
Cat *myCat = [[Cat alloc] init];

[myArray addObject:myCat];
```

Then we can get the cats the same way we are used to with arrays

```
Cat *retreivedCat = myArray[0];
```
