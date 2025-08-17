import Foundation

// non-excaping - Замыкание, которое должно быть выполнено в пределах функции
// escaping - Замыкание, которое может быть вызвано после завершения функции
// autoclosures


// MARK: () -> () and () -> Void
/// func
func sayHello() {
    print("Hello Oleg")
}
sayHello()

/// closure
let closureOne = {
    print("closureOne")
}
closureOne()

let closureTwo: () -> () = {
    print("closureTwo")
}
closureTwo()


// MARK: () -> (TYPE)
let sum: () -> Int = {
    let a: Int = 5
    let b: Int = 8
    
    return a + b
}
let sumResult: Int = sum()
print(sumResult)


let sumTwo = sum

print(sumTwo())


// MARK: (TYPE) -> ()
let closureTypeOne: (Int) -> () = {
    print($0)
}
closureTypeOne(2)


let closureTypeTwo: (Int) -> () = { num in
    print(num)
}
closureTypeTwo(22)


// MARK: (TYPE) -> (TYPE)
let closureTypeThree: (String) -> (String) = {
    "\($0)!"
}
print(closureTypeThree("Oleg"))


// MARK: Замыкания в func
func someActionOne(_ number: Int, closure: (Int) -> ()) {
    var sum: Int = 0

    for num in 0...number {
        sum += num
    }
    
    closure(sum)
}

someActionOne(5) {
    print($0)
}


func someActionTwo(_ number: Int, closure: (Int) -> ([Int])) {
    var value: Int = number + number
    
    closure(value)
}

someActionTwo(2) { number in
    var arr: [Int] = []

    for num in 1...number {
        arr.append(num)
    }
    
    return arr
}


// MARK: sort
let numbers: [Int] = [8, 3, 2, 58, -5, 12]

let numbersSortedOne: [Int] = numbers.sorted(by: <)
print(numbersSortedOne)

let numbersSortedTwo: [Int] = numbers.sorted { (a, b) in
    a < b
}
print(numbersSortedTwo)

let numbersSortedThree: [Int] = numbers.sorted { $0 < $1 }
print(numbersSortedThree)

var numsArrFilter: [Int] = numbersSortedOne.filter { $0 > 0 && $0 < 10 }
/// [8, 3, 2, -5, 12] to [2, 3, 8]
print(numsArrFilter)


// MARK: Escaping closure
func escapingClosureOne(closure: () -> ()) {
    print(1)

    closure()
    
    print(3)
}
escapingClosureOne {
    print(2)
}

func escapingClosureTwo(closure: @escaping () -> ()) {
    print("escapingClosureTwo 1")

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure()
    }
    
    print("escapingClosureTwo 3")
}
escapingClosureTwo {
    print("escapingClosureTwo 2")
}


// MARK: - Homework урок 10 Замыкания (closure)
/*
    1) Написать closure и вызвать:
    1.1 0 → 0
    1.2 (Type1, Type2) -> ()
    1.3 (Туре, Туре) -> ([Туре])
    1.4 (Int, [String]) →> ([Int: String])
 
    2) Переписать функцию на closure:
 
    func createClosure(_ valuel: Int, _ value2: Int) -> [Int] {
        // создать массив
        for num in valuel...value2 {
            // сложить вмассив
        }
        return вернуть массив
    }

    3) Создать Словарь [Int: String]. Отсортировать по ключам в порядке убывания (все способы)

    // Сортировка
    4) Чем отличается @escaping o non-escaping closure?
    Привести пример кода

    5) Прочитать, что такое autoclosures, написать определение, привести пример.

    6) Какой тип у func и closure?

    7) Читаем доку - https://swiftbook.org/pages/1512#escaping-closuresm

*/

// MARK: 01
let tast01One = {
    print("tast01One")
}

let tast01Two: (String, String) -> () = {
    print("\($0) -> \($1)")
}

let tast01Three: (String, String) -> ([String]) = {
    [$0, $1]
}

let task01Four: (Int, [String]) -> ([Int: String]) = {
    var result: [Int: String] = [:]

    for (index, value) in $1.enumerated() {
        result[index] = value
    }

    return result
}


// MARK: 02
let createClosure: (Int, Int) -> ([Int]) = { valuel, value2 in
    var arr: [Int] = []
    
    for num in valuel...value2 {
        arr.append(num)
    }
    
    return arr
}


// MARK: 03
let task03Arr: [Int: String] = [1: "Oleg", 4: "Andrey", 3: "Dima", 2: "Vova"]

task03Arr.sorted(by: <)
task03Arr.sorted { val1, val2 in
    val1.key < val2.key
}
task03Arr.sorted(by: { $0.key < $1.key })


// MARK: 04
func task04EscapingClosure(closure: @escaping () -> ()) {
    print("MARK: 04 - 1")

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure()
    }
    
    print("MARK: 04 - 3")
}
task04EscapingClosure {
    print("MARK: 04 - 2")
}

func task04NonEscaping(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let task04Result = task04NonEscaping(5, 3) { $0 + $1 }
print(task04Result) // 8 (5 + 3)


// MARK: 05
func task05AutoClosure(_ condition: @autoclosure () -> Bool) {
    if condition() {
        print("task05AutoClosure")
    }
}
task05AutoClosure(5 > 3)


// MARK: 06
/// func и closure являются ссылочными типами

