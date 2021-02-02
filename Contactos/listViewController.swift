

import UIKit
import Foundation

class listViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    

    let request = Request.shared.getUsers()
    var users: NSArray = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        request.responseJSON{
        response in self.users = (response.value! as! NSArray)
        print(self.users)
        self.tableView.reloadData()
        self.tableView.backgroundView?.backgroundColor = UIColor.secondarySystemBackground
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CellRow
        cell.nsjd.text = users[indexPath.row] as? String
        //.picture.image = quesos[indexPath.row].image*/
        return cell
    }
    

}



