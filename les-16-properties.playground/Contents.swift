import Foundation

// Properties

// MARK: - Свойства типа и свойства экземпляра
@MainActor
final class Temperature {
    
    // Свойство типа
    static let normalBodyTemperature: Double = 36.6
    
    private static var myVeryLowBodyTemperature: Double = 33.6
    
    static var veryLowBodyTemperature: Double {
        get {
            myVeryLowBodyTemperature
        }
        set {
            myVeryLowBodyTemperature = newValue
        }
    }
    
    // Свойство экземпляра
    let bodyTemperature: Double = 36.9
}

// обращаемся к экземпляру, чтобы получить свойство экземпляра
let temperature01 = Temperature()
print(temperature01.bodyTemperature)

// обращаемся к типу, чтобы получить свойство типа - static
let temperature02 = Temperature.normalBodyTemperature
let temperature03 = Temperature.veryLowBodyTemperature
print(temperature02)
print(temperature03)

Temperature.veryLowBodyTemperature = 34.0
print(Temperature.veryLowBodyTemperature)


// MARK: - Наблюдатели свойств
@MainActor
class PersonTemperature {
    
    static var counter: Int = 0
    
    var celcius: Double {
        willSet {
            print("Новая температура тела: \(newValue)")
        }
        didSet {
            print("Температура тела изменилась. Была: \(oldValue)")
        }
    }
    
    init(celcius: Double) {
        self.celcius = celcius
        PersonTemperature.counter += 1
    }
}

let personTemperature = PersonTemperature(celcius: 36.8)
personTemperature.celcius // 36.8

personTemperature.celcius = 37.0
//Новая температура тела: 37.0
//Температура тела изменилась. Была: 36.8


let personTemperature01 = PersonTemperature(celcius: 36.8)
let personTemperature02 = PersonTemperature(celcius: 36.8)
let personTemperature03 = PersonTemperature(celcius: 36.8)
let personTemperature04 = PersonTemperature(celcius: 36.8)

print(PersonTemperature.counter) // 5



// MARK: - Homework Урок 16 (Свойства)
/*
 1) Создать класс Height(final*) с двумя переменными meters и centimeters у каждого из них есть наблюдатели свойств willSet didSet.
 
 2) Создай 3 статических переменные (можно больше):
     2.1 B static let centimetersInMeter храни значение сколько сантиметров в одном метре.
     2.2 Созда еще 2 static var вычисляемое свойства типа/ хранимое свойство типа.
 
 3) Создайте две функции:
     3.1 Первая переводит метры в сантиметры. (Используй static let centimetersInMeter)
     3.2 Вторая переводит сантиметры в метры. (Используй static let centimetersInMeter)
 
 4) Пропиши у meters и centimeters willSet didSet:
    4.1 B willSet принтуй то, что будет установлено. (newValue)
    4.2 B didSet принтуй с какого на какое значение поменяется. (oldValue)
    4.3(®) B didSet вызывай соответствующую функцию из пункта 3, которая будет изменять величины.
    Пояснение: В didSet centimeters будет вырываться функция, которая переводит сантиметры в метры и присваивает это значение в meters.
    B didSet meters будет вырываться функция, которая переводит метры в сантиметры и присваивает это значение в centimeters.
    4.4 Реши проблему пункта 4.3 (?)
    4.5 Создай func с двумя входящими параметрами в которую нужно передавать:
        1) Int (рост в метрах или сантиметрах)
        2) Выбов велечины (meters или centimeters) * для этого можно реализовать enum
        enum Value {
        case meters
        case centimeters
        }

        Внутри функции создай switch, который будет принтовать значение роста и описание:
        Например:
        switch height
        100...150: print ("Перед нами мальш!")
        case
        190...300: print ("Перед нами гиган!")
        * не забывай, что в switch можно передавать несколько значений
*/

// MARK: 01
enum HeightUser {
    case meters
    case centimeters
}

@MainActor
final class Height {
    
    static let centimetersInMeter: Int = 100
    
    static var unitDescription: String {
        return "\(centimetersInMeter) cm in 1 m."
    }
    
    private static var instancesCreated: Int = 0
    
    static var totalInstances: Int {
        return instancesCreated
    }
    
    // для прекращения рекурсии
    private var isUpdating: Bool = false
    
    var meters: Double {
        willSet {
            print("Новое значение meters: \(newValue)")
        }
        didSet {
            print("meters изменился с \(oldValue) на \(meters)")
            
            guard !isUpdating else { return }
                        
            isUpdating = true
            centimeters = meters * Double(Height.centimetersInMeter)
            isUpdating = false
        }
    }
    
    var centimeters: Double {
        willSet {
            print("Новое значение centimeters: \(newValue)")
        }
        didSet {
            print("centimeters изменился с \(oldValue) на \(centimeters)")
            
            guard !isUpdating else { return }
                        
            isUpdating = true
            meters = centimeters / Double(Height.centimetersInMeter)
            isUpdating = false
        }
    }

    init(meters: Double, centimeters: Double) {
        self.meters = meters
        self.centimeters = meters * Double(Height.centimetersInMeter)
        
        // Увеличиваю счетчик
        Height.instancesCreated += 1
    }


    // Methods
    static func convertMetersToCentimeters(meters: Double) -> Double {
        return meters * Double(centimetersInMeter)
    }
    
    static func convertCentimetersToMeters(centimeters: Double) -> Double {
        return centimeters / Double(centimetersInMeter)
    }
    
    func categorizeHeight(value: Double, unit: HeightUser) {
        let heightInCentimeters: Double
        
        // Конвертирую в сантиметры
        switch unit {
        case .meters:
            heightInCentimeters = Height.convertMetersToCentimeters(meters: value)
        case .centimeters:
            heightInCentimeters = value
        }
        
        // категории
        switch heightInCentimeters {
        case 0..<100:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Это очень низкий рост")
        case 100..<150:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Перед нами малыш!")
        case 150..<170:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Средний рост")
        case 170..<190:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Высокий рост")
        case 190...300:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Перед нами гигант!")
        default:
            print("Рост \(value) \(unit == .meters ? "м" : "см") - Невозможное значение роста")
        }
    }
    
}

// Проверка работы
print("\n=== Создание экземпляра ===")
let myHeight = Height(meters: 1.8, centimeters: 0)
print("Рост: \(myHeight.meters) м, \(myHeight.centimeters) см")

print("\n=== Изменение meters ===")
myHeight.meters = 1.9

print("\n=== Изменение centimeters ===")
myHeight.centimeters = 200

print("\n=== Использование статических методов ===")
print("2 метра = \(Height.convertMetersToCentimeters(meters: 2)) см")
print("150 см = \(Height.convertCentimetersToMeters(centimeters: 150)) м")

print("\n=== Определение категорий роста ===")
myHeight.categorizeHeight(value: 1.2, unit: .meters)       // Малыш
myHeight.categorizeHeight(value: 140, unit: .centimeters)  // Малыш
myHeight.categorizeHeight(value: 1.95, unit: .meters)      // Гигант
myHeight.categorizeHeight(value: 165, unit: .centimeters)  // Средний рост
