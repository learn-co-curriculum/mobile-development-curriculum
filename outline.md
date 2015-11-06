https://github.com/learn-co-curriculum/hackers-and-painters
https://github.com/learn-co-curriculum/how-i-held-my-breath-for-17-minutes
https://github.com/learn-co-curriculum/how-language-changes-the-brain

https://github.com/learn-co-curriculum/ios-collections-and-strings-problems

01 Getting Started
  01 Intro Command Line and BASh
    01 Intro to the Shell
    02 First Terminal
    03 BASH Terminal
    04 CLI Basics
  02 Verifying Your Environment
    01 Environment Setup Summary
  03 Git and Github
    01 Version Control 101
    02 Enough Git For Learn
    03 Quiz: Git Basics
    04 Your First Lab 


-- engineering: create a "beta" tag for readings & labs

01 (digits) = existing lesson
rr = proposed reading on objective-c
qz = quiz
rg = proposed reference guide
xc = proposed xcode reading/walkthrough
CA/ca = code-along
ll = proposed lab


02 Objective-C Basics
  01 Objective-C Fundamentals
    01 Xcode: Just Enough 
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
    01 Xcode: An Overview (1 issue: reordered in curriculum since rewrite) ? talk about preferences/font settings, alcatraz ?
    02 Boolean Quiz
    03 Conditionals
    04 CA: Speaking Grandma
    05 The for Loop       (1 issue: introduce problem)
    06 CA: FizzBuzz
    07 NSArray & NSMutableArray (1 issue: needs lab)
      nice: ll array practice
      nice: rg structures reference
    08 WWDC Badges
new unit: Methods & Tests
    09 Creating Methods   (1 issue: rewrite example to use FISAppDelegate class)
    10 CA: Palindrome Detector
    12 Using Tests        (1 issue: too advanced)
    13 Palindrome Tester
    11 NSMutableString
      nice: ll ca NSMutableString
    14 WWDC Badges Methods
      nice: rg methods & tests
    15 Deli Counter

  03 Scope & Debugging
    xc xcode: foundation methods
    01 Scope
    02 Practice With Scope
    03 NSNumber
    04 Fibonacci Finder
    05 Xcode: Debugging
    06 Cartoon Collections (1 issues: debugging reminder)
move 01 More Loop Types
move 02 CA: WhileyCoyote
    ? return break continue ?

  04 Collections
    03 NSDictionary
    04 Dictionary Ice Cream
    05 Nested Data Structures  (1 issue: needs use cases simple lab)
    07 Apples & Holidays : without Apples section, just nested collection practice (2 issues: split into two labs, void methods)
    09 NSSortDescriptor        (1 issue: needs quiz or short lab)
    ll sorting practice: hashketball?
    08 NSPredicate             (1 issue: long/needs quiz or lab)
    ll nspredicate practice: ? https://github.com/learn-co-curriculum/ios-collections-vol-2/
    10 Collections Review
    11 Location Trivia - Dictionaries

? add tutorial about workflows? Spectacle, Dash, Alfred, iTerm, Crashplan, SuperDuper! ?


03 Objects in Objetive-C
  01 Object Basics
    01 Intro to Object Orientation
    02 Class vs Instance
    03 CA: Classy Methods
    04 Property Basics
    05 Holiday Properties 
    06 Creating A Custom Class
    07 iOShoppingCart
      xc ? pbxproj ? config files ?
    08 RR Property Visibility
    09 SP FISSentence
    10 RR Writing Initializers
    11 SP Object Oriented People
      xc ? apple docs properties ?
    12 Cap: Location Trivia - Objects

  02 Inheritance
    01 Intro to Inheritance
    rr Creating a Subclass
    02 OO-Vehicle
    rr Overriding Inherited Methods
    03 OOP-Cards-Model
    04 Casting
    05 PetCast
    06 Categories
    07 Category Math (ew)
    08 Cap: Objc-Black-Jack


04 Basic Views
  01 Actions And Outlets
    01 Basics (OOP Cards Simple Views)
    02 Passing Data Between VCs (This Button is Epoch)
    03 Getting More Comfortable (Objc Blackjack Views)
    04 More Practice (Jukebox Views)
    05 ADV: Understanding Frames (OOP Cards Views)

  02 Segues & Nav Controllers
    01 Xcode: Simulated Metric Size
    codealong Gorge of Eternal Perils = Nav Controllers & Segues (terms: show/push)
         drill in modal vs push conceptually. Show segue is adaptive now: makes a best guess, but if in a Nav stack you can force a modal by selecting it
         TODO: Add Tests
         TODO: Actually write the README
    rr Passing Data Forward
    01 Intro (Objc Navigation Controllers)
        clean up for style and Xcode 7
    nice-to-have rr Explain the presentingViewController property
    nice-to-have ll monty python: passing data back (from a modal submit form)
        Lab that uses the presentingViewController
    03 ADV: More Practice ... (Tasks Today)
      why are there TWO segues to the same Detail VC? Also, for an advanced lab it might nice to have more than two VCs, to show how a Nav Controller handles a stack of at least three VCs. Not sure what example case would be good before Table Views, though.

    
objc-blackjack-views

joe's thoughts: the class is supposed to be hard
don't give them the answer on purpose, flounder, "take ambiguity and define it"
less specific directions 
feel the pain ---> learn the lesson once
read the first chapter of The Talent Code, about deep programming
- the way to practice is to get it wrong constantly



Swift for Objective-C Programmers

Syntax reference guide, quizzes

Day 1
Rosetta Stone : syntax differences, single file, etc.
let/var
optionals - not difficult concept, just annoyingly pervasive
generics - not difficult concept, pretty cool but keep it simple

Day 2
subclassing
initializers (are stricter) - enforces use of designated initializer
explicit public private (modules paradigm)
getter setter syntax

Labs: swift-blackjack

Day 3
?? classes vs structs ??
?? enums ??

Day 4
Objc Interoperability, nullability, annotations & generic stuff, bridging header
Swift -> @objc, generated header

Day 5
Review, practice ?





1. Snapfacts
2. Nav/Segue lecture
3. Task list project (tableview)
4. Code challenge : facts TVC, stretch goals: tablview sections, passing data forward


Dan phone call

disappearing text lab, walkthrough lecture
nav/segue mini-lecture
uitableview task list app

Locomotive
type in search query, linked to foursquare, returning "sushi" venues
same concept with Google places API
venue object... take a google places venue & foursquare venue
query both APIs, bring them down
calculate that average of the ones that are shared
brings down Dan's Sushi, brings down Dan's Sushi, average the ratings and display them
MVP solve it for one







    
