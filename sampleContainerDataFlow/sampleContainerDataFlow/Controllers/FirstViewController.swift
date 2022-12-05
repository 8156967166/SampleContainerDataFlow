//
//  FirstViewController.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

protocol FirstViewControllerDelegate {
    func didChangeTextFieldText(_ text:String, cellModel:FirstVCTableViewCellModel)
}

class FirstViewController: UIViewController {

    var delegate:FirstViewControllerDelegate?
    
    @IBOutlet var tableView:UITableView!
    
    var cellModels:[FirstVCTableViewCellModel] = []
    var card:Card = Card([:])
    var errorCard:Card = Card([:])

    override func viewDidLoad() {
        super.viewDidLoad()
        errorCard.name = ""
        createCellModels()
    }
   
    func createCellModels() {
        cellModels = []
        cellModels.append(FirstVCTableViewCellModel(.name, errorCard))
        cellModels.append(FirstVCTableViewCellModel(.email, errorCard))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier) as! FirstVCTableViewCell
        cell.cellModel = cellModel
        cell.delegate = self
        return cell
    }
}

extension FirstViewController: FirstVCTableViewCellDelegate {
    func didChangeTextFieldText(_ text: String, cellModel: FirstVCTableViewCellModel) {
        print("didChangeTextFieldText ====> \(text)")
        
        tableView.beginUpdates()
        if let index = cellModels.firstIndex(where: {$0.cellType == cellModel.cellType}) {
            print("index ====> \(index)")
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? FirstVCTableViewCell {
                if cellModel.cellType == .name {
                    if text.isEmpty {
                        errorCard.name = "Please enter the name"
                        cellModel.errorCard = errorCard
                    }else {
                        errorCard.name = ""
                        cellModel.errorCard = errorCard
                    }
                    cell.cellModel = cellModel
                }
            }
            tableView.endUpdates()
        }
        self.delegate?.didChangeTextFieldText(text, cellModel: cellModel)
    }
}
