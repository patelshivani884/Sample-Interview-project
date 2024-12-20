//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {

    private var exploreData: [ExploreContent] {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
           let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath))
        {
            let decoder = JSONDecoder()
            do {
                let decodedBooks = try decoder.decode([ExploreContent].self, from: fileContent)
                return decodedBooks
            } catch {
                print(error)
            }
        }
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    private func setupNavBar() {
        self.navigationItem.title = "A&F"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreContentCell.id, for: indexPath) as? ExploreContentCell else { return UITableViewCell() }
        
        cell.initData(with: exploreData[indexPath.row])
        return cell
    }
}
