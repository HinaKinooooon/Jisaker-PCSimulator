// ConfigurationViewController.swift
//
// 必要な部分を変更
import UIKit

class ConfigurationViewController: UITableViewController {
    var selectedParts: [PCPart] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTotal()
    }

    func calculateTotal() {
        // 合計金額を計算してナビゲーションバーに表示
        let total = selectedParts.reduce(0) { $0 + $1.price }
        navigationItem.title = "合計: \(total) 円"
    }

    // TableViewの行数を設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedParts.count
    }

    // 各セルに選択されたパーツ情報を設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedPartCell", for: indexPath)
        let part = selectedParts[indexPath.row]
        cell.textLabel?.text = part.name
        cell.detailTextLabel?.text = "\(part.price) 円"
        return cell
    }
}
