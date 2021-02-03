

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var name: UILabel!
    var userData: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(userData?.username)
        user.text = userData?.username
        name.text = userData?.name
    }
    

    

}
