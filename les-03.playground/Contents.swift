import Foundation

// MARK: - Optionals

var animal: String? = "🐶"
print(animal ?? "")



var isOn: Bool? = true

if let isOnNew = isOn {
    print("isOn1")
} else {
    print("isOn = nil")
}



// MARK: - Homework урок 3 (Опциональные типы в Swift)
/*
    MARK: 1. Создать опциональные типы, присвоить различные значения.
    String?
    Character?
    Int?
    Double?
    Float?
    Bool?

    MARK: 2. Создать все типы из перевого пункта через ()
    Пример: let str = String()
    Написать, какое значение по дефолту устанавливается у каждого типа.

    MARK: 3. Создать 3 опциональных переменных любого типа развернуть из и рапечатать:
    // Первая равна true // Вторая false // Третья nil
    Развернуть ее через:
    3.1 Force unwrapping
    3.2 Optional Binding
    3.3 ??
    // Есть ли ошибки?

    MARK: 4. Напиши, какие есть операторы, приведи примеры на каждый пункт:
    4.1. Унарные префиксные
    4.2. Унарные постфиксные
    4.3. Бинарные
    4.4. Тернарные

*/

// MARK: 01
let str: String? = "str"
let char: Character? = "S"
let int: Int? = 1
let double: Double? = 1.1
let float: Float? = 1.11
let bool: Bool? = true


// MARK: 02
let strInit: String = String() // ""
let charInit: Character? = nil // Character() -> error
let intInit: Int? = Int() // 0
let doubleInit: Double? = Double() // 0
let floatInit: Float? = Float() // 0
let boolInit: Bool? = Bool() // false


// MARK: 03
let isOne: Bool? = true
let isTwo: Bool? = false
let isThree: Bool? = nil

if isOne! {
    print("isOne")
}

if let isOneNew = isTwo {
    print("isTwo")
}

print(isThree ?? "nil")


// MARK: 04
/// 4.1. Унарные префиксные
/// -num
/// +num
/// ~bits
/// !isActive

/// 4.2. Унарные постфиксные
/// +=
/// intValue = value as! Int (крашится, если не Int)

/// 4.3. Бинарные
/// Арифметические (+, -, *, /, %)
/// Сравнения (==, !=, >, <, >=, <=)
/// Логические (&&, ||)
/// Присваивания (=, +=, -=)
/// Работа с диапазонами (..., ..<)
/// Nil-coalescing (??)
/// Побитовые (&, |, ^)

/// 4.4. Тернарные
/// age >= 18 ? "Adult" : "Minor"
