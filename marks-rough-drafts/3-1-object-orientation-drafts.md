## The `readonly` & `readwrite` Property Options

For information that needs to be publicly visible, but still under the jurisdiction of the owning class to overwrite or change, the `readonly` and `readwrite` property options can be used.

The `readonly` property option does just that: it makes the property unwritable, or "read only". It accomplishes this by creating the property *without* an associated "setter" method.

To create a read-only property, the `readonly` property option must be added to the public declaration of the property. Since there is no setter method generated, in order to write to the property within the class that owns, the property must be *redeclared* in the private `@interface` section as a `readwrite` property that generates a setter with private visibility.

Since the frequency window in the car radio that we're modeling with the `FISRadio` class is readable but only interactive through the "tuning" dial, it makes sense to express the `amFrequency` and `fmFrequency` properties as `readonly`. We can then provide public methods that privately write to the `readonly` properties in a manner that we can control from within the owning class:

```objc
//  FISRadio.h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>   // imports CGFloat

@interface FISRadio : NSObject

@property (nonatomic, readonly) CGFloat amFrequency;
@property (nonatomic, readonly) CGFloat fmFrequency;

{...}

- (void)defaultFrequencies;
- (void)increaseFrequencies;
- (void)decreaseFrequencies;

@end
```

```objc
//  FISRadio.m

#import "FISRadio.h"

@interface FISRadio ()

@property (nonatomic, readwrite) CGFloat amFrequency;
@property (nonatomic, readwrite) CGFloat fmFrequency;

{...}

@end

@implementation

- (void)defaultFrequencies {
    self.amFrequency = 150.0;
    self.fmFrequency = 91.0;
}

- (void)increaseFrequencies {
    if (self.amFrequency + 0.5 <= 160.0) {
        self.amFrequency += 0.5;
        self.fmFrequency += 0.1;
    }
}

- (void)decreaseFrequencies {
    if (self.amFrequency - 0.5 >= 53.0) {
        self.amFrequency -= 0.5;
        self.fmFrequency -= 0.1;
    }
}

@end
```

**Note:** *The* `readwrite` *keyword in the private redeclaration of  the property isn't strictly necessary since it is the implicitly default, however it is considered a best practice to indicate that the property's public visibility is meant to be* `readonly`.

We can then call these methods from outside the `FISRadio` class to "turn the dial". While we can't *write* to the `amFrequency` and `fmFrequency` methods, we can *view* them:

```objc
//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISRadio.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISRadio *radio = [[FISRadio alloc] init];
    [radio defaultFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    
    [radio increaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    
    [radio decreaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    
    [radio decreaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
          
    return YES;
}

@end
```
This will print:

```
AM: 150.0, FM: 91.0
AM: 150.5, FM: 91.1
AM: 150.0, FM: 91.0
AM: 149.5, FM: 90.9
```
We have successfully privatized the setter for our frequency properties and provided public methods to provide protected access their values.








# Writing Initializers

## Objectives

## Initializer Methods

We've discussed the use cases of the `alloc` and `init` method pairs in the past, but what are these methods actually doing? The `alloc` method is a class method that *allocates* a place in memory (RAM) to hold the instance variables that comprise an object of the given class. The `init` method is what actually populates that portion of memory with the relevant structure.

We can compare these two roles to phases of constructing a building: the `alloc` method is like selecting the ground that will be the building's lot, designating and preparing the place for it go; it's the `init` method that actually builds the structure detailed in the architect's blueprint.

The `init` method is actually just the basic initializer, called the "default initializer", but an initializer is any method that returns an `instancetype` (and the compiler will require that the method name to begins with `init...`). 

## Designated Initializers

NSDictionary `initWithObjects:forKeys:count:`

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