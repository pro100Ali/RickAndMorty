import UIKit

class DescriptionVC: UIViewController {
    
    var episodes: [Episodes] = [Episodes(id: 2, name: "as", air_date: "!2", episode: "as")]
    
    var viewModel: ViewModel!

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rickAndMorty") // Set your image here
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Name"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let episodesLabel: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let originLabel: UILabel = {
        let label = UILabel()
        label.text = "Origin"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 340, height: 86)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.isScrollEnabled = false
        collection.backgroundColor = UIColor(red: 0.02, green: 0.05, blue: 0.12, alpha: 1)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    let originView = OriginView()
    
    let infoView = InfoView()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
        collection.delegate = self
        collection.dataSource = self
    }
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel = ViewModel()
        self.viewModel.getEpisode()
        self.viewModel.bindViewModelToController = {
            
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async { [self] in
            episodes = viewModel.episodes
            collection.reloadData()
            setupUI()
        }
    }
    
    private func setupUI() {
          view.backgroundColor = UIColor(red: 0.02, green: 0.05, blue: 0.12, alpha: 1)
        originView.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.layer.cornerRadius = 16
          view.addSubview(scrollView)
          scrollView.addSubview(contentView)
        
          originView.backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1)
          infoView.backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1)
        
          contentView.addSubview(profileImageView)
          contentView.addSubview(originView)
          contentView.addSubview(nameLabel)
          contentView.addSubview(episodesLabel)
          contentView.addSubview(originLabel)
          contentView.addSubview(collection)
          contentView.addSubview(infoView)
          contentView.addSubview(infoLabel)
          
          NSLayoutConstraint.activate([
              scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
              scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
              scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
              
              contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
              contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
              contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
              contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
              contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

              profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
              profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor) ,
              profileImageView.widthAnchor.constraint(equalToConstant: 100),
              profileImageView.heightAnchor.constraint(equalToConstant: 100),
              
              nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
              nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
              
              infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
              infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
              
              
              infoView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
              infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
              infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
              infoView.heightAnchor.constraint(equalToConstant: 150),

              
              originLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20),
              originLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),

              originView.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 20),
              originView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
              originView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
              originView.heightAnchor.constraint(equalToConstant: 100),

              
              episodesLabel.topAnchor.constraint(equalTo: originView.bottomAnchor, constant: 20),
              episodesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),

              collection.topAnchor.constraint(equalTo: episodesLabel.bottomAnchor, constant: 20),
              collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
              collection.heightAnchor.constraint(equalToConstant: CGFloat(episodes.count * 100))
          ])
      }
    
    func configure(_ char: CharacterInfo) {
        if let urlImage = char.image {
            profileImageView.kf.setImage(with: URL(string: urlImage))
        }
        nameLabel.text = char.name
        infoView.configure(char)
        originView.configure(char)
        callToViewModelForUIUpdate()

        
    }

}


extension DescriptionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.identifier, for: indexPath) as! EpisodeCell
        cell.configure(episodes[indexPath.row])
        return cell
    }
    
    
}
