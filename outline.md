https://github.com/learn-co-curriculum/hackers-and-painters
https://github.com/learn-co-curriculum/how-i-held-my-breath-for-17-minutes
https://github.com/learn-co-curriculum/how-language-changes-the-brain

? create moving "pardon our stardust" reading ?

01 (digits) = existing lesson
rr = proposed reading on objective-c
ll = proposed lab
CA/ca = code-along
gg = proposed reference guide
xx = proposed xcode reading
SP = existing Spec lab
// = non-language programming skill (i.e. commenting, referencing)

02 Objective-C Basics
  01 Objective-C Fundamentals
    01 Xcode: Just Enough  
        add discussion of warnings, errors, and test failures?
    02 CA: Your First NSLog
    rr NSLog & String Literal
        some students are confusing NSLog syntax for string interpolation methods, need to discuss () vs [] vs {}
    ll CA: Interpolation Practice
        like: https://github.com/learn-co-curriculum/objc-basics
    03 Variables  // discuss commenting too? /* */  (2 issues: discuss naming, add lab)
    ll CA: (naming practice) By Any Other Name
    rr NSInteger
        should introduce integers and math before discussing nsnumber
    ll CA: Simple Math
    04 Calling Methods
    05 NSString
    06 CA: Parrot -- remove NSMutableString until later
    gg fundamentals reference guide
    ll cap: objc-playground ?
  02 Basic Structures
    01 Xcode: An Overview (1 issue: reordered in curriculum since rewrite)
    rr BOOL with quiz ?
    02 Conditionals       (2 issues: introduce problem, add boolean quiz)
    03 CA: Speaking Grandma
    04 The for Loop       (2 issues: needs lab, introduce problem)
    ll CA: (looping) FizzBuzz ?
    05 NSArray            (1 issues: needs lab)
        remove NSMutableArray until later, teach arrayByAddingObject: for now
    06 CA: WWDC Badges    (2 issues: make code-along, first time iterating over arrays)
    07 NSNumber vs NSInteger
    ll CA: (nsnumber practice)
    08 Creating Methods   (2 issues: rewrite example to use FISAppDelegate class, needs short lab)
    ll CA: (creating methods) palindrome detector ?
    09 Using Tests        (2 issues: needs short lab, too advanced)
    10 WWDC Badges Methods
    gg basic structure reference guide
    11 Cap: Deli Counter  (2 issues: needs more explicit instructions, needs more previous labs)
  03 Scope & Mutables
    rr ? Xcode: Common error messages ?
    rr NSMutableArray
    ll fibo finder https://github.com/learn-co-curriculum/ios-fibo-finder
    01 NSMutableString
    ll string practice https://github.com/learn-co-curriculum/ios-collections-and-strings-problems
    01 Scope
    02 Practice With Scope
    03 Xcode: Debugging
    04 Cartoon Collections (1 issues: debugging reminder)
    gg scope & mutables reference guide
  04 Collections
    01 More Loop Types
    02 CA: WhileyCoyote
    03 NSDictionary
    ll reading dictionary : https://github.com/learn-co-curriculum/solving-trivia
    04 Dictionary Ice Cream
    05 Nested Data Structures  (1 issue: needs use cases simple lab)
    ll ca: hashketball?
    07 Apples & Holidays : without Apples section, just nested collection practice (1 issue: split into two labs)
    08 NSPredicate             (1 issue: long/needs quiz or lab)
    ll nspredicate practice: ? https://github.com/learn-co-curriculum/ios-collections-vol-2/
    09 NSSortDescriptor        (1 issue: needs quiz or short lab)
    ll sorting practice
    10 Collections Review      (1 issue: fix a test)
    gg collections reference guide
    11 Cap: Location Trivia Dictionaries

03 Objects in Objetive-C
  01 Object Basics
    01 RR Intro to Object Orientation
    02 RR Class vs Instance
    03 CA Classy Methods
    04 RR Property Basics
    05 SP Holiday Properties 
    06 RR Creating A Custom Class
    07 SP iOShoppingCart        (1 issue: nssortdescriptor requires @selector)
    xx ? xcode lesson ? pbxproj ? config files ?
    08 RR Property Visibility
    09 SP FISSentence
    10 RR Writing Initializers
    11 SP Object Oriented People
    gg object basics reference guide
    12 Cap: Location Trivia - Objects
  02 Selectors
    rr @selector
    ll selector practice
    rr compare?
    ll ca: sort descriptor with caseinsensitivecompare
    xx ? xcode: interpreting the stack track ?
    01 Extensions/Categories
    02 Category Math? ew
    rr NSDate
    ll CA: Epicly Epoch ? Epochalypse ?
    rr NSDateFormatter
    ll NSDate+Formats
    // commenting methods with @param etc ?
    ...
    gg extensions reference guide
  03 Inheritance
    01 Intro to Inheritance
    rr Creating a Subclass
    02 OO-Vehicle
    rr Overriding Inherited Methods
    03 OOP-Cards-Model
    rr Casting
    04 PetCast
    // how to read the apple docs
    xcode: quick links to docs
    // how to read Stack Overflow
    // how to reference tech blogs
    ...
    ll inheritance review
    gg inheritance reference guide
    05 Cap: Objc-Black-Jack




    


    
