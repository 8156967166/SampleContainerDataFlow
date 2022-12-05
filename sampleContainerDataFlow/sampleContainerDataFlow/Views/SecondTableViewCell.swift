//
//  SecondTableViewCell.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

protocol SecondTableViewCellDelegate {
    func didChangeSecondVCTableTextFieldText(_ text:String, cellModel:SecondTableViewCellModel)
}

class SecondTableViewCell: UITableViewCell {
    var delegate:SecondTableViewCellDelegate?
    
    var cellModel:SecondTableViewCellModel! {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell() {
        
    }
    
    @IBAction func textFieldTextChanged(_ textField:UITextField) { 
        self.delegate?.didChangeSecondVCTableTextFieldText(textField.text ?? "", cellModel: cellModel)
    }
    
}
