import Foundation

// MARK: - Homework урок 6 (Dictionary)

var dictionary: [Int: String] = [:]
var animals = [Int: String]()


// add
animals[0] = "Cat"
animals[3] = "Dog"
animals[11] = "Fish".uppercased()

animals.updateValue("Elephant".lowercased() , forKey: 2)


// remove
let animal = animals.removeValue(forKey: 3)


// methods
animals.isEmpty
animals.count
animals.keys // [2, 11, 0]
animals.values // ["elephant", "FISH", "Cat"]

animals.contains(where: { $0.value.lowercased() == "Elephant".lowercased() })
animals.contains { animal in
    animal.value.lowercased() == "Elephant".lowercased()
}


// sort
var myDictionary: [Character: Double] = ["a": 1.0, "b": 2.0, "c": 3.0]

let myDictionaryKeys = myDictionary.keys.sorted(by: >) // ["c", "b", "a"]

let myDictionaryValues = myDictionary.values.sorted(by: >) // [3.0, 2.0, 1.0]


// iterations
let names: [Int: String] = [5: "Oleg", 2: "Nata", 8: "Mary"]

for key in names.keys.sorted() {
    print(key)
}

for value in names.values.sorted(by: >) {
    print(value)
}

for el in names {
    print("ID: \(el.key), Name: \(el.value)")
}

for (key, value) in names {
    print("ID: \(key), Name: \(value)")
}



/*
 
    1) Создать 3 словаря различными способами. Типы разные.
 
    2) Заполнить словарь. Ключ - номер. Значение - Фамилия (Имя). [Int: String].
 
    3) Добавить/удалить значения всеми способами в словарь из пункта 2.
 
    4) Воспроизвести с ранее созданными словарями действия из урока. (isEmpty, count, contains и тд)
 
    5) Отсортировать словари по возрастанию и убыванию (key, value)
 
    6) Итерация по словарю Фамилий (Имен) пункт 2:
    6.1 Получить все value из словаря и сложить их в отдельный массив, отсортировать значения в массиве по убыванию.
    6.2 Из нового массива получить первую букву каждого слова и сложить их в отдельный массив
    6.3 Создать новый словарь и сложить туда ключ - первая буква (нижний регистр) + ключ, значение - фамилия. ["n": "Nata", "o": "Oleg"]
    Пример: [2: "Nata", 6: "Oleg", 12: "Greeny"] => ["n2": "Nata", "o6": "Oleg", "g12": "Greeny"]
    6.4 Вам дан массив имен:
    ["Влад", "Владилен", "Гарри", "Владимир", "Гаспар", "Евгений, "Павел", "Георгий", "Пётр", "Владлен", "Влас"]
    Есть фамилии (имена), которые начинаются с одной буквы
    Нужно получить словарь => ["в": "Влад", "в1": "Владилен", "г": "Гарри", в2: "Владимир", "г1": "Гаспар".. . и тд]
    6.5 Распечатать этот словарь, предварительно отсортировав от а до я по ключу.

    7) Что будет если постучаться/удалить по несуществующий индекс в словаре?
 
*/

// MARK: 01
let taskOne01: [String: String] = [:]
let taskOne02 = [Int: String]()
let taskOne03 = Dictionary<Int, String>()


// MARK: 02
var userData: [Int: String] = [1: "Oleg Dmitriev", 2: "Mary Dmitriev", 3: "Kate Dmitriev", 5: "Kitty Dmitriev"]


// MARK: 03
userData[5] = nil
userData.removeValue(forKey: 3)
userData.updateValue("Jon Dmitriev", forKey: 4)
userData[3] = "Kate Dmitrieva"


// MARK: 04
userData.isEmpty
userData.count
userData.contains(where: { $0.value.hasPrefix("Oleg") })
userData.contains(where: { $0.key.isMultiple(of: 1) })

userData.mapValues { $0.uppercased() }
userData.map { $0.key == 1 ? $0.value.uppercased() : $0.value.lowercased() }
userData.filter { $0.value.hasPrefix("Mary") }


// MARK: 05
// ["Keys": [1, 2, 3, 4]]
let userDataKeys: [String: [Int]] = ["Keys": userData.keys.sorted(by: <)]

// ["Names": ["Oleg Dmitriev", "Mary Dmitriev", "Kate Dmitrieva", "Jon Dmitriev"]]
let userDataValues: [String: [String]] = ["Names": userData.values.sorted(by: >)]


// MARK: 06
let userNames: [String] = userData.values.sorted(by: <)

var firstWordOfNames: [String] = []
var namesWithStrKeyName: [String: String] = [:]
var namesWithNumKeyName: [Int: String] = [:]
var namesWithWorkKeyName: [String: String] = [:]

for name in userNames {
    firstWordOfNames.append(name.first!.uppercased())
}

// "["j": "Jon Dmitriev", "k": "Kate Dmitrieva", "o": "Oleg Dmitriev", "m": "Mary Dmitriev"]"
for (key, el) in userNames.enumerated() {
    print(el)
    namesWithStrKeyName.updateValue(el, forKey: el.first!.lowercased())
}

// "[3: "Oleg Dmitriev", 0: "Jon Dmitriev", 2: "Mary Dmitriev", 1: "Kate Dmitrieva"]"
for (key, el) in userNames.enumerated() {
    print(el)
    namesWithNumKeyName.updateValue(el, forKey: key)
}

// ["m2": "Mary Dmitriev", "o3": "Oleg Dmitriev", "k1": "Kate Dmitrieva", "j0": "Jon Dmitriev"]
for (key, el) in userNames.enumerated() {
    print(el)
    namesWithWorkKeyName.updateValue(el, forKey: "\(el.first!.lowercased())\(key)")
}




