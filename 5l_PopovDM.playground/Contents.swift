
import Foundation


enum Color: String {
    case red = "red", blue = "blue", white = "white", black = "black", green = "green"
}

enum ActionWindow {
    case open, close
}

enum ActionEngine {
    case start, stop
}

protocol Car {
    var brand: String { get set }
    var capacityFuelTank: Int { get set }
    var color: Color { get set }
    
    func Honk()
//    func getInfo()
}

extension Car {
    
    func actionWindow(action: ActionWindow) {
        switch action {
        case .open:
            print("Окно открыто")
        case .close:
            print("Окно закрыто")
        }
    }
    
    func actionEngine(action: ActionEngine) {
        switch action {
        case .start:
            print("Двигатель запущен")
        case .stop:
            print("Двигатель выключен")
        }
    }
    
    func Honk() {
        print("Звучит сигнал реализованный в суперклассе Car\n")
    }
}

class TrunkCar: Car {
    
    enum Trailer: String {
        case yes = "прицеп есть", no = "прицеп отстутствует"
    }
    
    var brand: String
    var capacityFuelTank: Int
    var color: Color
    
    // Индивидуальное свойство класса trunkCar
    var isHasTrailer: Trailer
    
    init(brand: String, capacityFuelTank: Int, color: Color, isHasTrailer: Trailer) {
        self.brand = brand
        self.capacityFuelTank = capacityFuelTank
        self.color = color
        self.isHasTrailer = isHasTrailer
    }
    
}

extension TrunkCar: CustomStringConvertible {
        var description : String {
            return "Грузовик \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank). Статус прицепа - \(self.isHasTrailer.rawValue)"
    }
}

class SportCar: Car {
    
    enum Spoiler: String {
        case yes = "спойлер есть", no = "спойлер отстутствует"
    }
    
    var brand: String
    var capacityFuelTank: Int
    var color: Color
    
    // Индивидуальное свойство класса sportCar
    var isHasSpoiler: Spoiler
    
    init(brand: String, capacityFuelTank: Int, color: Color, isHasSpoiler: Spoiler) {
        self.brand = brand
        self.capacityFuelTank = capacityFuelTank
        self.color = color
        self.isHasSpoiler = isHasSpoiler
    }
    
}

extension SportCar: CustomStringConvertible {
    var description : String {
        return "Спортивная машина \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank). Наличие спойлера - \(self.isHasSpoiler.rawValue)"
    }
}

let trunk01 = TrunkCar(brand: "MAN", capacityFuelTank: 350, color: .green, isHasTrailer: .yes)
print(trunk01)

let sportCar01 = SportCar(brand: "BMW", capacityFuelTank: 135, color: .black, isHasSpoiler: .no)
print(sportCar01)
