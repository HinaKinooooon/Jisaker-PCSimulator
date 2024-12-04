// PCPartSelectionViewController.swift
//
// 必要な部分を変更
import UIKit
import RealmSwift

class PCPartSelectionViewController: UITableViewController {
    var pcParts: [PCPart] = []  // 表示するパーツリスト
    var selectedCategory: String = ""  // 選択されたカテゴリ名
    var selectedParts: [PCPart] = []  // 選択されたパーツリスト (Configurationに渡す)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ナビゲーションバーのタイトルをカテゴリ名に設定
        self.title = selectedCategory
        
        // 選択されたカテゴリに応じたパーツを取得
        pcParts = fetchParts(for: selectedCategory)
    }
    
    // Realmからパーツを取得
    func fetchParts(for category: String) -> [PCPart] {
        let realm = try! Realm()
        let results = realm.objects(PCPart.self).filter("type == %@", category)
        return Array(results)
    }
    
    // TableViewの行数を設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pcParts.count
    }
    
    // セルのデータを設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartCell", for: indexPath)
        let part = pcParts[indexPath.row]
        cell.textLabel?.text = part.name
        cell.detailTextLabel?.text = "\(part.price) 円"
        return cell
    }
    
    // セルがタップされたときの処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPart = pcParts[indexPath.row]
        
        // 選択されたパーツを保持
        selectedParts.append(selectedPart)
        
        // ConfigurationViewControllerに遷移
        if let configVC = storyboard?.instantiateViewController(withIdentifier: "ConfigurationViewController") as? ConfigurationViewController {
            configVC.selectedParts = selectedParts
            navigationController?.pushViewController(configVC, animated: true)
        }
    }
}
