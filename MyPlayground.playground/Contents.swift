//: Playground - noun: a place where people can play

import UIKit

let firstName: [String] = ["Joe", "Tim", "Jim", "Tom", "Mark"]
let lastName: [String] = ["Burgess", "Clem", "Campagno", "O'Malley", "Murray"]
let karma: [Int] = [53, 13, 9, 9, 8]

let lastNameByFirstName: [String: String] = ["Joe":"Burgess", "Tim":"Clem", "Jim":"Campagno", "Tom":"O'Malley", "Mark":"Murray"]
let karmaByName: [String: Int] = ["Joe":53, "Tim":13, "Jim":9, "Tom":9, "Mark":8]

let states: [String] = ["New York", "New Jersey", "Connecticut"]
let capitals: [String] = ["New York", "Trenton", "Hartford"]

let capitalsByState: [String: String] = ["New York":"New York", "New Jersey":"Trenton", "Connecticut":"Hartford"]

if let hartford = capitalsByState["Connecticut"] {
    print(hartford)
}

let anyArray: AnyObject = [1, 2, 3]
let anyArrayMirror = Mirror(reflecting: anyArray)
print(anyArrayMirror.subjectType)
anyArray.dynamicType



let intArray: [Int] = [1, 2, 3]
let intArrayMirror = Mirror(reflecting: intArray)
print(intArrayMirror.subjectType)



let primes: [Int] = [1, 2, 3, 5, 7, 11]
let sqrts: [Double] = [1, 1.414, 1.732, 2.236, 2.646, 3.317]

var primeSqrts: [Int: Double] = [1:1, 2:1.414, 3:1.732, 5:2.236, 7:2.646, 11:3.317]

print(primeSqrts[3]!)


primeSqrts.first
let tuple = primeSqrts.popFirst()
print(tuple!)

let index = primeSqrts.indexForKey(1)
print(index)





let speakers = ["Anita Borg", "Alan Kay", "Ada Lovelace", "Aaron Swartz", "Alan Turing", "Michael Faraday", "Grace Hopper", "Charles Babbage"]



let roomsBySpeaker: [String: Int] = ["Anita Borg":201, "Alan Kay":202, "Ada Lovelace":203, "Aaron Swartz":215, "Alan Turing":204, "Michael Faraday":205, "Grace Hopper":230, "Charles Babbage":260]



let capacitiesForRooms: [Int: Int] = [201:40, 202:50, 203:70, 215:30, 204:30, 205:20, 230:80, 260:60]


func roomAssignmentsForSpeakers(speakers: [String]) -> [String] {
    var roomAssignments = [String]()
    
    for speaker in speakers {
        if let room = roomsBySpeaker[speaker] {
            let roomAssignment = "\(speaker) will be speaking in Room \(room)."
            roomAssignments.append(roomAssignment)
        }
    }
    
    return roomAssignments
}


func audienceMaxSizeForSpeaker(speaker: String) -> Int? {
    if let room = roomsBySpeaker[speaker] {
        if let maxSize = capacitiesForRooms[room] {
            return maxSize
        } else {
            return nil
        }
    } else {
        return nil
    }
}

for speaker in speakers {
    if let maxSize = audienceMaxSizeForSpeaker(speaker) {
        print("\(speaker) can speak to up to \(maxSize) people.")
    } else {
        print("Room information not found.")
    }
}




let allStudents = ["Anita Borg", "Alan Kay", "Ada Lovelace", "Aaron Swartz", "Alan Turing", "Michael Faraday", "Grace Hopper", "Charles Babbage", "Adele Goldberg", "Edsger Dijkstra", "Joan Clarke", "Clarence Ellis", "Margaret Hamilton", "George Boole", "Tim Berners-Lee", "Jean Bartik"]


let iosBatches: [String: [String: Any ]] = [
    "ios-101": [
        "instructors": ["Joe Burgess", "Al Tyus"],
        "students": ["Anita Borg", "Ada Lovelace", "Michael Faraday"],
        "semester": "Spring 2014"
    ],
    "ios-102": [
        "instructors": ["Joe Burgess", "Chris Gonzales"],
        "students" : ["Alan Kay", "Tim Berners-Lee", "Jean Bartik"],
        "semester": "Summer 2014"
    ],
    "ios-103": [
        "instructors": ["Joe Burgess", "Zach Drossman"],
        "students": ["Margaret Hamilton", "George Boole", "Grace Hopper"],
        "semester": "Fall 2014"
    ],
    "ios-104": [
        "instructors": ["Tim Clem", "Jim Camapgno"],
        "students": ["Aaron Swartz", "Joan Clarke", "Charles Babbage"],
        "semester": "Spring 2015"
    ],
    "ios-105": [
        "instructors": ["Tim Clem", "Tom O'Malley"],
        "students": ["Alan Turing", "Edsger Dijkstra", "Clarence Ellis"],
        "semester": "Summer 2015"
    ],
    "ios-106": [
        "instructors": ["Tim Clem", "Mark Murray"],
        "students": ["Grace Hopper"],
        "semester": "Fall 2015"
    ]
]


