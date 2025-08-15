import Foundation

// MARK: - Homework урок 5 (Array)

/*

    1) Создать массивы (любой тип данных) всеми возможными способами.

    2) Создать массив и заполнить его числами (Int) от 12 до 222.

    3) Добавить/удалить в/из ранее созданные массивы (пункт 1) значения разными способами.

    4) Воспроизвести с ранее созданными массивами действия из урока.

    5) Отсортировать массивы ([Int] [String]) по возрастанию и убыванию

    6) Создать:
    6.1 Опциональный массив String и заполнить его
    6.2 Массив в котором будут храниться опциональные значения типа Double и заполнить его
    6.3 Опциональный масив в котором будут храниться опциональные значения Int и заполнить его

    7) Итерация по массиву [Int]:
    7.1 Посчитать сумму в цикле

    8) Итерация по массиву [String]:
    8.1 Сложить все значения в одну строку

    9) Итерация по строке: // good
    9.1 К каждому элементу добавить порядковый номер и сложить в новый массив [go, 01, 02, d3]
    9.2 Какого типа будет элемент строки?

    10) Что будет если постучаться по несуществующему индексу в массиве?

    11) Чем отличается removeFirst() и dropFirst()

*/

// MARK: 01
let someArray: [Int] = []
let someArray2 = [String]()
let someArray3: [Double] = Array()

let someArray4: [String] = Array(repeating: "Oleg", count: 8)


// MARK: 02
var task2ArrayInt: [Int] = Array(12...222)
var task2ArrayString: [String] = ["str 1", "str 2", "str 3"]


// MARK: 03
task2ArrayInt.append(2)
task2ArrayInt += [0,1,2,3,4,5,6,7,8,9]
task2ArrayInt.insert(999, at: 0)
task2ArrayInt.remove(at: 2) // index 2 (num 3) => 14

task2ArrayInt.isEmpty


// MARK: 04
/// something


// MARK: 05
task2ArrayInt.sort { $0 < $1 }
task2ArrayInt.sort { $0 > $1 }

task2ArrayInt.sorted(by: <)
task2ArrayInt.sorted(by: >)

task2ArrayString.sort { $0 < $1 }
task2ArrayString.sort { $0 > $1 }


// MARK: 06
var optionalArrayString: [String?] = ["str 1", "str 2", nil, "str 4"]
var optionalArrayInt: [Int?] = [1, 2, nil, 4]
var optionalArrayDouble: [Double?] = [1.0, 2.0, nil, 4.0]


// MARK: 07
var allSum: Int = 0
var allStr: String = ""

for num in 0..<optionalArrayInt.count {
    allSum += num
}


// MARK: 08
for str in 0..<optionalArrayString.count {
    if str != optionalArrayString.count - 1 {
        allStr += "\(optionalArrayString[str] ?? "") "
    } else {
        allStr += "\(optionalArrayString[str] ?? "")"
    }
}


// MARK: 09
let good: String = "good"
var goodArray: [String] = []

for (i, idx) in good.indices.enumerated() {
    goodArray.append("\(i): \(good[idx])")
}


// MARK: 10
/// crush


//MARK: 11
var str = "Swift"

let removedChar = str.removeFirst() // 'S', str = "wift"
let droppedChars = str.dropFirst()  // "ift" (Substring), str = "wift" (не изменилась)
