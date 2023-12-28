//
//  ViewController.swift
//  UniversityList API
//
//  Created by Celestial on 07/12/23.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var activityIndicator: UIActivityIndicatorView?
    var viewModel = UniversityViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        activityIndicator = UIActivityIndicatorView()
        self.view.addSubview(activityIndicator!)
        activityIndicator?.center = view.center
        activityIndicator?.startAnimating()
        
        
        viewModel.fetchUniversityData { university in
            self.activityIndicator?.stopAnimating()
            self.viewModel.universityList = university
            self.tableView.reloadData()
        }
        
    }
}
//MARK: -TableViewDelegate
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.getNoOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else { fatalError("Failed to dequeue the expected cell type.") }
        cell.countryLabel.text = "University \(indexPath.row)"
        
        cell.goButton.tag = indexPath.row // Assign the row index as the tag
        cell.goButton.addTarget(self, action: #selector(gotoNextpage(_:)), for: .touchUpInside)
        
//        // -animation code Started
//        cell.transform = CGAffineTransform(translationX: 0, y: 0)
//        UIView.animate(withDuration: 0.1, delay: 0.01 * Double(indexPath.row), options: .curveLinear)
//        {
//            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
//        }
        return cell
    }
}
//MARK: -Goto Next Page through mvvm

extension ViewController
{
    @objc func gotoNextpage(_ sender: UIButton) {
        let rowIndex = sender.tag
        let selectedUser = viewModel.universityList[rowIndex]
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? DataShowViewController else { return }
        viewController.universityDetails = DataShowViewModel(model: selectedUser)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
