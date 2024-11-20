//
//  EditPartViewController.swift
//  Jisaker-PCSimulator
//
//  Created by 木下陽汰 on 2024/11/21.
//

import UIKit
import RealmSwift

class EditPartViewController: UIViewController {
    @IBOutlet weak var partNameTextField: UITextField!
    @IBOutlet weak var partPriceTextField: UITextField!
    @IBOutlet weak var partTypeTextField: UITextField!
    @IBOutlet weak var partCompatibilityTextField: UITextField!
    
    var partToEdit: PCPart?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 既存パーツの情報を表示
        if let part = partToEdit {
            partNameTextField.text = part.name
            partPriceTextField.text = String(part.price)
            partTypeTextField.text = part.type
            partCompatibilityTextField.text = part.compatibility
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = partNameTextField.text, !name.isEmpty,
              let priceText = partPriceTextField.text, let price = Double(priceText),
              let type = partTypeTextField.text, !type.isEmpty,
              let compatibility = partCompatibilityTextField.text else { return }

        // 既存のパーツ情報を更新
        let realm = try! Realm()
        try! realm.write {
            if let part = partToEdit {
                part.name = name
                part.price = price
                part.type = type
                part.compatibility = compatibility
            } else {
                let newPart = PCPart()
                newPart.name = name
                newPart.price = price
                newPart.type = type
                newPart.compatibility = compatibility
                realm.add(newPart)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
}
