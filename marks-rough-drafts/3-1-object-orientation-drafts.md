# Writing Initializers

## Objectives

1. Recognize when initializers are useful, especially with read-only properties.
2. Identify the role of a designated initializer.
3. Compose a designated initializer.
4. Override the default initializer (`init`) to call a designated initializer.
5. Compose convenience initializers that call a designated initializer.

## Initializer Methods

We've discussed the use cases of the `alloc` and `init` method pairs in the past, but what are these methods actually doing? The `alloc` method is a class method that *allocates* a place in memory (RAM) to hold the instance variables that comprise an object of the given class. The `init` method is what actually populates that portion of memory with the relevant structure. Other initializers can be written which actually populate the structure with information (values) right from the start.

We can compare these two roles to the phases of constructing a building: the `alloc` method is like selecting the ground that will be the building's lot, designating and preparing the place for it to go. The `init` method, however, is the phase of actually building the structure that's detailed in the architect's blueprint.

The `init` method is actually just the basic initializer, called the "default initializer", but an initializer is any method that returns an `instancetype` and the compiler will require that the method name begins with `init...`. Methods from the `init` family can be set up to offer varying levels of pre-fabricated setup. 

These "convenience initializers" and "designated initializers" can be seen like asking the construction firm to paint the house something other than white, or even to find an interior designer to provide furniture and to hang art on the walls. In such a case, the house is further along to becoming an actual home instead of just an empty free-standing structure that serves as the most basic form of a house.

#### Initializing Read-Only Values

Initializers are necessary for setting up read-only properties that cannot be written to from outside the class, such as in the case of creating an instance of `NSSortDescriptor`:

```objc
// incorrect: assigning to read-only properties

NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] init];
sortByNameAsc.key = @"name";
sortByNameAsc.ascending = YES;
```

