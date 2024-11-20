//
//  PCPartSelectionViewController.swift
//  Jisaker-PCSimulator
//
//  Created by 木下陽汰 on 2024/11/21.
//

import UIKit
import RealmSwift

class PCPartSelectionViewController: UITableViewController {
    var selectedCategory: String? // 選択されたカテゴリを保持するプロパティ
    var pcParts: [PCPart] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // カテゴリでフィルタリングされたパーツを表示
        if let category = selectedCategory {
            pcParts = fetchPCParts().filter { $0.type == category }
        } else {
            pcParts = fetchPCParts()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pcParts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartCell", for: indexPath)
        let part = pcParts[indexPath.row]
        cell.textLabel?.text = part.name
        cell.detailTextLabel?.text = "\(part.price) 円"
        return cell
    }
}
