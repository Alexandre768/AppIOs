import UIKit

class MoviesViewController: UIViewController { //Personagem View Controller
    
    private var movies: [Movie] = [
        .init(title: "Rick Sanchez", imageUrl: "Rick-and-Morty 1", vida: "Vivo", statu: "Protagonista", Human: "Humano", episodio: "51"),
        .init(title: "Morty Smitc", imageUrl: "Rick-and-Morty 1", vida: "Vivo", statu: "Protagonista", Human: "Humano", episodio: "56")
    ]
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
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(image)

        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
       // fetchRemoteCharacter() //CHAMA A API
        
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
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62)
            ])
    }
    
    //CONSUMINDO DADOS DA API
    //    private func fetchRemoteCharacter(){
    //        let url = URL(string: "https://rickandmortyapi.com/api")!
    //
    //        let request = URLRequest(url: url)
    //       let task = URLSession.shared.dataTask(with: request) { data, _,
    //           error in
    //           if let error {return}
    //           guard let charactersData = data else {return}
    //
    //           print(String(data: charactersData, encoding: .utf8))
    //
    //        }
    //        task.resume()
     //}
}



extension MoviesViewController: UITableViewDataSource, UITableViewDelegate { //Personagens
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieCell()
        let movie = movies[indexPath.row]
        cell.configure(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    //Capta toques na tela do usuario, navegacao da tela
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        viewController.movie = movies[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
