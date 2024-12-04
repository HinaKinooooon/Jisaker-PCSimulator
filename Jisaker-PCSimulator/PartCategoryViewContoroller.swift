import UIKit

class PartCategoryViewController: UITableViewController {
    let categories = ["CPU", "GPU", "RAM", "Motherboard", "Storage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "カテゴリ選択"
    }
    
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
        print("選択されたカテゴリ: \(selectedCategory)") // デバッグ用出力

        if let selectionVC = storyboard?.instantiateViewController(withIdentifier: "PCPartSelectionViewController") as? PCPartSelectionViewController {
            print("PCPartSelectionViewController を取得しました") // デバッグ用出力

            selectionVC.selectedCategory = selectedCategory
            navigationController?.pushViewController(selectionVC, animated: true)
        } else {
            print("PCPartSelectionViewController が見つかりません") // エラー時の出力
        }
    }
}
