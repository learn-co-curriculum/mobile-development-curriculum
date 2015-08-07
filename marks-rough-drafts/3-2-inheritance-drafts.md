

## Avoid Circular Dependencies (`#import` Loops)

It's best practice to get into the habit of only `#import`ing custom class headers within implementation (`.m`) files. In a rare case where you have to custom classes that hold each other as a property, placing the `#import`s in the header files will create what's called a "circular dependency".

Imagine that we have another custom class called `FISCaptain` that holds some information about the captain of our ship:

```objc
// FISCaptain.h

#import <Foundation/Foundation.h>

@interface FISCaptain : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *rank;
@property (nonatomic) NSUInteger age;

@end
```

If we want to add a `FISCaptain` property to the `FISWarship` class to keep track who the ships captain is, then couldn't we import `FISCaptain.h` in `FISWarship.h`? That works, but then what if we also want to add a property of a `FISWarship` class to `FISCaptain` in order to keep track of which ship the captain commands? If we now import `FISWarship.h` into `FISCaptain.h`, we'll have just created an `#import` loop:

```objc
// bad example

// FISWarship.h

#import <Foundation/Foundation.h>
#import "FISCaptain.h"

@interface FISWarship : NSObject

@property (strong, nonatomic) NSString *shipName;
@property (nonatomic) NSUInteger currentSpeedInKnots;
@property (nonatomic) NSUInteger maximumSpeedInKnots;

@property (strong, nonatomic) FISCaptain *captain;

- (void)fullSpeedAhead;
- (void)fullStop;

@end
```

```objc
// bad example

// FISCaptain.h

#import <Foundation/Foundation.h>
#import "FISWarship.h"

@interface FISCaptain : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *rank;
@property (nonatomic) NSUInteger age;

@property (strong, nonatomic) FISWarship *ship;

@end
```
Everything looks like smooth sailing until we try to run the program, at which point we'll get a build error about the very class that we *definitely* just `#import`ed not being visible:

![](https://curriculum-content.s3.amazonaws.com/ios/ios-intro-to-objects-unit/import_loop_FISWarship.png)
![](https://curriculum-content.s3.amazonaws.com/ios/ios-intro-to-objects-unit/import_loop_FISCaptain.png)
—*Oh Xcode, why can't you just tell us plainly when it's an* `#import` *loop?*

This is why, when adding a custom class as a property, it's best practice to *always* use `@class` ("at-class") to make a **forward class declaration** and only `#import` header files for custom classes into implementation (`.m`) files.

### Forward Class Declarations (`@class`)

In order to avoid writing a circular dependency (a.k.a. `#import` loop), Objective-C provides for us the fancy tool `@class` ("at-class") which is used to make forward class declarations. A forward class declaration does nothing to actually import details *about* that class in the header (`.h`) file—but then, header files don't actually *need* any of that knowledge. Header files are essentially just a table of contents for what a class has and can do; it's the *implementation* (`.m`) files that need to know about the properties and methods of the class being imported in order to detail how its own methods should be performed step-by-step.

The `@class` keyword allows us to tell the compiler that our the current class's implementation file *will be* given knowledge of this other class's header file. It's like saying, "trust us on this so that you don't run yourself in circles." Because, otherwise, it actually does run itself in circles.

![](https://curriculum-content.s3.amazonaws.com/ios/ios-intro-to-objects-unit/dog_chases_tail.gif)  
—*Far more adorable than* `#import` *loops.*

Forward class declarations using `@class` are placed *before* the `@interface` section in the header file. It's standard practice to list them below the `#import` statements for libraries (frameworks). It's safe to `#import` libraries because by their nature, libraries do not require any knowledge of your custom classes in order to function; this makes circular dependencies between frameworks theoretically impossible.

Using `@class` to make forward class declarations of our `FISCaptain` and `FISWarship` classes would like this:

```objc
// FISWarship.h

#import <Foundation/Foundation.h>

@class FISCaptain;       // forward class declaration

@interface FISWarship : NSObject

@property (strong, nonatomic) NSString *shipName;
@property (nonatomic) NSUInteger currentSpeedInKnots;
@property (nonatomic) NSUInteger maximumSpeedInKnots;

@property (strong, nonatomic) FISCaptain *captain;

- (void)fullSpeedAhead;
- (void)fullStop;

@end
```

```objc
// FISWarship.m

#import "FISWarship.h"
#import "FISCaptain.h"   // import into .m file

@implementation FISWarship

- (void)fullSpeedAhead {
    self.currentSpeedInKnots = self.maximumSpeedInKnots;
    NSLog(@"Full speed ahead, aye!");
}

- (void)fullStop {
    self.currentSpeedInKnots = 0;
    NSLog(@"Full stop, aye!");
}

@end
```

```objc
// FISCaptain.h

#import <Foundation/Foundation.h>

@class FISWarship;     // forward class declaration

@interface FISCaptain : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *rank;
@property (nonatomic) NSUInteger age;

@property (strong, nonatomic) FISWarship *ship;

@end
```

```objc
// FISCaptain.m

#import "FISCaptain.h"
#import "FISWarship.h"  // import into .m file

@implementation FISCaptain

@end
```

**Top-tip:** *Did you notice the that we immediately added* `#import` *to the implementation file? That's a good habit to get into.*

Now that we've eliminated the circular dependency, we can clean the build using `shift` `⌘` `K`, and then run our program in a successful build.
