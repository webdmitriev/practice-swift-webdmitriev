import Foundation


// create
var setEmpty01: Set<Int> = []
var setEmpty02 = Set<Int>()
var setEmpty03: Set = [""]

var favoriteColors: Set<String> = ["red", "blue", "green"]

favoriteColors.count
favoriteColors.isEmpty


// add
var numberSet: Set<Int> = [1, 2, 3, -2]

numberSet.insert(4)
numberSet.remove(3)
numberSet.contains(58)
// numberSet.removeAll()


// sort
// [-2, 1, 2, 4]
let numberSetSorted: [Int] = numberSet.sorted(by: <)


// iterations
var mySetCharacter: Set<String> = ["a", "b", "c", "d", "e", "f"]

for char in mySetCharacter.sorted(by: >) {
    print(char)
}


// base operations
let firstSet: Set = [1,3,5,7,9]
let secondSet: Set = [2,4,6,8,9]
let thirdSet: Set = [2,5,6,9,0]

/// union
/// [1, 2, 3, 4, 5, 6, 7, 8, 9]
let newFirstSet = firstSet.union(secondSet).sorted()

/// intersection
/// [9] - есть повтор элементов
let setOne = firstSet.intersection(secondSet)
print(setOne)

/// subtracting
/// [1,3,5,7,9] / [2,5,6,9,0]
/// [1,7,3] - возврат уникальных элементов из firstSet
let setTwo = firstSet.subtracting(thirdSet)

/// symmetricDifference
/// [1, 2, 7, 3, 6, 0]  - возврат уникальных значений обоих set
let setThree = firstSet.symmetricDifference(thirdSet)
print(setThree)





// MARK: - Homework урок 7 (Set)|
/*
    1) Создать 3 пустых множества различными способами. Типы разные.
 
    2) Заполнить любое множество из пункта 1.
 
    3) Добавить/удалить значения всеми способами в/из множества пункта 2.
 
    4) Воспроизвести с ранее созданными множествами действия из урока. (isEmpty, count, contains и тд)
 
    5) Отсортировать множества по возрастанию и убыванию.
 
    6) Итерация по множеству:
        6.1 Посчитать сумму всех значений в множестве [2, 4, 5, -3, -1, 1, 0, -3, 7, 5, 3, 6, 9] и распечатать.
        6.2 Преобразовать множество в словарь. Ключ - элемент множетсва. Значение - остаток от деления на 3 элемента множетсва. [2: 2, 4: 1]
            0% 3
            1% 3
            2% 3
            3% 3
        6.3 Цикл по словарю. Распределить на 3 новых словаря по значения (остаток 0, 1, 2). Распечатать.
            let first = [2: 2, • ••]
            let second = [4: 1, ...]
            let third = [3: 0, ...]
        6.4 Создать новый set и сложить туда новые значения =>
        Значение = String (Сумма ключей (Int) ) + String (остаток)
        [2: 2, 5: 2, 8: 2] => 2 + 5 + 8 = 15 // "15" + "2" = "152" - сложить в новый сет
    7) Создай несколько set и примени к ним все операторы. Распечатай результат.
    - union - значения обоих множеств.
    - intersection - общие значения двух входных множеств.
    - subtracting - значениями не принадлежащих указанному множеству из двух входных.
    - symmetricDifference - значений, которые не повторяются в двух входных множествах.
 
    8) Опиши операторы:
    8.1
    - isSubset (of:)
    - isSuperset (of: )
    - isStrictSubset (of:) или isStrictSuperset(of :)
    - isDisjoint (with:)
 
    8.2 Создай несколько set и примени к ним все операторы выше. Распечатай результат.
*/


// MARK: 01
var task01Set: Set<Int> = []
let task02Set = Set<String>()
let task03Set: Set<Bool> = []


// MARK: 02
for el in 1...10 {
    task01Set.insert(el)
}


// MARK: 03
task01Set.remove(0)
task01Set.insert(999)
// task01Set.removeAll()


// MARK: 04
task01Set.count
task01Set.isEmpty
task01Set.contains(999)


// MARK: 05
let task05Ascending: [Int] = task01Set.sorted(by: <)
let task05Descending: [Int] = task01Set.sorted(by: >)


// MARK: 06
let task06AllSum: Int = task01Set.reduce(0, +) // 1054
var task06Arr: [Int: Int] = [:]

/// [999: 0, 5: 2, 1: 1, 7: 1, 9: 0, 2: 2, 6: 0, 4: 1, 10: 1, 3: 0, 8: 2]
for (_, el) in task01Set.enumerated() {
    task06Arr.updateValue(el % 3, forKey: el)
}


// MARK: 07
let task0701: Set = [1,2,3,5,7,9]
let task0702: Set = [2,4,6,8,9]
let task0703: Set = [2,5,6,9,0]

/// union
/// [1, 2, 3, 4, 5, 6, 7, 8, 9]
let task0701Union = task0701.union(task0702).sorted()
print(task0701Union)

/// intersection
/// [9] - есть повтор элементов
let task0701Intersection = task0701.intersection(task0702)
print(task0701Intersection)

/// subtracting
/// [1,3,5,7,9] / [2,5,6,9,0]
/// [1,7,3] - возврат уникальных элементов из firstSet
let task0701Subracting = task0701.subtracting(task0703)
print(task0701Subracting)

/// symmetricDifference
/// [7, 6, 1, 0, 2, 3]  - возврат уникальных значений обоих set
let task0701SymmetricDifference = task0701.symmetricDifference(task0703)
print(task0701SymmetricDifference)


// MARK: 08
//- isSubset (of:)
//- isSuperset (of: )
//- isStrictSubset (of:) или isStrictSuperset(of :)
//- isDisjoint (with:)

let task08Int01: Set<Int> = [1,2,3]
let task08Int02: Set<Int> = [1,2,3,4,5,6,7,8,9]

let task08String: Set<String> = ["Oleg", "Mary", "Kate"]

let Task08Char: Set<Character> = ["a", "b", "c"]

// все элементы task08Int01 есть в искомом set task08Int02
print(task08Int01.isSubset(of: task08Int02)) // true

// все элементы должны совпадать, возвращает bool
print(task08Int01.isSuperset(of: task08Int02)) // false

// строгое сравнение
print(task08Int01.isStrictSubset(of: task08Int02)) // true

// ищет общие элементы, если есть хоть один вернёт false
/// [11,22,33] - [1,2,3,4,5,6,7,8,9] = true
/// [11,2,33] - [1,2,3,4,5,6,7,8,9] = false
print(task08Int01.isDisjoint(with: task08Int02)) // false
