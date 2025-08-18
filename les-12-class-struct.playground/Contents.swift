import Foundation

// MARK: Синтаксис
class Person {
    
    nonisolated(unsafe) static var sount = 0
    
    private var secret: String
    
    let name: String
    let surname: String

    var age: Int
    var isFunny: Bool
    
    init(name: String, surname: String, age: Int, isFunny: Bool, secret: String) {
        Person.sount += 1
        
        self.name = name
        self.surname = surname
        self.age = age
        self.isFunny = isFunny
        self.secret = secret
    }
    
    func sayHello() {
        print("Hello, my name is \(name) \(surname)")
    }
    
    func saySecret() {
        print(secret)
    }
    
}

// MARK: Экземпляры класса
print(Person.sount)

let personOleg = Person(name: "Oleg", surname: "Dmitriev", age: 34, isFunny: true, secret: "secret 01")
print(personOleg.name)
personOleg.sayHello()
personOleg.age = 35
personOleg.saySecret()

print(Person.sount)

let personMary = Person(name: "Mary", surname: "Dmitriev", age: 24, isFunny: true, secret: "secret 02")
print(personMary.name)
personOleg.sayHello()

print(Person.sount)


// MARK: Как работает reference type
let person01 = Person(name: "Oleg", surname: "Dmitriev", age: 37, isFunny: true, secret: "secret 01")
let person02 = Person(name: "Mary", surname: "Dmitriev", age: 27, isFunny: true, secret: "secret 02")
let person03 = Person(name: "Kate", surname: "Dmitriev", age: 2, isFunny: true, secret: "secret 03")

Person.sount // 5
personOleg.age
personMary.age

let newKate01 = person03
let newKate02 = newKate01

newKate02.age = 103
newKate02.age // 103
person03.age // 103

Person.sount // 5



// MARK: Экземпляры структуры


// MARK: Как работает value type


// MARK: - Homework Урок 12 Классы (class)
/*
    1) Создай класс, который описывает любой объект
        1.1 Создай в нем переменные, константы, функции, энамы с разными уровнями доступа. Array dictionary set
            1.1.1 Пусть некоторые параметры задаются через init(name: String), какие-то имеют дефолтное значение, какие-то optional :)
            1.1.2 Создай функцию со switch
            1.1.3 Пусть в init() будет хотябы один тип enum (его нужно создать вне class)
        1.2 Создай статическую переменную, которая считает кол-во экземпляров класса (сделай ее приватной).
        1.3 Создать функцию, которая отдает переменную с кол-вом экземпляров и пояснением.

        P.S Пример ДЗ в видео уроке :)
 
    2) Читаем доку: https://swiftbook.org/docs/struktury-i-klassy/
 
    3) Изучаем уровни доступа:
    //https://ios-interview-ru/access-control/#:~:text=Private%20дает%20доступ%20к%20членам,файле%20или%20в%20подклассе%2Fpa.
*/




// MARK: 01

enum YachtColor {
    case red
    case green
    case blue
    case white
}

class Yacht {
    
    nonisolated(unsafe) static var counterYachts: Int = 0
    
    private let ownerCompany: String = "Company: Рога и копыта"
    
    var model: String
    var builder: String
    var year: Int
    var length: Double
    var beam: Double
    var draft: Double
    var displacement: Int
    var cabins: Int
    var berths: Int
    var water: Int
    var fuel: Int
    var thumbnail: String?
    var gallery: [String]?
    var payment: Int
    var color: YachtColor
    
    init(model: String, builder: String, year: Int, length: Double, beam: Double, draft: Double, displacement: Int, cabins: Int,
         berths: Int, water: Int, fuel: Int, thumbnail: String, gallery: [String], payment: Int, color: YachtColor) {
        self.model = model
        self.builder = builder
        self.year = year
        self.length = length
        self.beam = beam
        self.draft = draft
        self.displacement = displacement
        self.cabins = cabins
        self.berths = berths
        self.water = water
        self.fuel = fuel
        self.thumbnail = thumbnail
        self.gallery = gallery
        self.payment = payment
        self.color = color
    }
    
    // MARK: Methods
    func getOwnerCompany() -> String {
        return ownerCompany
    }
    
    func isOldYacht() -> String {
        switch year {
        case 1950..<1990: return "Старая яхта"
        case 1991..<2010: return "Свежая яхта"
        case 2011..<2020: return "Хороший выпуск яхты"
        default: return "Новая яхта"
        }
    }
}


let finnsailer: Yacht = Yacht(model: "Finnsailer 34", builder: "OY Fiskars (Finland)", year: 1979, length: 10.4,
                              beam: 3.45, draft: 1.6, displacement: 6700, cabins: 3, berths: 7, water: 300,
                              fuel: 200, thumbnail: "", gallery: [""], payment: 39500, color: .white)

// Company: Рога и копыта
finnsailer.getOwnerCompany()

// Старая яхта
finnsailer.isOldYacht()
