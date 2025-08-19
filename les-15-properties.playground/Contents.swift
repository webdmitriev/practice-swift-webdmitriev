import Foundation

// Properties

// MARK: Свойства хранения
class Phone {
    
    var model: String
    
    lazy var greeting: String = "Hello, i'm \(model)!"
    
    init(model: String) {
        self.model = model
    }
}

let phone = Phone(model: "iPhone 13 pro max")
phone.model = "iPhone 14"


// MARK: Ленивые свойства хранения
print(phone.greeting)


// MARK: Вычисляемые свойства
class Person {
    let firstName: String
    let secondName: String
    
//    не хранимое свойство
//    var fullName: String {
//        get {
//            "\(firstName) \(secondName)"
//        }
//    }
    var fullName: String {
        "\(firstName) \(secondName)"
    }
    
    init(firstName: String, secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
    }
}

let person = Person(firstName: "Oleg", secondName: "Dmitriev")
print(person.fullName)



class Temperature {
    
    var celsius: Double
    
    var fahrenheit: Double {
        get {
            (celsius * 9.0 / 5.0) + 32.0
        }
        set {
            celsius = (newValue - 32.0) * 5.0 / 9.0
        }
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    
}

let temperature = Temperature(celsius: 25.0)
print(temperature.fahrenheit) // 77.0
print(temperature.celsius) // 25.0

temperature.fahrenheit = 62.0
print(round(temperature.celsius)) // 35.5 -> round => 36.0



// MARK: - Homework Урок 15 (Свойства)
/*
    1. Создание класса Book:
        1) Создайте класс Book с тремя свойствами: title (строка), author (строка) и price (Double).
        2) Добавьте ленивое свойство discountedPrice, которое вычисляет цену со скидкой 15% от исходной цены. Скидка не должна применяться, пока это свойство не будет впервые вызвано.
 
    2. Создание класса Rectangle:
        1) Создайте класс Rectangle с двумя private свойствами: width и height (оба типа Double).
        2) Добавьте вычисляемое свойство агеа, которое будет вычислять и возвращать площадь прямоугольника.
        3) Добавьте вычисляемое свойство perimeter, которое будет вычислять и возвращать периметр прямоугольника.
        4)* Добавьте хранимое свойство private var sideSquare: Double = 0 (сторона квадрата) которое будет устанавливаться
        B set area u perimeter и изменять текущие width и height

    3. Почему lazy не может быть let?
 
    4. Зачем нужен get и set? Что такое newValue?
 
    5. Может ли вычисляемое свойство быть без set/ без get?
*/


// MARK: 01
class Book {
    let title: String
    let author: String
    let price: Double
    
    var discountedPrice: Double {
        price * 0.15
    }
    
    init(title: String, author: String, price: Double) {
        self.title = title
        self.author = author
        self.price = price
    }
}

let book = Book(title: "About me", author: "Oleg", price: 100)
print(book.discountedPrice) // 15.0


// MARK: 02
class Rectangle {
    private var width: Double
    private var height: Double
    private var sideSquare: Double = 0
    
    var area: Double {
        get {
            width * height
        }
        
        set {
            sideSquare = sqrt(newValue)
        }
    }
    
    var perimeter: Double {
        get {
            (width + height) * 2
        }
        
        set {
            sideSquare = newValue / 4
        }
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

let rectangle = Rectangle(width: 10, height: 20)
print(rectangle.area)
print(rectangle.perimeter)

rectangle.area = 10
rectangle.perimeter = 10

print(rectangle.area)
print(rectangle.perimeter)
