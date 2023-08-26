import UIKit

class DescriptionVC: UIViewController {
    
    let episodes: [String] = ["Episode 1", "Episode 2", "Episode 3", "Episode 4", "Episode 3", "Episode 4", "Episode 3", "Episode 4"]

    
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
        layout.itemSize = CGSize(width: 327, height: 86)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func setupUI() {
          view.backgroundColor = UIColor(red: 0.02, green: 0.05, blue: 0.12, alpha: 1)
        originView.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(scrollView)
          scrollView.addSubview(contentView)
          originView.backgroundColor = UIColor(red: 0.15, green: 0.16, blue: 0.22, alpha: 1)
          contentView.addSubview(profileImageView)
          contentView.addSubview(originView)
          contentView.addSubview(nameLabel)
          contentView.addSubview(episodesLabel)
          contentView.addSubview(originLabel)
          contentView.addSubview(collection)
          
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
              
              originLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
              originLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),

              originView.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 20),
              originView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
              originView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24),
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


}


extension DescriptionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(episodes.count)
        return episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.identifier, for: indexPath) as! EpisodeCell
        cell.configure(episodes[indexPath.row])
        return cell
    }
    
    
}
