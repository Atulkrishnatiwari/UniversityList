
import Foundation


// MARK: - University structure
struct University: Codable 
{
    var country: String
    var alpha_two_code: String
    var name: String
    var web_pages: [String]
    var domains: [String]
}
