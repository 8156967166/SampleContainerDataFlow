//
//  FirstVCTableViewCell.swift
//  sampleContainerDataFlow
//
//  Created by Bimal@AppStation on 19/10/22.
//

import UIKit

protocol FirstVCTableViewCellDelegate {
    func didChangeTextFieldText(_ text:String, cellModel:FirstVCTableViewCellModel)
}

class FirstVCTableViewCell: UITableViewCell {
    var delegate:FirstVCTableViewCellDelegate?
    
    @IBOutlet var lblError:UILabel!
    
    var cellModel:FirstVCTableViewCellModel! {
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
        if cellModel.cellType == .name {
            lblError.backgroundColor = .blue
            lblError.text  = cellModel.getFieldError()
        }
    }
    
    @IBAction func textFieldTextChanged(_ textField:UITextField) {
        print("textFieldTextChanged... \(textField.text ?? "")")
        self.delegate?.didChangeTextFieldText(textField.text ?? "", cellModel: cellModel)
    }

}
 
