import UIKit

class PersonCell: UITableViewCell {
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 30
        return stack
    }()

    private let imagePersonView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 49
      
        image.layer.masksToBounds = true
        image.backgroundColor = .systemGray2
        return image
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let vivoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .black)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private let ProtagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .black)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private let HumanLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .black)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private let episodioa: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private let image: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage(named: "Rick-and-Morty 2")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContentView()
        addViewsInHierarchy()
        setupConstraints()
      // self.view.addSubview(self.image)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(person: Person) {
        titleLabel.text = person.name
        vivoLabel.text = " \(person.status) |"
        HumanLabel.text = person.species
        ProtagLabel.text = "\(person.status) | "
       imagePersonView.download(path: person.image)
        episodioa.text = "Episodio: \(person.episode)"
       
    }
    
    private func setupContentView() {
        selectionStyle = .none
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(imagePersonView)
        horizontalStack.addArrangedSubview(image)
      
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(vivoLabel)
        verticalStack.addArrangedSubview(HumanLabel)
        verticalStack.addArrangedSubview(episodioa)
        verticalStack.addArrangedSubview(ProtagLabel)
        verticalStack.addArrangedSubview(releaseDateLabel)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
     
        NSLayoutConstraint.activate([
            imagePersonView.widthAnchor.constraint(equalToConstant:  114.99993133544922),
            imagePersonView.heightAnchor.constraint(equalToConstant: 85.51513671875)
        ])
        
        NSLayoutConstraint.activate([
            vivoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            vivoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 164),
            vivoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            vivoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
        NSLayoutConstraint.activate([
            ProtagLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            ProtagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 200),
            ProtagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            ProtagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
        NSLayoutConstraint.activate([
            HumanLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            HumanLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 285),
            HumanLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
     
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
            ])
        NSLayoutConstraint.activate([
            episodioa.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            episodioa.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            episodioa.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            episodioa.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 70)
          
        
        ])

      
    }
}
