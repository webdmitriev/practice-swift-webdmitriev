import Foundation


// MARK: - map = не модифицирует используемый массив
let numbersMap: [Int] = [1, 2, 3, 4, 5] // [2, 4, 6, 8, 10]
let resultOneNumbersMap: [Int] = numbersMap.map { num in
    num * 2
}
let resultTwoNumbersMap: [Int] = numbersMap.map { $0 * 2 }


// MARK: - flatMap = вернёт одномерный массив (на один уровень)
let numbersFlatMap: [[Int]] = [[1], [1, 2, 3], [3], [4], [5, 6]] // [1, 1, 2, 3, 3, 4, 5, 6]
let resultNumbersFlatMap: [Int] = numbersFlatMap.flatMap { $0 }
resultNumbersFlatMap


// MARK: - compactMap = устраняет optional
let numbersCompactMap: [Int?] = [1,2,3,4,5,nil,6,7,nil] // [1, 2, 3, 4, 5, 6, 7]
let resultNumbersCompactMap = numbersCompactMap.compactMap { $0 }


// MARK: - filter
let numbersFilter: [Int] = [1, 2, 3, 4, 5, 19, 38, 47]
let resultNumbersFilter01 = numbersFilter.filter { $0 > 3 && $0 < 28 } // [4, 5, 19]
let resultNumbersFilter02 = numbersFilter.filter { $0 % 2 == 0 } // [2, 4, 38]
let resultNumbersFilter03 = numbersFilter.filter { $0 % 2 == 1 } // [1, 3, 5, 19, 47]


// MARK: - reduce = складывает (если +)
let numbersReduce: [Int] = [1, 2, 3, 4, 5]
let resultNumbersReduce01 = numbersReduce.reduce(100) { $0 + $1 } // 115
let resultNumbersReduce02 = numbersReduce.reduce(0, +) // 15
let resultNumbersReduce03 = numbersReduce.reduce(0) { result, num in
    result + num
}  // 15


// MARK: - sort and sorted
let numbersSorted: [Int] = [1, 2, -1, 12, 58, -8, 3, 4, 5]
let resultNumbersSorted01 = numbersSorted.sorted(by: <) // [-8, -1, 1, 2, 3, 4, 5, 12, 58]
let resultNumbersSorted02 = numbersSorted.sorted(by: >) // [58, 12, 5, 4, 3, 2, 1, -1, -8]

var numbersSort: [Int] = [1, 2, -1, 12, 58, -8, 3, 4, 5]
numbersSort.sort(by: <) // [-8, -1, 1, 2, 3, 4, 5, 12, 58]


// MARK: - first(where: )
let namesFirst: [String] = ["Sam", "Mary", "Oleg", "Din", "Kate", "Anna", "Jack", "Eva"]
let resultNamesFirst01 = namesFirst.first { $0 == "Oleg" } // Oleg
let resultNamesFirst02 = namesFirst.first(where: { $0 == "Mary" } ) // Mary
let resultNamesFirst03 = namesFirst.first { $0.count == 3 } // Sam


// MARK: - split(separator: )
let strSplit01: String = "There are many variations of passages of Lorem Ipsum available"
let resultStrSplit01 = strSplit01.split(separator: " ")
// ["There", "are", "many", "variations", "of", "passages", "of", "Lorem", "Ipsum", "available"]

let strSplit02: String = "There are many variations of passages, of Lorem Ipsum available"
let resultStrSplit02 = strSplit02.split(separator: ", ")
// ["There are many variations of passages", "of Lorem Ipsum available"]


// MARK: - Homework Урок 14 (Функции высшего порядка)
/*
    1) Поработай с каждой функцией высшего порядка сомостоятельно, используй массив [String] (как начальный)

    2) Создайте функцию myMap, которая принимает массив строк и возвращает новый массив, в котором каждая строка преобразована в верхний регистр. ["nata"] -> ["NATA"]
 
    3) Создайте функцию myFilterMap которая получает массив строк, фильтрует и оставляеет строки, которые имеют длину более 4 символов, переводит первую букву строки в верхний регистр, а затем(в отдельной переменной) подсчитывает общее количество символов в этих строках. Функция myFilterMap возвращает тюпл ([String], [Int])
        func myFilterMap(array: [String]) →> ([String], [Int])
 
    4)* Используя функции высшего порядка преобразуй этот массив в плоский массив, где нет опциональных значений, все значения делятся на 3 без остатка или нечетные
        var testArray = [[[[1, 3, 12]]], nil, [[nil, [3, 8, 51], [[nil, 2, nil, 7, 9], [6, 4, 15], [1, 22, 11]]]]
        Результат: [1, 3, 12, 3, 5, 7, 9, 6, 15, 1, 11]
*/

