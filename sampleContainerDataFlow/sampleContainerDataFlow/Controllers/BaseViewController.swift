//
//  ViewController.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

class BaseViewController: UIViewController {

    var card:Card = Card([:])
    var errorCard:Card = Card([:])
    
    var firstViewController:FirstViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func printButtonClicked() {
        print("printButtonClicked... :: card.name ====> \(card.name)")
        print("printButtonClicked... :: card.email ====> \(card.email)")
        print("printButtonClicked... :: card.address ====> \(card.address)")
        if card.name.isEmpty {
            errorCard.name = "Name is mandatory..."
        }else {
            errorCard.name = "Looks good..!!!"
        }
        
        firstViewController?.errorCard = errorCard
        firstViewController?.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstVC = segue.destination as? FirstViewController {
            firstVC.delegate = self
            firstVC.card = card
            firstVC.errorCard = errorCard
            firstViewController = firstVC
        }else if let secondVC = segue.destination as? SecondViewController {
            secondVC.delegate = self
        }
    }
}

extension BaseViewController: FirstViewControllerDelegate {
    func didChangeTextFieldText(_ text: String, cellModel: FirstVCTableViewCellModel) {
        print("Base VC :: didChangeTextFieldText ====> \(text) || \(cellModel.cellType)")
        
        switch cellModel.cellType {
        case .name:
            card.name = text
        case .email:
            card.email = text
        } 
    }
}

extension BaseViewController: SecondViewControllerDelegate {
    func didChangeSecondVCTableTextFieldText(_ text: String, cellModel: SecondTableViewCellModel) {
        print("Base VC :: didChangeSecondVCTableTextFieldText ====> \(text) || \(cellModel.cellType)")
        switch cellModel.cellType {
        case .address:
            card.address = text
        }
    }
}
