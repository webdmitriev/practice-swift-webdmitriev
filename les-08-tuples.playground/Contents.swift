import Foundation

// MARK: Tuplse
var fullName: (name: String, surname: String, age: Int) = (name: "Oleg", surname: "Dmitriev", age: 34)

print(fullName.0 + " " + fullName.1 + " \(fullName.2)")
print(fullName.name + " " + fullName.surname + " \(fullName.age)")


// MARK: if {} else {}
let myAge = 16

if myAge >= 18 {
    print("You are adult")
} else if myAge == 16 {
    print("You are minor")
} else {
    print("Hi")
}


// MARK: Switch
switch myAge {
case 0..<18:
    print("0 - 18")
    //fallthrough - идём в следующий case
case 24..<58:
    print("24 - 58")
default:
    print("􀆩")
}


// MARK: Tuples + Switch
let point: (x: Int, y: Int) = (x: 1, y: 1)

switch point {
case let (x, y) where x == y:
    print("(1, 1)")
case (x: 0, y: 0):
    print("0, 0")
case (x: 1, y: 0):
    print("1, 0")
case (x: 0, y: 1):
    print("0, 1")
case (x: 1, y: 1):
    print("1, 1")
default:
    print("􀆩")
}


// MARK: for in
/// 1 to 9
for num in 0..<10 {
//    if num == 6 {
//        print(num)
//        break
//    }
    print(num)
}

for char in "Oleg Dmitriev" {
    print(char)
}


// MARK: - Homework урок 8 (Операторы управления потоком + Тюплы)
/*

    1) Создать 3 тюпла:
    1.1 Один тип данных, указать явно типы, 2 значения // 2 шт
    1.2 Разные типы данных, добавить доп. название, min 5 значений
    1.3 Обратиться к тюплю через 0,1... Через доп.название. Print

    2) Создать свой switch. Min - 7 cases. Используй тюплы (3 значения - разных типов)
    2.1 Добавить break - что произойдет?
    2.2 Добавить fallthrough - что произойдет?
    2.3 Добавить break fallthrough в один кейс - что произойдет? // break fallthrough / / fallthrough break
    2.4 Добавить минимум два условия с where

    3) В циклк for in посчитать:
    3.1 Степени тройки до 7 степени. Print
    3.2 8! (8 факториал). Print // 4! = 1 * 2 * 3 * 4 = 24 // 5! = 24 * 5

    4) Придумать условия if (} else t}. Использовать материалы из урока

*/


// MARK: 01
let task01Str: (String, String) = ("Oleg", "Dmitriev")
let task01Double: (Double, Double) = (1.0, 2.0)

let task01AboutUser: (name: String, age: Int, married: Bool, weight: Float) = ("Oleg", 34, false, 82.4)

print(task01AboutUser.0)
print(task01AboutUser.1)
print(task01AboutUser.2)
print(task01AboutUser.3)
print("-----")
print(task01AboutUser.name)
print(task01AboutUser.age)
print(task01AboutUser.married)
print(task01AboutUser.weight)


// MARK: 02
let coordinateShip: (x: Int, y: Int) = (12, 58)

var coordinateShipX: Int = 0
var coordinateShipY: Int = 0

switch coordinateShip {
case let (x, y) where x == y:
    print("They found us, let's run")
case (x: 1...100, y: _):
    print("X: \(coordinateShip.x) found!")
    coordinateShipX = coordinateShip.x
    fallthrough
case (x: coordinateShipX, y: 1...100):
    print("Y: \(coordinateShip.y) found!")
    coordinateShipY = coordinateShip.y
    fallthrough
case (x: coordinateShipX, y: coordinateShipY):
    print("Fire")
    break
default:
    print("Not found")
}


// MARK: 03
var power = 1
for idx in 1...7 {
    power *= 3
    print("3^\(idx) = \(power)")
}


var factorial: Int = 1
let factorialIntaration: Int = 8
var expression: String = "\(factorialIntaration)! = "

for idx in 1...factorialIntaration {
    factorial *= idx
    expression += "\(idx)"
    if idx < factorialIntaration {
        expression += " * "
    }
}

expression += " = \(factorial)"
print(expression)
// 8! = 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 = 40320
