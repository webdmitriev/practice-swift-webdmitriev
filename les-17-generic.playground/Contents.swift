import Foundation

// Protocols
/// Equatable - используется для сравнения значений на раверство. Полезен, когда вам нужно сравниваться экземпляры дженерикового типа
/// Comparable - Позволяет сравнивать значения и определять порядок. Используется для сортировки или для каких-либо операций, которые требуют сравнения
/// Hashable - Требуется для создания кеш-значений, что необходимо при использовании объектов в коллекциях, таких как Set и Dictionary
/// CustomStringConvertible - Позволяет преобразовать объект в строковое представление. Полезно для отладки и вывода информации о значениях дженериков
/// Collection - Протокол, который может использоваться при создании собственных коллекций, которые будут работать с дженериками
/// Sequence - Используется для создания последовательностей, которые могут быть итерируемыми
/// IteratorProtocol - Протокол для создания итераторов, который позволяет реализовать собственные способы перебора коллекций
/// Numeric - (+ - *)
/// FloatingPoint - (+ - * /)

// Generic (without)
var numbers: [Int] = [1, 2, 3, 4, 5, 58, 12, 21]
numbers.append(36)
numbers += [101, 285]

func getMaxNumber(_ array: [Int]) -> Int? {
    guard !array.isEmpty else { return nil }
    
    var maxNum: Int = array[0]
    
    for arr in array {
        if arr > maxNum {
            maxNum = arr
        }
    }
    
    return maxNum
}

//print(getMaxNumber(numbers) ?? "No numbers")


func getMaxNumber(_ array: [Double]) -> Double? {
    guard !array.isEmpty else { return nil }
    
    var maxNum: Double = array[0]
    
    for arr in array {
        if arr > maxNum {
            maxNum = arr
        }
    }
    
    return maxNum
}

//print(getMaxNumber([1.1, 2.2, 3.3, 4.4, 5.8, 0, -1.4]) ?? "No numbers")

// Generic (with) -> T
enum Comparison {
    case ascending
    case descending
}

func getMaxNumGeneric<T: Comparable>(_ array: [T], _ comparison: Comparison = .ascending) -> T? {
    guard !array.isEmpty else { return nil }
    
    var maxNum: T = array[0]
    
    for arr in array {
        if comparison == .ascending {
            arr > maxNum ? maxNum = arr : nil
        } else {
            arr < maxNum ? maxNum = arr : nil
        }
    }
    
    return maxNum
}

//print(getMaxNumGeneric(numbers, .ascending) ?? "No numbers")
//print(getMaxNumGeneric([1.1, 2.2, 3.3, 4.4, 5.8, 0, -1.4], .descending) ?? "No numbers")



func sum<T: Numeric>(_ a: T,_ b: T) -> T {
    a + b
}

sum(5, 8)
sum(5.1, 8.6)






// MARK: - Homework Урок 17 (Generic)
/*
    1) Создайте 4 функции, которые будут складывать/умножать/вычитать/делить различные типы данных.
 
    2) Создайте структуру Вох, которая будет иметь один дженерик-параметр Т.
        2.1 В структуре должны быть следующие свойства:
            - item: T - элемент типа Т, находящийся в коробке.
            struct Box<T> {
                var item: T
            }

    2.2 Добавьте методы:
        - func getItem() → T - возвращает элемент из коробки.
        - (*) mutating func replaceItem(with newItem: T) - заменяет текущий элемент на новый.

        (*) что такое mutating, зачем и где он нужен

    3) Создайте класс Stack, который будет реализовывать стек с использованием дженериков.
        Класс должен содержать следующие методы:
        - private var stack: [T]
        - func push(_ item: T) - добавляет элемент в стек.
        - func pop() -> Т? - удаляет последний добавленный элемент и возвращает его.
        - func peek() -> Т? - возвращает последний добавленный элемент без его удаления.
        - func isEmpty() -> Bool - проверяет, пуст ли стек.
*/

// MARK: 01
enum TaskOperations<T: FloatingPoint> {
    case plus
    case minus
    case multiply
    case divide
}

func calculateNums<T: FloatingPoint>(_ a: T, _ b: T, operations: TaskOperations<T>) -> T {
    
    switch operations {
    case .plus: return a + b
    case .minus: return a - b
    case .multiply: return a * b
    case .divide:
        guard b != 0 else { return .nan }
        return (a / b).rounded()
    }
    
}

calculateNums(23, 3, operations: .plus)
calculateNums(24, 4, operations: .minus)
calculateNums(25, 5, operations: .multiply)
calculateNums(9, 4, operations: .divide)


// MARK: 02
/// mutating - метод изменяет свойства структуры (struct) или перечисления (enum)
struct Box<T> {
    var item: T
    
    func getItem() -> T {
        self.item
    }
    
    mutating func replaceItem(with newItem: T) {
        self.item = newItem
    }
}


// MARK: 03
final class Stack<T: FloatingPoint> {
    
    private var stack: [T]
    
    init(stack: [T]) {
        self.stack = stack
    }
    
    // Methods
    func push(_ item: T) {
        self.stack.append(item)
    }
    
    func pushArray(_ items: [T]) {
        for item in items {
            self.stack.append(item)
        }
    }
    
    func pop() -> T? {
        guard !self.stack.isEmpty else { return nil }
        
        var last = self.stack.last
        self.stack.removeLast()
        
        return last
    }

    func peek() -> T? {
        self.stack.last
    }
    
    func isEmpty() -> Bool {
        self.stack.isEmpty
    }
    
    func printStack() {
        print("Stack: \(stack), count: \(stack.count)")
    }
}

let stack = Stack<Double>(stack: [])
stack.push(1)
stack.pushArray([2, 3, 4])
stack.pop()
stack.peek()
stack.isEmpty()

stack.printStack()
