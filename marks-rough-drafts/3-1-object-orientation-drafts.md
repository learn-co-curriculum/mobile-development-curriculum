# Writing Initializers

## Objectives

## Initializer Methods

We've discussed the use cases of the `alloc` and `init` method pairs in the past, but what are these methods actually doing? The `alloc` method is a class method that *allocates* a place in memory (RAM) to hold the instance variables that comprise an object of the given class. The `init` method is what actually populates that portion of memory with the relevant structure. Other initializers can be written which actually populate the structure with information (values) right from the start.

We can compare these two roles to the phases of constructing a building: the `alloc` method is like selecting the ground that will be the building's lot, designating and preparing the place for it go. The `init` method, however, is the phase of actually building the structure that's detailed in the architect's blueprint.

The `init` method is actually just the basic initializer, called the "default initializer", but an initializer is any method that returns an `instancetype` (and the compiler will require that the method name begins with `init...`). Methods from the `init` family can be set up to offer varying levels of pre-fabricated setup. 

This can be seen like asking the construction firm to paint the house something other than white, or even to find an interior designer to provide furniture and to hang art on the walls. In such a case, the house is further along to becoming an actual home instead of just an empty free-standing structure that serves as the most basic form of a house.

### The Designated Initializer

A "designated initializer" is the initializer method which provides the *most thorough coverage of that class's data.* It doesn't necessarily provide *complete* coverage, just the *most* coverage of any of the `init...` methods. Take for example, the `initWithObjects:` method available to `NSMutableArray`.

**Note:** *The* `initWithObjects:` *method is actually defined on the* `NSArray` *class, but since* `NSMutableArray` *is a subclass of* `NSArray` *it can also perform the* `initWithObjects:` *method.*

```objc
// designated initializer

NSMutableArray *instructors = [[NSMutableArray alloc] initWithObjects:@"Joe", @"Tim", @"Tom", @"Jim", @"Mark", nil];

NSLog(@"%@", instructors);
```
This will print:

```
(
    Joe,
    Tim,
    Tom,
    Jim,
    Mark
)
```

This is the initialization method that every other way of creating an `NSMutableArray` object will have to pass through at some point. We can get to this state manually by using the default initializer `init` and then calling the `addObjectsFromArray:` method to insert the list of objects into the array:

```objc
// manual set up

NSMutableArray *instructors = [[NSMutableArray alloc] init];
[instructors addObjectsFromArray:@[@"Joe", @"Tim", @"Tom", @"Jim", @"Mark"]];

NSLog(@"%@", instructors);
```

This will also print:

```
(
    Joe,
    Tim,
    Tom,
    Jim,
    Mark
)
```

The value of using the designated initializer is that in a single step, we can be assured that the given instance will be returned already set up with appropriate values for the associated properties—in this case, the list of objects that the array contains. 

##### Initializing Read-Only Values

Designated initializers are also useful for setting up read-only properties that cannot be written to from outside the class:

![](https://curriculum-content.s3.amazonaws.com/ios-intro-to-objects-unit/readonly_error.png)

The initializer allows a user of that class to provide an initial value for those read-only properties upon creating an instance:

![](https://curriculum-content.s3.amazonaws.com/ios-intro-to-objects-unit/readonly_init.png)

The usefulness of providing a designated initializer allows the user of the class to be assured that the instance will be set up holistically enough to perform its methods without unexpected behavior. It also allows us, the developer, to document the set up for the class.

### Declaring the Designated Initializer

Since initializers *must* be public methods, they need to be declared in the `.h` header file. The rules for `init` family methods that are enforced by Apple via the compiler are that it:

  * must be an instance method (`-`),
  * must return an `instancetype`, and
  * must begin with the word `init`.

```objc
- (instancetype)init...;
```
When writing any initializer that is not the default initializer `init`, it is common practice to continue the method name with the worth `With` followed by the an argument for every property that the initializer needs to pass a value into. As convention, the arguments in the method declaration are typically named after the property to which it is intended to be assigned.

So, assuming a custom class `FISWarship`:

```obj
// FISWarship.h

#import <Foundation/Foundation.h>

@interface FISWarship : NSObject

@property (strong, nonatomic) NSString *shipName;
@property (nonatomic) NSUInteger currentSpeedInKnots;
@property (nonatomic) NSUInteger maximumSpeedInKnots;

@end
```

The default initializer for a `FISWarship` class might be declared as:

```objc
- (instancetype)initWithShipName:(NSString *)shipName
             currentSpeedInKnots:(NSUInteger)currentSpeedInKnots
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots;
```

### Defining the Designated Initializer

#### Autocomplete in Xcode

Because designated initializers, in particular, can produce some ridiculously long method names in Objective-C, relying on autocomplete to reference the declared method elsewhere your in code is good practice to both save keystrokes and to defend against typos.

In the `.m` implementation file for the class, utilize autocomplete by typing the instance method indicator (`-`) followed by the first few letters of the method name. In the case of initializers this will be `initWith`. Select the appropriate method if there is more than one option and open the curly braces `{` `}` that contain the implementation code.

```objc
// FISWarship.m

#import "FISWarship.h"

@implementation FISWarship

- (instancetype)initWithShipName:(NSString *)shipName 
             currentSpeedInKnots:(NSUInteger)currentSpeedInKnots
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots {

}

@end
```

#### Implementation Syntax

Now within the implementation of the designated initializer, we want to follow this code structure:

```objc
{
    self = [super init];
    if (self) {
        /**
        * Set instance variables to their 
        * associated method arguments.
        */
    }
    return self;
}
```
This first line `self = [super init]` captures into the `self` keyword a default initialization of an instance of the current class's "super class" (or "parent class")—the class from which the current class inherits. Inheritance will be discussed in a later topic. For now, understand that **only the designated initializer should call the superclass.**

The `if (self) {...}` statement is a convention that came about in order to protect against crashes from improper initializations of the super class. Thanks to ARC (Automatic Reference Counting), this is now an uncommon occurrence, but the practice is widely regarded as a necessary convention.

Within the `if (self) {...}` statement, each instance variable is set to the associated argument that was passed into the method call:

```objc
        //    ivar        argument
        _propertyName = propertyName;
```

The `return self` line satisfies the `instancetype` return of the initializer method since it returns the newly created instance of the class.

So, the implementation for the designated initializer on the `FISWarship` class should look like this:

```objc
// FISWarship.m

#import "FISWarship.h"

@implementation FISWarship

- (instancetype)initWithShipName:(NSString *)shipName
             currentSpeedInKnots:(NSUInteger)currentSpeedInKnots
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots {
    self = [super init];
    if (self) {
        _shipName = shipName;
        _currentSpeedInKnots = currentSpeedInKnots;
        _maximumSpeedInKnots = maximumSpeedInKnots;
    }
    return self;
}

@end
```

### Calling the Designated Initializer

Now from elsewhere in our code we can use the designated initializer to return an instance of our class that's already set up:

```objc
FISWarship *ussMissouri = [[FISWarship alloc] initWithShipName:@"USS Missouri"
                                           currentSpeedInKnots:0
                                           maximumSpeedInKnots:33];
    
NSLog(@"Ship's Name: %@", ussMissouri.shipName);
NSLog(@"Current Speed: %lu", ussMissouri.currentSpeedInKnots);
NSLog(@"Maximum Speed: %lu", ussMissouri.maximumSpeedInKnots);
```
This will print:

```
Ship's Name: USS Missouri
Current Speed: 0
Maximum Speed: 33
```

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
