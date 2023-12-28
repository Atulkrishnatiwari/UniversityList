//
//  DataShowViewController.swift
//  UniversityList API
//
//  Created by Celestial on 08/12/23.
//

import UIKit

class DataShowViewController: UIViewController
{
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var universityName: UILabel!
    var universityDetails : DataShowViewModel?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        updateViewDetails()
    }
    
    func updateViewDetails()
    {
        if let detail = universityDetails?.details
        {
            self.navigationItem.title = detail.alpha_two_code.uppercased()
            universityName.text = detail.name
            countryName.text = detail.country
        }
    }
    @IBAction func gotoNextPage(_ sender: UIButton)
    {
        if let detail = universityDetails?.details,
           let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as? WebViewController
        {
            webViewController.webViewModel = WebViewModel(urlSource: detail.web_pages[0])
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }
}
