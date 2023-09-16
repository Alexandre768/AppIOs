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
    
    
    var person: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageMornie.layer.cornerRadius = 8
        imageMornie.layer.masksToBounds = true
        imageMornie.contentMode = .scaleAspectFill
        imageMornie.download(path: person.image)
        colorNames()
        
        titleRick.text = person.name
        especie.text = "Status: \(person.status.rawValue)"
        sexo.text = "Species: \(person.species.rawValue)"
        status.text = "Gender: \(person.gender.rawValue)"
       ultimavez.text = "Created: \(person.created)"
       // print(ultimavez)
        
       
       
       
        
    }
    func colorNames()
    {
        let status = person.status.rawValue
        switch status{
        case "Alive" :
            return especie.textColor = .green
            
        case "unknown" :
            return especie.textColor = .gray
            
        case "Dead" :
            return especie.textColor = .red
        default:
            return
        }
      
    }
    
}
//Configura coisas que irao aparecer na tela
