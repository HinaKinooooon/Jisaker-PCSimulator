//
//  AddPartViewController.swift
//

import UIKit
import RealmSwift

class AddPartViewController: UIViewController {
    @IBOutlet weak var partNameTextField: UITextField!
    @IBOutlet weak var partPriceTextField: UITextField!
    @IBOutlet weak var partCompatibilityTextField: UITextField!
    @IBOutlet weak var partTypeTextField: UITextField!
    
    var selectedCategory: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新しいパーツを追加"
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = partNameTextField.text, !name.isEmpty,
              let priceText = partPriceTextField.text, let price = Double(priceText),
              let type = partTypeTextField.text, !type.isEmpty,
              let compatibility = partCompatibilityTextField.text else {
            // 入力が不十分な場合のアラート表示
            let alert = UIAlertController(title: "エラー", message: "全ての項目を正しく入力してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        // Realmにパーツを保存
        let newPart = PCPart()
        newPart.name = name
        newPart.price = price
        newPart.type = type
        newPart.compatibility = compatibility
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(newPart)
        }
        
        // 前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
}

