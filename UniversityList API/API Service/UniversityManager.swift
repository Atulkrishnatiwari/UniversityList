import Foundation

class UniversityManager
{
    static var sharedInstance=UniversityManager()
    func performRequest(_ endpint: URL,success: @escaping ([University]) -> (), didFailWithError: @escaping (Error) -> ())
    {
        URLSession.shared.dataTask(with: endpint) { (data, urlResponse, error) in
            if let error = error
            {
                didFailWithError(error)
                return
            }
            do
            {
                let jsonDecoder = JSONDecoder()
                let universityList = try jsonDecoder.decode([University].self, from: data!)
                success(universityList)
            }
            catch
            {
                didFailWithError(error)
            }
        }.resume()
    }
}
