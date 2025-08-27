import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let price: Double
    let category: String
    let rating: Double
    
    static func mockData() -> [Product] {
        [
            Product(title: "Овсяная каша", price: 8.4, category: "Завтрак", rating: 4.6),
            Product(title: "Банан", price: 3.6, category: "Фрукты", rating: 4.2),
            Product(title: "Чай", price: 1.5, category: "Напитки", rating: 4.7),
            Product(title: "Ягоды голубики", price: 5.2, category: "Ягоды", rating: 4.4),
            Product(title: "Яблоко", price: 3.4, category: "Фрукты", rating: 4.3),
            Product(title: "Протеин", price: 12.3, category: "Добавки", rating: 4.9),
            Product(title: "Фруктозан", price: 6.6, category: "Добавки", rating: 4.8),
        ]
    }
}

final class Store {
    
    private let products: [Product] = Product.mockData()
    
    // Methods
    func getFilteredProducts(title: String = "", priceMin: Double = 0, priceMax: Double = 1_000_000,
                             category: String = "", rating: Double = 0) -> [Product] {
        
        return products.filter { product in
            // Фильтр по названию (если указано)
            let titleMatch = title.isEmpty ||
                            product.title.lowercased().contains(title.lowercased())
            
            // Фильтр по цене
            let priceMatch = product.price >= priceMin &&
                            product.price <= priceMax
            
            // Фильтр по категории (если указано)
            let categoryMatch = category.isEmpty ||
                               product.category.lowercased() == category.lowercased()
            
            // Фильтр по рейтингу
            let ratingMatch = product.rating >= rating
            
            return titleMatch && priceMatch && categoryMatch && ratingMatch
        }
    }
    
    // Дополнительные удобные методы
    func getProductsByCategory(_ category: String) -> [Product] {
        return getFilteredProducts(category: category)
    }
    
    func getProductsByPriceRange(min: Double, max: Double) -> [Product] {
        return getFilteredProducts(priceMin: min, priceMax: max)
    }
    
    func getProductsWithRating(atLeast rating: Double) -> [Product] {
        return getFilteredProducts(rating: rating)
    }
    
    func searchProducts(by title: String) -> [Product] {
        return getFilteredProducts(title: title)
    }
    
    // Получить все уникальные категории
    func getAllCategories() -> [String] {
        return Array(Set(products.map { $0.category })).sorted()
    }
}

// Использование
let store = Store()

// Примеры фильтрации
print("=== Фильтр по цене 5.0-9.0 ===")
let filteredByPrice = store.getFilteredProducts(priceMin: 5.0, priceMax: 9.0)
filteredByPrice.forEach { print($0.title, $0.price) }

print("\n=== Фильтр по категории 'Фрукты' ===")
let filteredByCategory = store.getFilteredProducts(category: "Фрукты")
filteredByCategory.forEach { print($0.title, $0.category) }

print("\n=== Фильтр по рейтингу от 4.5 ===")
let filteredByRating = store.getFilteredProducts(rating: 4.5)
filteredByRating.forEach { print($0.title, $0.rating) }

print("\n=== Поиск по названию 'я' ===")
let searchResults = store.getFilteredProducts(title: "я")
searchResults.forEach { print($0.title) }

print("\n=== Комбинированный фильтр ===")
let combinedFilter = store.getFilteredProducts(
    title: "я",
    priceMin: 3.0,
    priceMax: 9.0,
    category: "Фрукты",
    rating: 4.0
)
combinedFilter.forEach { print($0.title, $0.price, $0.category, $0.rating) }

print("\n=== Все категории ===")
print(store.getAllCategories())
