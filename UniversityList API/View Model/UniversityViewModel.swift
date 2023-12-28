import Foundation

class UniversityViewModel
{
    private let sourcesURL = URL(string: "http://universities.hipolabs.com/search?country=")!
    
    var universityList = [University]()
    
    func fetchUniversityData(completion: @escaping ([University]) -> Void)
    {
        UniversityManager.sharedInstance.performRequest(sourcesURL,success: { universities in
            
            DispatchQueue.main.async
            {
                completion(universities)
            }
        },
                                                        didFailWithError: { error in
            print("Error fetching university data: \(error.localizedDescription)")
            
        }
        )
    }
    
    func getNoOfRowsInSection() -> Int 
    {
        return universityList.count
    }
}
