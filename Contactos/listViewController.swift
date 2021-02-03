

import UIKit
import Foundation


class listViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    

    let request = Request.shared.getUsers()
    var users: [User] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        /*request.responseJSON{
        response in self.users = (response.value! as! NSArray)
        print(self.users)
        self.tableView.reloadData()
        self.tableView.backgroundView?.backgroundColor = UIColor.secondarySystemBackground
        }*/
        request.response{(responseData) in
            guard let data = responseData.data
                else {return}
            
            do{
                self.users = try
                    JSONDecoder().decode([User].self, from: data)
                self.tableView.reloadData()
            }catch{
                print(data)
            }
        }
        //print(data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.users.count)
        return self.users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CellRow
        //cell.nsjd.text = users[indexPath.row].username
        cell.nsjd.text = users[indexPath.row].username
        //.picture.image = quesos[indexPath.row].image*/
        return cell
    }
    // Este método se ejecuta cuando se pulsa una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = users[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: selectedItem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
       
        destination.userData = sender as? User
        
    }

}