//"nAta".uppercased()
//"naTa".lowercased()
//"naTa".capitalized

// MARK: 01
/// map, flatMap, compactMap, filter, reduce, sort and sorted, first(where: ), split(separator: )
let taskMap: [String] = ["nata", "kate", "maria", "olga", "lena"].map { $0.capitalized }
// ["Nata", "Kate", "Maria", "Olga", "Lena"]

let taskFlatMap: [String] = [["nata", "kate"], ["maria", "masha"], ["olga", "lena"]].flatMap { $0 }
// ["nata", "kate", "maria", "masha", "olga", "lena"]

let taskCompactMap: [String?] = ["nata", "kate", nil, "maria", nil, "olga", "lena"].compactMap { $0 }
// [Optional("nata"), Optional("kate"), Optional("maria"), Optional("olga"), Optional("lena")]

let taskFilter: [String] = ["nata", "kate", "maria", "olga", "lena"].filter { $0.count > 4 }
// ["maria"]

let taskReduce01: String = ["nata", "kate", "maria", "olga", "lena"].reduce("=> win") { $1 + " " + $0 }
// lena olga maria kate nata => win
let taskReduce02: Int = [1,2,3,4,5,6,7,8,9].reduce(0) { $0 + $1 }
// 45

let taskSort: [String] = ["nata", "kate", "maria", "olga", "lena"].sorted(by: <)
// ["kate", "lena", "maria", "nata", "olga"]

let taskFirst: [String] = ["Sam", "Mary", "Oleg", "Din", "Kate", "Anna", "Jack", "Eva"]
let resulTaskFirst = namesFirst.first { $0 == "Oleg" }
// Optional("Oleg")

let taskSplit: String = "Наташа записала очень хорогий курс по swift, теперь ждём курс по UIKit"
let resultTaskSplit = taskSplit.split(separator: ", ")
// ["Наташа записала очень хорогий курс по swift", "теперь ждём курс по UIKit"]


// MARK: 02
func myMap(_ strArr: [String], closure: ([String]) -> ([String])) -> [String] {
    var arr: [String] = []
    
    for str in strArr {
        arr.append(str.capitalized)
    }
    
    return closure(arr)
}
myMap(["nata", "kate", "maria", "olga", "lena"]) { $0.sorted(by: <) }
// ["Kate", "Lena", "Maria", "Nata", "Olga"]


// MARK: 03
func myFilterMap(_ arrStr: [String]) -> ([String], [Int]) {
    var arr: (names: [String], count: [Int]) = ([], [])
    
    arrStr.filter { str in
        if str.count > 4 {
            arr.names.append(str.capitalized)
            arr.count.append(str.count)
            false
        }
        return false
    }
    
    return arr
}


print(myFilterMap(["nata", "dmitriev", "kate", "maria", "sam", "olga", "lena", "din"]))
// (["Dmitriev", "Maria"], [8, 5])


// MARK: 04
var testArray = [[[[1, 3, 12], nil, [[nil, [3, 8, 51], [[nil, 2, nil, 7, 9], [6, 4, 15], [1, 22, 11]]]]]]]

func itarationArray(_ input: [Any]) -> [Int] {
    var result = [Int]()
    
    for el in input {
        if let num = el as? Int {
            if num % 3 == 0 || num % 2 != 0 {
                result.append(num)
            }
        } else if let array = el as? [Any] {
            result += itarationArray(array)
        } else if el is NSNull || el == nil {
            continue
        }
    }
    
    return result
}

print(itarationArray(testArray))
// [1, 3, 12, 3, 51, 7, 9, 6, 15, 1, 11]




