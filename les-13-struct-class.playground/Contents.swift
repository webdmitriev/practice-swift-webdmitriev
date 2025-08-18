import Foundation

// Классы - ссылочный тип (Reference type)
// Структуры - тип значения (Value type)

/// Ссылочный - этот тип не копируется, Вместо копирования используется ссылка на существующий экземпляр

/// Тип значения - это тип, значение которого копируется, когда оно присваивается константе или переменной, или когда передаётся функции


// MARK: Синтаксис
struct Phone {
    
    let year: Int
    
    private var model: String
    var brand: String
    var memory: Int
    
    init(year: Int, model: String, brand: String, memory: Int) {
        self.year = year
        self.model = model
        self.brand = brand
        self.memory = memory
    }
    
    // Methods
    func getModel() -> String {
        "Model is: \(model)"
    }
}

// MARK: Экземпляры структуры
let phone01 = Phone(year: 2020, model: "iPhone 13", brand: "Apple", memory: 128)
phone01.getModel()

// MARK: Как работает value type (тип значения)
var dataPhone = Phone(year: 2021, model: "iPhone 14", brand: "Apple", memory: 512)

var myPhone01 = dataPhone

var myPhone02 = myPhone01

var myPhone03 = myPhone02

myPhone01.brand = "Samsung"
myPhone02.brand = "Apple"
myPhone03.brand = "Xiaomi"

myPhone01.brand // Samsung
myPhone02.brand // Apple
myPhone03.brand // Xiaomi


// MARK: Уровни доступа
//Open
//Public
//Internal(default)
//File-private
//Private





// MARK: - Homework Урок 13 Структуры (struct)
/*
    1. B Swift классы и структуры имеют много общего, но также и ряд ключевых отличий. Вот основные из них:
        1. Ссылочная vs. Значимая семантика: (Практика)
        - Классы являются ссылочными типами. Это означает, что когда вы присваиваете экземпляр класса другой переменной или передаете его в функцию, копируется не сам объект, а только ссылка на него. Изменения, внесенные через одну ссылку, будут видны и через другие ссылки на тот же объект.
        - Структуры являются значимыми типами. При присваивании экземпляра структуры другой переменной или передаче его в функцию создается копия. Изменения в одной копии не будут отражаться на других.
        
    Задание:
    1.1 Создать класс и структуру
    1.2 Придумать им свойства и методы, enum
    1.3 Добавить модификаторы доступа
    1.4 Создать несколько экземпляров класса и структуры
        let myPhone = Phone(model: "iPhone", brand: "Apple", year: 2020, memory: 128)
        var myPhonel = myPhone
        var myPhone2 = myPhonel
    1.5 Изменить некоторые свойства
    1.6 Вызвать метод, который будет печатать приватное свойство (любое)
    1.7 Показать на примере чем class отличается struct, написать вывод

    2. Наследование: (Теория)
        - Классы поддерживают наследование, что позволяет создавать иерархии классов, а также переопределять методы и свойства у подклассов.
        - Структуры не поддерживают наследование.

    3. Деинициализаторы: (Теория)
        - Классы могут иметь деинициализаторы, которые вызываются перед тем, как объект будет уничтожен.
        - Структуры не имеют деинициализаторов, так как они уничтожаются автоматически, когда выходят из области видимости.
 
    4. Проверка на равенство: (Практика)
        - Для классов реализация проверки на равенство происходит на основании ссылочной идентичности, т.е. два объекта считаются равными, если ссылаются на один и тот же экземпляр. (===)
        - Для структур проверка на равенство осуществляется по значениям всех их свойств, что позволяет определить, равны ли два экземпляра crpykTypel.（==）
    4.1 Сравнить классы
    4.2 Сравнить структуры*
    4.3 Сравнить свойства классов
    4.4 Сравнить свойства структур
    4.5 Сравнить класс и струкруту
    4.6 Сравнить свойство класса и свойство струкруты (Одинаковый тип у свойств)
 
    5. Модификаторы доступа: (Теория + Практика)
        - Классы могут иметь более гибкие модификаторы доступа (например, public, internal, private и т.д.) и поддержку протоколов с помощью расширений.
        - Структуры также поддерживают модификаторы доступа, но у них нет возможности использовать наследование.
    5.1 Чем Ореп отличается от Public
    5.2 Чем File-private отличается от Private
 

    Open
    Public
    Internal(default)
    File-private
    Private

    Читаем доку: https://swiftbook.org/docs/struktury-i-klassy/
 */


// MARK: 01
enum Colors {
    case white
    case black
    case orange
}

class Yacht {
    
    nonisolated(unsafe) static var counterYacht: Int = 0
    
    let year: Int
    
    private var ownerCompany: String = "Company: Рога и копыта ⛵️"
    var model: String
    var name: String
    var color: Colors
    
    init(year: Int, model: String, name: String, color: Colors) {
        self.year = year
        self.model = model
        self.name = name
        self.color = color
    }
    
    // Methods
    func getOwner() {
        print(ownerCompany)
    }
    
}

struct Sailboat {
    
    nonisolated(unsafe) static var counterSailboat: Int = 0
    
    let year: Int
    
    private var ownerCompany: String = "Company: Рог и копыто ⛵️"
    var model: String
    var name: String
    var color: Colors
    
    init(year: Int, model: String, name: String, color: Colors) {
        self.year = year
        self.model = model
        self.name = name
        self.color = color
    }
    
    // Methods
    func getOwner() {
        print(ownerCompany)
    }
    
}


// class
let yacht01 = Yacht(year: 1990, model: "Finnsailer", name: "Finnsailer 34", color: .white)
let yacht02 = Yacht(year: 2004, model: "Lagoon", name: "Lagoon 450", color: .orange)
let yacht03 = Yacht(year: 2001, model: "Bénéteau Océanis", name: "Bénéteau Océanis 50", color: .black)

let yacht0101 = yacht01
let yacht0102 = yacht0101
yacht0101.name = "Finnsailer 3400000"
yacht0102.name = "34 Finnsailer"
yacht01.name // 34 Finnsailer
yacht01.getOwner()


// struct
let sailboat01 = Sailboat(year: 1990, model: "Finnsailer", name: "Finnsailer 34", color: .white)
let sailboat02 = Sailboat(year: 2004, model: "Lagoon", name: "Lagoon 450", color: .orange)
let sailboat03 = Sailboat(year: 2001, model: "Bénéteau Océanis", name: "Bénéteau Océanis 50", color: .black)

var sailboat0101 = sailboat01
var sailboat0102 = sailboat0101
sailboat0101.name = "Finnsailer 3400000"
sailboat0102.name = "34 Finnsailer"
sailboat01.name // 34 Finnsailer
sailboat01.getOwner()


// MARK: 04
class User01 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let user01 = User01(name: "Oleg")
let user02 = User01(name: "Mary")

user01 === user02


struct Person01: Equatable {
    var name: String
}

let person01 = Person01(name: "Oleg")
let person02 = person01

person01 == person02


// MARK: 05
class Task0501 {
    public func log(message: String) { print(message) } // Можно вызвать, но нельзя переопределить
}

class Task0502 {
    open func fetchData() { /*...*/ } // Можно и наследовать, и переопределять
}

/// private - Только в текущем блоке кода (класс/структура/extension в том же файле)
/// fileprivate - В целом файле (включая все типы и extensions в этом файле)

class Task0503 {
    private var balance: Int = 0 // Недоступен даже для расширений в другом файле
}

// Файл: UserManager.swift
fileprivate let defaultLogin = "guest"

class Task0504 {
    func login() {
        print(defaultLogin) // Доступно, т.к. в том же файле
    }
}
