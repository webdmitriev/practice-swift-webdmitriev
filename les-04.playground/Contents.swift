import Foundation

// MARK: - Homework урок 4 (Базовые операторы)

/*
    1) Провести возможные действия с операторами += -= › < == = + - % * / и т.д
 
    2) Как происходит сравнение < > <= >= для String Bool Character?
 
    3) Написать условие через if else, а потом это же условие через тернарный оператор

    4) Написать свою комбинацию логических операторов со скобками

    5) Понять логику таблицы истинности для || и &&

    6) === - для чего этот оператор?

*/

// MARK: 01
var numOne: Int = 14
var numTwo: Int = 3

numOne += numTwo
numOne -= numTwo
numOne > numTwo
numOne < numTwo
numOne == numTwo
numOne != numTwo
numOne + numTwo
numOne - numTwo
numOne % numTwo
numOne * numTwo
numOne / numTwo
numOne %= numTwo


// MARK: 02
let strOne: String = "strOne"
let strTwo: String = "strTwo"
let char: Character = "S"

strOne < strTwo
strOne > strTwo
strOne <= strTwo
strOne >= strTwo
strOne == strTwo
strOne != strTwo
//char < strOne // String != Character
//char > strOne // String != Character
//char <= strOne // String != Character
//char >= strOne // String != Character
//char == strOne // String != Character
//char != strOne // String != Character


// MARK: 03
let taskOne: Bool = true
let taskTwo: Bool = false

if taskOne {
    print("Task one is true")
} else {
    print("Task one is false")
}

taskOne ? print("Task one is true") : print("Task one is false")


// MARK: 04
taskOne ? Float(numOne * (numTwo + 14)) : Float(numTwo) * Float.pi



// MARK: 05
(taskOne && taskTwo) || (taskOne && !taskTwo) || (!taskOne && taskTwo) || (!taskOne && !taskTwo)



// MARK: 06
/// === проверяет, ссылаются ли две переменные на один и тот же объект в памяти
class Person {
    var name: String
    init(name: String) { self.name = name }
}

let person1 = Person(name: "Alice")
let person2 = person1  // person2 ссылается на тот же объект, что и person1
let person3 = Person(name: "Alice")  // новый объект

print(person1 === person2)  // true (один и тот же объект)
print(person1 === person3)  // false (разные объекты, даже если значения полей одинаковы)
print(person1.name == person3.name)  // true (значения равны)
