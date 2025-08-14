import Foundation

/*
 
 1. Создать 3 константы и 3 переменные используя camelCase.
 
 2. Вывести командой print в консоль подряд все константы. I
 
 3. Присвоить двум переменным любые новые значения.
 Присвоить третей переменной значение любой ранее созданной константы.
 
 4. Присвоить константе новое значение.
 (Что произойдет? Как решить эту проблему)
 
 5. Каждый пункт ДЗ оформить с MARK: -
 
 6. Добавить описание 3 ранее созданным константам через ///
 
 */

// MARK: 01
// MARK: const name
/// Description for name
let name: String = "Oleg"

// MARK: const surname
/// Description for surname
let surname: String = "Dmitriev"

// MARK: const patronymic (task 4 changed let to var)
/// Description for patronymic
var patronymic: String = "Valerevich"

// MARK: variable age
var age: Int = 34

// MARK: variable height
var height: Double = 1.84

// MARK: variable weight
var weight: Double = 82.4


// MARK: 02
print("\(name) \(surname) \(patronymic), \(age) years old, \(height) meters, \(weight) kilograms")


// MARK: 03
age = 35
height = 1.85
weight = 83.0


// MARK: 04
/// you need to change let to var for patronymic
patronymic = "Michaelovich"