let mensMarathon = [
    "Stephen Kiprotich": [
        "nation": "Uganda",
        "time": "2:08:01",
        "place": 1
    ],
    "Abel Kirui": [
        "nation": "Kenya",
        "time": "2:08:27",
        "place": 2
    ],
    "Wilson Kipsang Kiprotich": [
        "nation": "Kenya",
        "time": "2:09:37",
        "place": 3
    ],
    "Mebrahtom Keflezighi": [
        "nation": "United States",
        "time": "2:11:06",
        "place": 4
    ],
    "Marilson Dos Santos": [
        "nation": "Brazil",
        "time": "2:11:10",
        "place": 5
    ],
    "Kentaro Nakamoto": [
        "nation": "Japan",
        "time": "2:11:16",
        "place": 6
    ],
    "Cuthbert Nyasango": [
        "nation": "Zimbabwe",
        "time": "2:12:08",
        "notes": "PB",
        "place": 7
    ],
    "Paulo Roberto Paula": [
        "nation": "Brazil",
        "time": "2:12:17",
        "place": 8
    ],
    "Henryk Szost": [
        "nation": "Poland",
        "time": "2:12:28",
        "place": 9
    ],
    "Ruggero Pertile": [
        "nation": "Italy",
        "time": "2:12:45",
        "place": 10
    ],
]

let womensMarathon: [String: [String: Any]] = [
    "Tiki Gelana": [
        "nation": "Ethiopia",
        "time": "2:23:07",
        "notes": "OR"
    ],
    "Priscah Jeptoo": [
        "nation": "Kenya",
        "time": "2:23:12"
    ],
    "Tatyana Petrova Arkhipova": [
        "nation": "Russia",
        "time": "2:23:29",
        "notes": "PB"
    ],
    "Mary Keitany": [
        "nation": "Kenya",
        "time": "2:23:56"
    ],
    "Tetyana Hamera-Shmyrko": [
        "nation": "Ukraine",
        "time": "2:24:32",
        "notes": "NR"
    ],
    "Zhu Xiaolin": [
        "nation": "China",
        "time": "2:24:48"
    ],
    "Jéssica Augusto": [
        "nation": "Portugal",
        "time": "2:25:11"
    ],
    "Valeria Straneo": [
        "nation": "Italy",
        "time": "2:25:27"
    ],
    "Albina Mayorova": [
        "nation": "Russia",
        "time": "2:25:38"
    ],
    "Shalane Flanagan": [
        "nation": "United States",
        "time": "2:25:51"
    ]
]

func secondsForTime(time: String) -> Double {

    let secondsFormatter = NSDateFormatter()
    secondsFormatter.dateFormat = "h:mm:ss"
    
    let tare = secondsFormatter.dateFromString("0:00:00")!
    let timeDate = secondsFormatter.dateFromString(time)!
    let seconds = timeDate.timeIntervalSinceDate(tare)
    
    return seconds
}

for (runner, var info) in womensMarathon {
    if let time = info["time"] as? String {
        let seconds = secondsForTime(time)
        info["seconds"] = seconds
        print("\(runner): \(seconds)")
    }
}

var womens: Array<Dictionary<String, String>> = [
    [   "name": "Valeria Straneo",
        "nation": "Italy",
        "time": "2:25:27"
    ],
    [   "name": "Albina Mayorova",
        "nation": "Russia",
        "time": "2:25:38"
    ],
    [   "name": "Shalane Flanagan",
        "nation": "United States",
        "time": "2:25:51"
    ],
    [   "name": "Tatyana Petrova Arkhipova",
        "nation": "Russia",
        "time": "2:23:29",
        "notes": "PB"
    ],
    [   "name": "Mary Keitany",
        "nation": "Kenya",
        "time": "2:23:56"
    ],
    [   "name": "Tetyana Hamera-Shmyrko",
        "nation": "Ukraine",
        "time": "2:24:32",
        "notes": "NR"
    ],
    [   "name":"Zhu Xiaolin",
        "nation": "China",
        "time": "2:24:48"
    ],
    [   "name": "Jéssica Augusto",
        "nation": "Portugal",
        "time": "2:25:11"
    ],
    [   "name": "Tiki Gelana",
        "nation": "Ethiopia",
        "time": "2:23:07",
        "notes": "OR"
    ],
    [   "name": "Priscah Jeptoo",
        "nation": "Kenya",
        "time": "2:23:12"
    ]
]

for var i = 0; i < womens.count; i++ {
    var runner = womens[i]
    if let time: String = runner["time"] {
        let seconds = secondsForTime(time)
        runner["seconds"] = String(seconds)
    }
    womens[i] = runner
}

womens = womens.sort { $0["seconds"] < $1["seconds"] }


print(womens)

