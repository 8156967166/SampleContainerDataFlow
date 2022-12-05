//
//  SecondViewController.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

protocol SecondViewControllerDelegate {
    func didChangeSecondVCTableTextFieldText(_ text:String, cellModel:SecondTableViewCellModel)
}

class SecondViewController: UIViewController {
    var delegate:SecondViewControllerDelegate?
    
    @IBOutlet var tableView:UITableView!
    
    var cellModels:[SecondTableViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCellModels()
    }
    
    func createCellModels() {
        cellModels = []
        cellModels.append(SecondTableViewCellModel(.address)) 
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! SecondTableViewCell
        cell.cellModel = cellModel
        cell.delegate = self
        return cell
    }
}

extension SecondViewController: SecondTableViewCellDelegate {
    func didChangeSecondVCTableTextFieldText(_ text: String, cellModel: SecondTableViewCellModel) {
        self.delegate?.didChangeSecondVCTableTextFieldText(text, cellModel: cellModel)
    }
}
