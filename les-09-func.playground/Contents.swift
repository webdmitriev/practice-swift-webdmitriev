import Foundation

// MARK: func () -> ()
func sayMyName() {
    print("Oleg")
}
sayMyName()


// MARK: func (item: Type) -> ()
func printName(name: String, age: Int = 34) {
    print("Name: \(name), age: \(age)")
}
printName(name: "Oleg")

func printNames(_ names: [String]) {
    for name in names {
        print(name)
    }
}
printNames(["Oleg", "Mary", "Nata"])

func basketSumPersent(_ item1: Int,_ item2: Int,_ item3: Int, _ persent: Int = 8) -> Int {
    print((item1 + item2 + item3) * persent / 100)
    return (item1 + item2 + item3) * persent / 100
}
basketSumPersent(110, 220, 330)


// MARK: Variation params
func printNamesOnly(_ names: String...) {
    names.forEach { print($0) }
}
printNamesOnly("Oleg", "Mary", "Nata")


// MARK: func () -> (Type)
func getMyName(_ name: String) -> String {
    return "GetMyName: \(name)"
}
var myName: String = getMyName("Oleg")


func getCharsName(_ name: String) -> [Character] {
    var arr: [Character] = []
    name.forEach { arr.append($0) }
    
    return arr
}
getCharsName("Oleg")


var herName: String = "Mary"
func changeName(_ name: inout String) {
    name += "!"
}
changeName(&herName)


// MARK: Сквозные параметры
var num = 10
func changeValue(mainValue: inout Int) {
    mainValue *= 2
}
changeValue(mainValue: &num)


// LES TASK
func printOnlyNames(_ elements: String...) -> [String] {
    var arr: [String] = []
    
    for el in elements {
        let firstCharUpper = el.first!.uppercased()
        let firstChar = el.first!
        
        if firstCharUpper == String(firstChar) {
            arr.append(el)
        }
        
    }
    
    
    return arr
}
printOnlyNames("Oleg", "dog", "home", "Mary", "work", "cat")






// MARK: - Homework урок 9 Функции (func)
/*
    1) Напиши функции, не забывай про нейминг:
        - Ничего не принимает ничего не возвращает
        - Принимает 2(Int), возвращает 1(Double)
        - Принимает 3 параметра, два из которых "Вариативные"
        - Принимает любое кол-во параметров типа Float, складывает в массив, сортирует по возрастанию и возвращает массив [Float]
        - Принимает 3 значения различных типов данных и возвращает Словарь → [Int: (String, String) ]:
            У первого нет внешнего имени, есть внутреннее
            У второго есть и внешнее и внутреннее имя
            У третьего только внешнее имя + имеет значение по умолчанию
        Не забудь вызвать функции :)

    2) Описать разницу между round() floor() ceil() и привести примеры.
        P.S Не забудь про import Foundation :)

    3) Напиши функцию, которая принимает 4 параметра (Имя, рост, вес, возраст) и возвращает 1 (String)
        Используй формулу индекса массы тела (ИМТ)

        Индекс массы тела рассчитывается по формуле:
            ИМТ = m / h^2
            m - масса тела в килограммах
            h - рост в метрах
 
        Например, масса человека = 60 кг, рост = 170 см.

    ИМТ = 60 : (1,7 × 1,7) * 20,7612457 кг/м2 (Округлить до сотых по правилам математики) см. пункт 2
 
    Нужно посчитать ИМТ по введенным данным и определить статус.

    Примеры вывода:
    "Алексей: ИМТ = 22.5 \nПоздравляем, ваш вес в норме! "
 
    "Маша: ИМТ = 17.3" \nСрочно кушать! \nНедостаточная масса тела :("
 
 

    Функции - ДОМАШКА
    Доработки по домашке:
    Таймкод: 1:05:00

    ДОПОЛНЕНИЕ ПО ОКРУГЛЕНИЮ:
    Поправка, если будете округлять ИМТ через round() floor() ceil(), то вы сможете округлить до ЦЕЛЫХ, а не до сотых. Так что можете окрузлять до ЦЕЛЫХ.

    * Но если вам интересно округлить до сотых, то такой метод тоже есть, но для этого нужно немного погуглить 🙂 За округление до сотых -  супер-респект!
 
    Функции - ДОМАШКА
    Доработки по домашке:
    Таймкод: 1:07:17

    ДОПОЛНЕНИЕ ПО ВЫВОДУ:
    Добавьте в вывод еще и возраст

    Примеры вывода:

    "Алексей, 25 лет: ИМТ = 22.5 \nПоздравляем, ваш вес в норме!"

    * Обратите внимание, что 25 лет, но 21 год 🙂
    Это задание со звездочкой, кто решит, тому супер-пупер -респект!

    При выводе возраста нужно учитывать "год" или "лет"
    Подумайте, как это реализовать.
    P.S. Вам поможет простой алгоритм, главное, найти закономерность 🙂
 
*/

// MARK: 01
func task01JustFunction() {
    print("Just function")
}
task01JustFunction()


func task01ReturnDouble(a: Int, b: Int) -> Double {
    return Double(a + b)
}
task01ReturnDouble(a: 1, b: 2)


func task01Variadic(a: Int, b: Int..., c: String...) {
    print(a)
    
    b.forEach { print($0) }
    
    c.forEach { print($0) }
}
task01Variadic(a: 1, b: 1,2,3, c: "Oleg", "Mary")


func task01ReturnFloat(_ nums: Float...) -> [Float] {
    var arr: [Float] = []
    
    nums.forEach { arr.append($0) }
    
    return arr.sorted(by: <)
}
task01ReturnFloat(1.0, 2.0, 3.0)


func task01ReturnDict(_ key: Int, UserName name: String, _ surname: String = "") -> [Int: (String, String)] {
    return [key: (name, surname)]
}
task01ReturnDict(1, UserName: "Oleg", "Dmitriev")


// MARK: 02
// откругление числа в большую или меньшую сторону сторону
/// 1.0...1.4 => 1 / 1.5...1.9 => 2
var task02Round: Double = round(1.4)

// откругление числа в меньшую сторону
var task02Floor: Double = floor(1.8)

// откругление числа в большую сторону
var task02Ceil: Double = ceil(1.2)


// MARK: 03
func healthBMI(_ num: Double) -> String {
    let small: Double = 18.5
    let big: Double = 29.9
    
    var res = ""
    
    if num < small {
        res += "Срочно кушать! \nНедостаточная масса тела :("
    } else if num > big {
        res += "У вас наблюдаются излишки, примите меры!"
    } else {
        res += "Поздравляем, ваш вес в норме!"
    }
    
    return res
}

func calculateAge(_ age: Int) -> String {
    let lastOne: Int = age % 10
    let lastTwo: Int = age % 100
    
    var res = ""

    if (11...14).contains(lastTwo) {
        res += "\(age) лет"
    }
    
    switch lastOne {
    case 1: res += "\(age) год"
    case 2...4: res += "\(age) года"
    default: res += "\(age) лет"
    }
    
    return res
}

func userData(name: String, age: Int, height: Double, weight: Double) -> String {
    let bmi = weight / (height * height)
    
    let years: String = calculateAge(age)
    
    let roundedBMI = String(format: "%.2f", bmi)
    
    let comments: String = healthBMI(bmi)
    
    return "\(name), \(years): ИМТ = \(roundedBMI) \n\(comments)"
}

let user01 = userData(name: "Oleg", age: 34, height: 1.84, weight: 84.4)
print(user01)
