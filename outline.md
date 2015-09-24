https://github.com/learn-co-curriculum/hackers-and-painters
https://github.com/learn-co-curriculum/how-i-held-my-breath-for-17-minutes
https://github.com/learn-co-curriculum/how-language-changes-the-brain

https://github.com/learn-co-curriculum/ios-collections-and-strings-problems

Environment setup : separate contents out into own lessons (deprecated feature)
cli resources : delete from track

01 Getting Started
  // copy for web-fundamentals
  01 Intro Command Line and BASh
    01 Intro to the Shell
    02 First Terminal
    03 BASH Terminal
    04 CLI Basics


-- engineering: create a "beta" tag for readings & labs

01 (digits) = existing lesson
rr = proposed reading on objective-c
ll = proposed lab
CA/ca = code-along
gg = proposed reference guide
xc = proposed xcode reading
SP = existing Spec lab
// = non-language programming skill (i.e. commenting, referencing)

02 Objective-C Basics
  01 Basic Objective-C --> Objective-C Fundamentals
    01 Xcode: Just Enough  -
    02 CA: Your First NSLog
    03 NSLog & String Literal
    04 CA: Interpolate
    05 Variable Basics
    06 Xcode: Warnings and Errors
    07 Primitives & Operators
    08 CA: Simple Math
    09 Calling Methods
    10 NSString
    11 CA: Parrot
    12 RG: objc-fundamentals

  02 Basic Structures
    01 Xcode: An Overview (1 issue: reordered in curriculum since rewrite)
    02 Boolean Quiz
    03 Conditionals
    04 CA: Speaking Grandma
    05 The for Loop       (1 issue: introduce problem)
    06 CA: FizzBuzz
    07 NSArray & NSMutableArray (1 issue: needs lab)
    08 WWDC Badges
    09 Creating Methods   (1 issue: rewrite example to use FISAppDelegate class)
    10 CA: Palindrome Detector
    12 Using Tests        (1 issue: too advanced)
    13 Palindrome Tester
    11 NSMutableString
     not now: ll ca NSMutableString
    14 WWDC Badges Methods
    gg basic structure reference guide
    15 Deli Counter

  03 Scope & Debugging
    xc Xcode: Apple Docs-Foundation Methods
    01 Scope
    02 Practice With Scope
    03 NSNumber
    04 Fibonacci Finder
    05 Xcode: Debugging
    06 Cartoon Collections (1 issues: debugging reminder)

  04 Collections
    01 More Loop Types
    02 CA: WhileyCoyote
    03 NSDictionary
    ll reading a dictionary : https://github.com/learn-co-curriculum/solving-trivia
    04 Dictionary Ice Cream
    05 Nested Data Structures  (1 issue: needs use cases simple lab)
    ll ca: hashketball?
    07 Apples & Holidays : without Apples section, just nested collection practice (2 issues: split into two labs, void methods)
    09 NSSortDescriptor        (1 issue: needs quiz or short lab)
    ll sorting practice
    08 NSPredicate             (1 issue: long/needs quiz or lab)
    ll nspredicate practice: ? https://github.com/learn-co-curriculum/ios-collections-vol-2/
    10 Collections Review
    11 Location Trivia - Dictionariesxcocd 


03 Objects in Objetive-C
  01 Object Basics
    01 RR Intro to Object Orientation
    02 RR Class vs Instance
    03 CA Classy Methods
    04 RR Property Basics
    05 SP Holiday Properties 
    06 RR Creating A Custom Class
    07 SP iOShoppingCart
    xc ? xcode lesson ? pbxproj ? config files ?
    08 RR Property Visibility
    09 SP FISSentence
    10 RR Writing Initializers
    11 SP Object Oriented People
    xc xcode: reference properties≠
    12 Cap: Location Trivia - Objects

  02 Selectors
    rr @selector
    ll selector practice
    rr comparisons
    ll ca: nssortdescriptor with caseinsensitivecompare ?
    xc ? xcode: interpreting the stack trace ?
    01 Extensions/Categories
    02 Category Math? ew
    rr NSDate
    ll CA: Epicly Epoch ? Epochalypse ?
    rr NSDateFormatter
    ll NSDate+Formats
    // commenting methods with @param etc ?
    ...
    gg extensions reference guide (+ previous RGs)

  03 Inheritance
    01 Intro to Inheritance
    rr Creating a Subclass
    02 OO-Vehicle
    rr Overriding Inherited Methods
    03 OOP-Cards-Model
    rr Casting & id
    04 PetCast
    // how to read the apple docs
    xc xcode: quick links to docs
    // how to read Stack Overflow
    // how to reference tech blogs
    ...
    ll inheritance review
    gg inheritance reference guide (+ previous RGs)
    05 Cap: Objc-Black-Jack


04 Basic Views
  01 Actions And Outlets
    01 Basics (OOP Cards Simple Views)
    02 Passing Data Between VCs (This Button is Epoch)
    03 Getting More Comfortable (Objc Blackjack Views)
    04 More Practice (Jukebox Views)
    05 ADV: Understanding Frames (OOP Cards Views)
  02 Segues & Nav Controllers
    01 Xcode: Simulated Metric Size
    rr multiple VCs and Modal Segues  ?Wed?
    ll modal based lab                ? Wed?
    rr Nav Controllers & Show Segues (terms: show/push)
         drill in modal vs push conceptually. Show segue is adaptive now: makes a best guess, but if in a Nav stack you can force a modal by selecting it
    01 Intro (Objc Navigation Controllers)
        clean up to remove passing data forward: JUST Nav Controller & Segues (both kinds to show distinction)
    rr Passing Data Forward
    ll simple lab, passing data forward
    03 ADV: More Practice ... (Tasks Today)
      why are there TWO segues to the same Detail VC? Also, for an advanced lab it might nice to have more than two VCs, to show how a Nav Controller handles a stack of at least three VCs. Not sure what example case would be good before Table Views, though.

    


    
