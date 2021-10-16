//
//  ShoppingListTableViewController.swift
//  SeSAC_SHOPPING
//
//  Created by 김진영 on 2021/10/13.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var searchField: UITextField!
    
    var shopList: [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 1 : shopList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        //커스텀 셀을 사용할땐 indexPath를 전달하는 for 매개변수도 같이 사용한다
        //타입 캐스팅
        if indexPath.section == 0 {

            //cell.searchTextField.backgroundColor = .red
            cell.searchTextField.placeholder = "무엇을 구매하실 건가요?"
            cell.addButton.titleLabel?.text = "추가"
            cell.layer.cornerRadius = 5
            
            return cell
        } else {

            cell.shopListLabel.text = shopList[indexPath.row]
            
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 60 : 44
    }
    
    

    //(옵션) 셀 스와이프 On/Off 여부 : canEditRowAt
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
    //옵션 : 셀 스와이프 기능으로 delete editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if editingStyle == .delete {
                shopList.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        print("addButtonClicked")
        //searchTextField의 값을 가져오려고 했는데...에러가 남!
        

        let myList: String = searchField.text!

        print(myList)

        shopList.append(myList)
        tableView.reloadData()

    }
    


}