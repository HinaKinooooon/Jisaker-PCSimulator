//
//  PartCategoryViewContoroller.swift
//  Jisaker-PCSimulator
//
//  Created by 木下陽汰 on 2024/11/21.
//

import UIKit

class PartCategoryViewController: UITableViewController {
    let categories = ["CPU", "GPU", "RAM", "Motherboard", "Storage"] // カテゴリのリスト

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "ShowPartSelection", sender: selectedCategory)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPartSelection",
           let destinationVC = segue.destination as? PCPartSelectionViewController,
           let selectedIndexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[selectedIndexPath.row] // 選択されたカテゴリを渡す
        }
    }
}
