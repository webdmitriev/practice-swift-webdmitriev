import Foundation

// Extension
class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person {
    
    func sayHello() -> String {
        return "Hello, my name is \(name)."
    }
}

let person: Person = Person(name: "Oleg")
person.sayHello()





// MARK: - Homework Урок 19 (Расширения)
/*
    1. Написать расширение для Double, которое будет вычислять куб числа (func var)
 
    2. Создать расширение для Агау, написать метод, который возвращает последний элемент (или nil, если массив пустой).
        [Int] (func var)
 
    3. Создать расширение для Агау, написать метод, который возвращает первый элемент (или nil, если массив пустой). [Int] (func var)
 
    4. Написать расширение для String, которое отдает ваше имя. + Enum
 
    5. Написать расширение для Int, которое будет вычислять факториал числа (func). 51 = 1 * 2 * 3 * 4 * 5
 
    6. Создать расширение для String, написать метод, который возвращает строку в обратном порядке (метод func)
 
    7. Создать расширение для Dictionary, написать метод, который позволяет получить значение по ключу с возвращением значения по умолчанию, если ключ отсутствует. (Для Dictionary типа [String: Int])
 
    8. Создать расширение для Date → 28 мая 2025
*/

// MARK: 01
extension Double {
    var cube: Double {
        (self * self * self)
    }
}
// 8
print(floor(2.4).cube)


// MARK: 02 - 03
extension Array {
    func getElementFirst() -> Element? {
        first
    }
    func getElementLast() -> Element? {
        last
    }
}

[].getElementFirst()
[1,2,3].getElementFirst()
["one", "two", "three"].getElementFirst()

[].getElementLast()
[1,2,3].getElementLast()
["one", "two", "three"].getElementLast()


// MARK: 04
enum Gender {
    case man
    case wooman
    case animal
}

extension String {
    func getUser(_ gender: Gender) {
        switch gender {
        case .man:
            "My name's \(self), im a boy"
        case .wooman:
            "My name's \(self), im a gilr"
        case .animal:
            "My name's \(self), im a ...... who am i?"
        }
    }
}

"Oleg".getUser(.man)
"Mary".getUser(.wooman)
"Bosy".getUser(.animal)


// MARK: 05
extension Int {
    func getFactorial() -> String {
        var factorial: Int = 1
        var expression: String = "\(self)! = "

        for idx in 1...self {
            factorial *= idx
            expression += "\(idx)"
            if idx < self {
                expression += " * "
            }
        }
        
        return expression
    }
}
// 8! = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8
8.getFactorial()


// MARK: 06
extension String {
    func getRevers() -> String? {
        guard self != "" else { return nil }
        
        var str: String = ""
        
        for char in self {
            str.insert(contentsOf: String(char), at: str.startIndex)
        }

        return str
    }
}
// yraM dna gelO
"Oleg and Mary".getRevers()


// MARK: 07
extension Dictionary {
    func getValue(_ key: Key, defaultValue: Value) -> Value {
        return self[key] ?? defaultValue
    }
}

var dict: [String: Int] = ["a": 1, "b": 2]
dict.getValue("a", defaultValue: 12) // 1
dict.getValue("c", defaultValue: 58) // 58


// MARK: 08
extension Date {
    var getDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
// 20 August 2025
Date().getDateString
