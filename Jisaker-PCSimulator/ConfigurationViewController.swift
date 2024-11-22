//
//  ConfigurationViewController.swift
//  Jisaker-PCSimulator
//
//  Created by 木下陽汰 on 2024/11/21.
//

import UIKit

class ConfigurationViewController: UITableViewController {
    var selectedParts: [PCPart] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTotal()
    }

    func calculateTotal() {
        let total = selectedParts.reduce(0) { $0 + $1.price }
        navigationItem.title = "合計: \(total) 円"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedParts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedPartCell", for: indexPath)
        let part = selectedParts[indexPath.row]
        cell.textLabel?.text = part.name
        cell.detailTextLabel?.text = "\(part.price) 円"
        return cell
    }
}
