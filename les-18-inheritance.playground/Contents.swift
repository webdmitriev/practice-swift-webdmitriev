import Foundation

// Наследование / inheritance
class Animal {
    
    let name: String
    let greeting: String
    
    init(name: String, greeting: String) {
        self.name = name
        self.greeting = greeting
    }
    
    func getGreeting() -> String {
        "Меня зовут: \(name), я говорю: \(greeting)"
    }
}

let animal: Animal = Animal(name: "Бося", greeting: "Мяу")
print(animal.getGreeting())



final class Cat: Animal {
    
    enum CatWant: String, CaseIterable {
        case fish = "рыбку"
        case meat = "мяско"
        case milk = "молока"
    }
    
    let isHarmful: Bool
    
    override init(name: String, greeting: String) {
        self.isHarmful = true
        
        super.init(name: name, greeting: greeting)
    }
    
    func meow() -> String {
        "Я \(name), и я хочу \(CatWant.allCases.randomElement()!.rawValue)!"
    }
}

let cat: Cat = Cat(name: "Мурзик", greeting: "Мяяяяяяу")
print(cat.getGreeting())
print(cat.meow())



final class Dog: Animal {
    
    init(name: String) {
        super.init(name: name, greeting: "Гав")
    }
    
    override func getGreeting() -> String {
        super.getGreeting()
//        return "Я \(name), и я люблю бегать делая афаф!"
    }
}

let dog: Dog = Dog(name: "Боб")
print(dog.getGreeting())
dog.getGreeting()




// MARK: - Homework Урок 18 (Наследование)
/*
    Задание 1:
    1. Создайте базовый класс Phone с следующими свойствами и методами:
        - Свойство currentBatteryLevel типа Double.
        - Метод description(), который возвращает строку с описанием уровня заряда телефона.
        - Создайте дополнительный метод takePhoto(), который выводит сообщение о том, что фото сделано, обозначте его final

    2. Создайте два подкласса:
        - Samsung, который наследует Phone и добавляет:
        - Свойство numberOfCameras.
        - Переопределяет метод description(), добавляя количество камер.
        Создайте экземпляр класса Samsung, обратитесь к свойству numberOfCameras и методам description() и takePhoto()
 
        - iPhone, который также наследует Phone и добавляет:
        - Свойство hasFlashlight.
        - Переопределяет метод description(), вызываете родительский метод, добавляя информацию о наличии фонарика.
        - Переопределяет метод takePhoto() (Что не так?)
        Создайте экземпляр класса iPhone, обратитесь к свойству hasFlashlight и методам description() и takePhoto ( )

    Ответьте на следующие вопросы:
        1. Когда вам стоит использовать ключевое слово final в классе?
        2. Каково назначение ключевого слова override и когда его следует использовать?
        3. Почему в Swift структуры не поддерживают наследование?
*/

// MARK: 01
class Phone {
    let currentBatteryLevel: Double
    
    init(currentBatteryLevel: Double) {
        self.currentBatteryLevel = currentBatteryLevel
    }
    
    // Methods
    func description() -> String {
        "\(self.currentBatteryLevel)"
    }
    
    final func takePhoto() -> String {
        "Фото сделано"
    }
}

class Samsung: Phone {
    func numberOfCameras() -> String {
        "\(super.takePhoto()) на камеру номер 2"
    }
}

let samsung: Samsung = Samsung(currentBatteryLevel: 58)
samsung.numberOfCameras()
samsung.description()
samsung.takePhoto()


class IPhone: Phone {
    var hasFlashlight: Bool
    
    init(hasFlashlight: Bool) {
        self.hasFlashlight = hasFlashlight
        super.init(currentBatteryLevel: 88)
    }
    
    // Methods
    override func description() -> String {
        super.description() + (hasFlashlight ? " с фонариком" : " без фонарика")
    }
    
//    takePhoto is final -> you cant to override
//    override func takePhoto() -> String {
//        "Фото сделано, но можно еще улучшить"
//    }
}

let iPhone: IPhone = IPhone(hasFlashlight: true)
iPhone.description()


// MARK: 03
/// 1. final - используем только если не наследуем данный класс
/// 2. override - только если планируем переопределить свойство
/// 3. struct - это value type и не могут содержать наследования (существует независимо)
