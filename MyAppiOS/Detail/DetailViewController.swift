import UIKit
//Cria as referencias com a segunda tela
class DetailViewController: UIViewController {

    @IBOutlet weak var imageRick: UIImageView!
    @IBOutlet weak var titleRick: UILabel!
    @IBOutlet weak var imageMornie: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var especie: UILabel!
    @IBOutlet var origem: UIView!
    @IBOutlet weak var ultimavez: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var sexo: UILabel!
    
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageMornie.layer.cornerRadius = 8
        imageMornie.layer.masksToBounds = true
        imageMornie.contentMode = .scaleAspectFill
        
        titleRick.text = movie.title
        
        
    }
    
    


}