![](https://curriculum-content.s3.amazonaws.com/ios-intro-to-objects-unit/readonly_error.png)

The initializer allows a user of that class to provide an initial value for those read-only properties upon creating an instance:

```objc
// correct: using an initializer to give the properties initial values

NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                              ascending:YES];
```

![](https://curriculum-content.s3.amazonaws.com/ios-intro-to-objects-unit/readonly_init.png)

The usefulness of providing an initializer allows the user of the class to be assured that the instance will be set up holistically enough to perform its methods without unexpected behavior. It also allows us, the developer, to document the set up for the class.

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

The role of a designated initializer is that it returns an instance of the given class (`NSMutableArray` in this case) that's considered prepared enough for actual use. We could get to this state manually by using the default initializer `init` and then calling the `addObjectsFromArray:` method to insert the list of objects into the array:

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
It's likely that the `init` method actually calls the `initWithObjects:` method but with an empty list of objects to be added. At some point, a designated initializer **must** be called when creating a new instance; other initializers that are not defined as designated initializers **must** pass through a designated initializer. This is a way that the compiler helps to ensure that the instance will be functional at run time.

**Note:** *While this is not strictly enforced by Objective-C itself, it is considered best practice—especially when writing Objective-C that will interface with anything written Swift which does hold strict rules about designated initializers.*

### Declaring the Designated Initializer

Since initializers *must* be public methods, they need to be declared in the `.h` header file. The rules for `init` family methods that are enforced by Apple via the compiler are that it:

  * must be an instance method (`-`),
  * must return an `instancetype`, and
  * must begin with the word `init`.

```objc
- (instancetype)init...;
```
When writing any initializer that is not the default initializer `init`, it is common practice to continue the method name with the word `With` followed by an argument for every property into which the initializer is expected to pass a value. As convention, the arguments in the method declaration are typically named after the property to which it is intended to be assigned.

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

In the `.m` implementation file for the class, utilize autocomplete by typing the instance method indicator (`-`) followed by the first few letters of the method name. In the case of non-default initializers this will be `initWith...`. Select the appropriate method if there is more than one option and open the curly braces `{` `}` that contain the implementation code.

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
This first line `self = [super init]` captures into the `self` keyword a default initialization of an instance of the current class's "super class" (or "parent class")—the class from which the current class inherits. Inheritance will be discussed in a later topic. For now, understand that **only a designated initializer should call the superclass.**

The `if (self) {...}` statement is a convention that came about in order to protect against crashes from improper initializations of the super class. Thanks to ARC (Automatic Reference Counting), this is now an uncommon occurrence, but the practice is widely regarded as a necessary convention and should be included.

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

Every class in Objective-C has a public default initializer method (`init`) that can be overridden. The purpose of doing so is to make sure that any time an instance of that class is created with default initializer, that an appropriate designated initializer is called.

**Advanced:** *The* `init` *method is inherited from* `NSObject` *which is the highest class in the inheritance tree. Inheritance will be discussed in the next unit.*

### Declaring the Default Initializer

Because the default initializer is already publicly available, it's actually not *necessary* to publicly declare the default initializer in the `.h` header file when overriding it. However, it is considered best practice to do so as a sign to other developers that default initializer *has* been overridden, and it's best to organize it as the first method listed in the initializer group. In the context of our `FISWarship` class, this would look like this:

```obj
// FISWarship.h

#import <Foundation/Foundation.h>

@interface FISWarship : NSObject

@property (strong, nonatomic) NSString *shipName;
@property (nonatomic) NSUInteger currentSpeedInKnots;
@property (nonatomic) NSUInteger maximumSpeedInKnots;

- (instancetype)init;
- (instancetype)initWithShipName:(NSString *)shipName
             currentSpeedInKnots:(NSUInteger)currentSpeedInKnots
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots;

@end
```

### Defining the Default Initializer

When implementing an override of the default initializer, it's best to have it call a designated initializer that was set up otherwise, providing arguments to set properties to *default* values. 

```objc
// default initializer override syntax, preferred style

- (instancetype)init {
    self = [self initWith...];
    return self;
}
```

Because the designated initializer is a method on the current class, we use the `self` keyword as the recipient of the designated initializer method call and **not** the `super` keyword. We can then capture the return of the designated initialer method into the `self` keyword and then return `self`. 

It may occur to you that it's entirely valid to simply return the designated initializer's return without assigning it to the `self` keyword. Following the convention above is simply a style choice that we've decided upon for this course.

```objc
// unpreferred but valid style

- (instancetype)init {
    return [self initWith...];
}
```
The implementation of overriding the default initializer on our `FISWarship` class might look this:

```objc
// FISWarship.m

- (instancetype)init {
    self = [self initWithShipName:@""
              currentSpeedInKnots:0
              maximumSpeedInKnots:0];
    return self;
}
```
This makes sure that none of these properties are initialized to `nil` when a user of the `FISWarship` class calls the default initializer. This can help with debugging when a testing since, for instance, a string property that holds an empty string is much easier to troubleshoot than a string property that holds `nil`.

**Note:** *This is particularly useful for mutable collection properties such as* `NSMutableArray` *and* `NSMutableDictionary` *to ensure that they are set up to receive method calls to add or remove objects.*

We could also define the default initializer to set up an instance populated with non-zero information as well:

```objc
// FISWarship.m

- (instancetype)init {
    self = [self initWithShipName:@"Mary Celeste"
              currentSpeedInKnots:0
              maximumSpeedInKnots:20];
    return self;
}
```
This will cause every instance of our `FISWarship` class created with the default initializer to be returned with the `shipName` set to `Mary Celeste` and the `maximumSpeedInKnots` property set to `20`:

```objc
FISWarship *ship = [[FISWarship alloc] init];
FISWarship *boat = [[FISWarship alloc] init];

NSLog(@"%@ - Max: %lu", ship.shipName, ship.maximumSpeedInKnots);
NSLog(@"%@ - Max: %lu", boat.shipName, boat.maximumSpeedInKnots);
```
This will print:

```
Mary Celeste - Max: 20
Mary Celeste - Max: 20
```

## Convenience Initializers

In between the designated initializers (which provides the *most* coverage) and the default initializer (which provides *basic* coverage) exists the realm of "convenience initializers". Convenience initializers are, well, written for convenience. They provide an interface to the user of the class to set up an instance of it with *some*, but not *all*, of its potential options as customizable.

Take, for example, `NSSortDescriptor`'s `initWithKey:ascending:` method. Apple's Documentation on this method explains that it initializes the instance with the default comparison selector (`compare:`). We can infer that it's internally calling the `initWithKey:ascending:selector:` initializer, handing off the two arguments for `key` and `ascending`, and passing in `@selector(compare:)` into the `selector` argument:

```objc
// inferred implementation in NSSortDescriptor.m

- (instancetype)initWithKey:(NSString *)keyPath 
                  ascending:(BOOL)ascending {
                  
    self = [self initWithKey:keyPath                // passes in the keyPath argument
                   ascending:ascending              // passes in the ascending argument
                    selector:@selector(compare:)];  // passes in a default value for the selector property
    return self;
}
```
By doing this, the write of the `NSSortDescriptor` class has provided a means of creating a useful instance of that class without requiring knowledge or understanding of the `@selector(compare:)` argument that's necessary for the instance to operate. Convenience initializers, in a way, are like training wheels on a bicycle; they permit a limited and *safe* use of an object's full power to someone who isn't fully proficient at using it in it's true complexity.

### Writing a Convenience Initializer

Composing a convenience initializer is similar to overriding a default initializer: it should assign to `self` a call on `self` of a designated initializer OR another more complex convenience initializer which leads to a designated initializer.

In the case of our `FISWarship` class, we can create a convenience initializer that allows the user to submit values only for the `shipName` property or the `maximumSpeedInKnots` property: 

```objc
// FISWarship.h

- (instancetype)initWithShipName:(NSString *)shipName
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots;
```

```objc
// FISWarship.m

- (instancetype)initWithShipName:(NSString *)shipName
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots {
    
    self = [self initWithShipName:shipName               // passes in the shipName argument
              currentSpeedInKnots:0                      // passes in a default value for the property
              maximumSpeedInKnots:maximumSpeedInKnots];  // passes in the maximumSpeedInKnots argument
    return self;
}
```

We can also create an even simpler convenience initializer that allows the user to submit a value only for the `shipName` property. In order to avoid repeating our default value that we set up in `initWithShipName:maximumSpeedInKnots:`, we can actually call *that* initializer within our new `initWithShipName:` convenience initializer.

```objc
// FISWarship.h

- (instancetype)initWithShipName:(NSString *)shipName;
```

```objc
// FISWarship.m

- (instancetype)initWithShipName:(NSString *)shipName {
    
    self = [self initWithShipName:shipName  // passes in the shipName argument
              maximumSpeedInKnots:20];      // passes in a default value for the property
    return self;
}
```
This allows us to adhere to the DRY ("don't repeat yourself) mantra.

From outside the class, a user can call these convenience initializers and receive a functional instance while only providing partial information:

```objc
    FISWarship *ussNewJersey = [[FISWarship alloc] initWithShipName:@"USS New Jersey"];
    FISWarship *ussWisconsin = [[FISWarship alloc] initWithShipName:@"USS Wisconsin"
                                                maximumSpeedInKnots:33];
    
    NSLog(@"%@ - Speed: %lu - Max: %lu", ussNewJersey.shipName, ussNewJersey.currentSpeedInKnots, ussNewJersey.maximumSpeedInKnots);
    NSLog(@"%@ - Speed: %lu - Max: %lu", ussWisconsin.shipName, ussWisconsin.currentSpeedInKnots, ussWisconsin.maximumSpeedInKnots);
``` 
This will print:

```
USS New Jersey - Speed: 0 - Max: 20
USS Wisconsin - Speed: 0 - Max: 33
```