import Foundation

// MARK: - Homework Урок 20 (Протоколы)
/*
    Задание 1
    1) Создайте протокол ShapeProtocol с требованиями:
        - свойство name (только для чтения) ;
        - метод area() - возвращает площадь фигуры.

    2) Реализуйте этот протокол для:
        - структуры Circle (свойство radius);
        - структуры Rectangle (свойства width и height).

    3) Создайте массив shapes: [ShapeProtocol] и выведите в консоль имя и площадь каждой фигуры.
 
    Задание 2
    1) Добавьте в ShapeProtocol метод perimeter() с дефолтной реализацией, возвращающей 0.

    2) В Circle и Rectangle переопределите этот метод, чтобы он вычислял реальный периметр.

    3) Создайте протокол Resizable с методом resize(by factor: Double):
        - для структур реализуйте этот метод как mutating;
        - для классов - без mutating.

    4) Реализуйте Resizable в Circle и Rectangle, изменяя их размеры.
        Проверьте работу: увеличьте размеры всех фигур в массиве в 2 раза и снова выведите площади и периметры.
 
    Задание 3
    1) Что такое полиморфизм в swift? Как ты это понимаешь? ( своими словами)

    2) Приведи пример в коде

    Задание 4
    1) Зачем нужен mutating?|

*/

// MARK: 01
protocol ShapeProtocol {
    var name: String { get }
    
    func area() -> Float
}

struct Circle: ShapeProtocol {
    var name: String
    
    var radius: Float
    
    func area() -> Float {
        Float.pi * radius * radius
    }
}

struct Rectangle: ShapeProtocol {
    var name: String
    
    var width: Float
    var height: Float
    
    func area() -> Float {
        width * height
    }
}

let shapes: [ShapeProtocol] = [
    Circle(name: "Circle", radius: 120),
    Rectangle(name: "Rectangle", width: 120, height: 80)
]

for shape in shapes {
    print("Name: \(shape.name), Area: \(shape.area())")
}
//Name: Circle, Area: 45238.93
//Name: Rectangle, Area: 9600.0


// MARK: 02
extension ShapeProtocol {
    func perimeter() -> Float {
        0
    }
}

extension Circle {
    func perimeter() -> Float {
        2 * Float.pi * radius
    }
}

extension Rectangle {
    func perimeter() -> Float {
        2 * (width + height)
    }
}


// MARK: 02.3
protocol ResizableProtocol {
    mutating func resize(by factor: Float)
}

struct Square: ResizableProtocol {
    var side: Float = 1
    
    mutating func resize(by factor: Float) {
        side *= factor
    }
}

class Rect: ResizableProtocol {
    var width: Float = 1
    var height: Float = 1
    
    func resize(by factor: Float) {
        width *= factor
        height *= factor
    }
}


// MARK: 02.4
extension Circle: ResizableProtocol {
    mutating func resize(by factor: Float) {
        radius *= factor
    }
}

extension Rectangle: ResizableProtocol {
    mutating func resize(by factor: Float) {
        width *= factor
        height *= factor
    }
}

var circle02 = Circle(name: "Circle", radius: 120)
var rectangle02 = Rectangle(name: "Rectangle", width: 120, height: 80)

let shapes02: [ShapeProtocol] = [
    circle02,
    rectangle02
]



circle02.perimeter()
rectangle02.perimeter()

circle02.resize(by: 2)
rectangle02.resize(by: 2)

circle02.area()
circle02.perimeter()

rectangle02.area()
rectangle02.perimeter()

