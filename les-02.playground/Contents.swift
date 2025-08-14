import Foundation

/// 1. Annotation types

// String
let str: String = "String"

// Character
let char: Character = "S"

// Int
let num: Int = 12
let numMax: Int = Int.max
let numMin: Int = Int.min

// Double
let double: Double = 12.1234567890

// Float (max 6)
let float: Float = 12.123456

// Bool
var isBool: Bool = true

// Change type
let secondDouble = Int(double)

// UInt
let maxUInt = UInt.max
let minUInt = UInt.min



/*
 1. Создать константы/переменные: имя (Sting), возраст (Int), возраст (Double), вы программист? (Bool)
    1.1 Указать явно тип данных
    1.2 Указать неявно тип данных

 2. Создать 3 переменные типа Bool (учитывай нейминг).
 Пример:
 let isOpen
 let isClosed
 
 3. Создать 4 переменные в одну строку типа Float и задать им разные значения.
 
 4. Создать переменную sumFloat и просуммировать все значения из пункта 3. + константа возраст(Int) +
 константа возраст(Double), вывести в консоль.

 5. Что будет, если задать переменной Float значение = 1, 0123456?
 
 6. Почему UInt.max и Int.maх разные?
 
 7. Какие типы данных не были упомянуты в уроке? (Читать доку)
 
 MARK: - SwiftBook
 https://swiftbook.ru/content/languageguide/hasics/
 */

// MARK: 01
let name: String = "Oleg"
let age: Int = 34
let ageDouble: Double = 34 + 10 / 12
var isProgrammer = true


// MARK: 02
var isOpen: Bool = false
var isClosed: Bool = false
var isAdmin: Bool = true
var isStrong: Bool = true


// MARK: 03
let firstFloat, secondFloat, thirdFloat, fourthFloat: Float
firstFloat = 1.1
secondFloat = 2.2
thirdFloat = 3.3
fourthFloat = 4.4


// MARK: 04
let sumFloat: Float = firstFloat + secondFloat + thirdFloat + fourthFloat + Float(age) + Float(ageDouble)
print(sumFloat)


// MARK: 05
let bigFloat: Float = 1.01234567


// MARK: 06
print(UInt.max)  // 18446744073709551615 (64-бит)
print(Int.max)   // 9223372036854775807  (63 бит + знак)


// MARK: 07
/// Character
