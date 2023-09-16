import UIKit

class PersonViewController: UIViewController { //Personagem View Controller
    
    private var persons: [Result] = []
    private let image: UIImageView = {
        let imageView = UIImageView ()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Rick-and-Morty 2")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Personagens"
        return label
        
        
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(image)
        tableView.register(PersonCell.self, forCellReuseIdentifier: "DefaultCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
        fetchRemotePerson() //CHAMA A API
        
        
    }
    
    private func addViewsInHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
            
            
            
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant:  210),
            image.heightAnchor.constraint(equalToConstant: 55),
    
            image.topAnchor.constraint(equalTo: view.topAnchor,constant: 65),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            //image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62)
            ])
    }
    //Consumindo API
    private func fetchRemotePerson(){

        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){data, _, error in
            if error != nil { return }
            
            guard let PersonData = data else {return}
            //MOstrar os dados no console, retirar comentarios do print
           // print(String(data: PersonData, encoding: .utf8))
            
           let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let remotePerson = try? decoder.decode(RemotePerson.self, from: PersonData) else  {return}
            
            self.persons = remotePerson.results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

}

extension PersonViewController: UITableViewDataSource, UITableViewDelegate { //Personagens
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell") as! PersonCell
        let person = persons[indexPath.row]
        cell.configure(person: person) //ERROR
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    //Capta toques na tela do usuario, navegacao da tela
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        viewController.person = persons[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
