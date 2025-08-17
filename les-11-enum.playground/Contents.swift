import Foundation

// enum - value type

enum Seasons {
    case spring
    case summer
    case autumn
    case winter
}

enum Seasons02 {
    case spring, summer, autumn, winter
}

let summer = Seasons.summer
let winter: Seasons = .winter


// MARK: enum + switch
let season: Seasons = .autumn

switch season {
    case .autumn: print("Осень")
    case .spring: print("Весна")
    case .summer: print("Лето")
    case .winter: print("Зима")
}


// MARK: Iterations on case
enum Sides: CaseIterable {
    case top
    case right
    case bottom
    case left
}

let sidesCount01: Int = [Sides.top, Sides.right, Sides.bottom, Sides.left].count
/// CaseIterable -> allCases
let sidesCount02: Int = Sides.allCases.count

for side in Sides.allCases {
    print(side)
}


// MARK: Ассоциативные значения
enum PaymentMethod {
    case creditCard(number: String, date: String, cvv: Int)
    case applePay(id: String)
    case googlePay(email: String)
}

let paymentMethod01: PaymentMethod = .creditCard(number: "1234 5678 0987 6543", date: "25.05.2030", cvv: 123)
let paymentMethod02: PaymentMethod = .applePay(id: "7239084ygihjbfweh")
let paymentMethod03: PaymentMethod = .googlePay(email: "dwebuy@pmail.con")

switch paymentMethod01 {
case .creditCard(let number, let date, let cvv):
    print("Card number: \(number), \nDate exp: \(date), \nCVV: \(cvv)")
case .applePay(let id):
    print("ApplePay ID: \(id)")
case .googlePay(let email):
    print("GooglePay email: \(email)")
}


// MARK: Исходные значения
enum OrderStatus: String {
    case pending = "Заказ ожидает обработки"
    case processing = "Заказ в обработке"
    case shipped = "Заказ отправлен"
    case delivered = "Заказ доставлен"
    case canceled = "Заказ отменён"
}

let orderStatus: String = OrderStatus.processing.rawValue


// MARK: Неявно установленные исходные значения
enum OrderStatusNumber: Int {
    case pending = 1 // 1
    case processing // 2
    case shipped // 3
    case delivered // 4
    case canceled // 5
}

OrderStatusNumber.delivered.rawValue // 4

let numberEnums = OrderStatusNumber(rawValue: 3)! // delivered -> 4



// MARK: - Homework Урок 11 Перечисления (enum)
/*
    1) Создай enum с 5 кейсами

    2) Создай enum, посчитай кол-во кейсов, распечатай первый кейс, проитерируйся по всем кейсам.

    3) Создай enum Animals с исходными значениям.

    4) Создай enum с ассоциативными значениями (min 7 кейса)
        4.1 Создать 3 константы с любыми кейсами
        4.2 Создать функцию:
            - Принимает: параметр типа вашего enum и кложуру (String, Bool) →› String ("Красный - это теплый цвет")
            var color: String = ""
            (switch Type - параметр)
            - Возвращает: String
            "Синий - сидит
            Синий - холодный цвет"
        4.3 Вызвать функцию 3 раза (для 3 констант)

    5) Переписать и потыкать:
        enum Constants {
            static let pi = 3.14
            static let e = 2.718
            static let captainJackSparrow = "Джонни Депп"
        }

    6) Что такое рекурсия? Может ли enum быть ссылочного типа?*

    7) Читаем доку https://swiftbook.org/docs/perechisleniya/

*/

// MARK: 01
enum fontWeight {
    case light
    case regular
    case medium
    case semibold
    case bold
}


// MARK: 02
enum fontSizes: CaseIterable {
    case xSmall
    case small
    case medium
    case large
    case xLarge
}

let fontSizesCount: Int = fontSizes.allCases.count // 5


// MARK: 03
enum Animals {
    case cat
    case dog
    case snake
    case frog
}


// MARK: 04
enum Colors {
    case red
    case green
    case blue
    case yellow
    case black
    case white
    case pink
}

let colorRed: Colors = .red
let colorGreen: Colors = .green
let colorBlue: Colors = .blue


func getColors(_ colors: Colors, closure: (String, Bool) -> (String)) -> String {
    var color: String = ""
    var isColorGood: Bool = false
    
    switch colors {
    case .red:
        color += "red"
        isColorGood = false
    case .green:
        color += "green"
        isColorGood = true
    case .blue:
        color += "blue"
        isColorGood = false
    case .yellow:
        color += "yellow"
        isColorGood = true
    case .black:
        color += "black"
        isColorGood = false
    case .white:
        color += "white"
        isColorGood = true
    case .pink:
        color += "pink"
        isColorGood = false
    }
    
    return closure(color, isColorGood)
}

/// green - это теплый цвет
let colorGreenIs = getColors(.green) { (color, isTrue) in
    return "\(color) - это \(isTrue ? "теплый" : "холодный") цвет"
}

/// blue - это холодный цвет
let colorBlueIs = getColors(.blue) { (color, isTrue) in
    return "\(color) - это \(isTrue ? "теплый" : "холодный") цвет"
}

/// red - это холодный цвет
let colorRedIs = getColors(.red) { (color, isTrue) in
    return "\(color) - это \(isTrue ? "теплый" : "холодный") цвет"
}


// MARK: 05
enum Constants {
    static let pi = 3.14
    static let e = 2.718
    static let captainJackSparrow = "Джонни Депп"
}

/// 3,14
let constantsPi: Double = Constants.pi

/// 2,718
let constantsE: Double = Constants.e

/// Джонни Депп
let constantsCaptainJackSparrow: String = Constants.captainJackSparrow


// MARK: 06
// Может ли enum быть ссылочного типа? - c допами да
indirect enum LinkedList {
    case node(value: Int, next: LinkedList?)
    case end
}

let list = LinkedList.node(value: 1, next: .node(value: 2, next: .end))
