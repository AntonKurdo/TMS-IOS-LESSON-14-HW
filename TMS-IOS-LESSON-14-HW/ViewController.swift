import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView?
    
    let screenSize = UIScreen.main.bounds
    
    let cellSize = 50
    
    let symbols = [UIImage(systemName: "keyboard.fill"), UIImage(systemName: "airtag"), UIImage(systemName: "display"), UIImage(systemName: "macpro.gen1.fill"), UIImage(systemName: "airpodsmax"), UIImage(systemName: "airpodspro"), UIImage(systemName: "appletv"), UIImage(systemName: "homepod"), UIImage(systemName: "ipodtouch"), UIImage(systemName: "iphone.gen2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.scrollDirection = .horizontal
     
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: screenSize.width, height: 100), collectionViewLayout: layout)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
  
        
        view.addSubview(collectionView ?? UICollectionView())
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        let imageview:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellSize, height: cellSize));
        imageview.contentMode = .scaleToFill
        imageview.tintColor = .systemPink
        let img : UIImage = symbols[indexPath.row]!
        
        imageview.image = img
        
        myCell.contentView.addSubview(imageview)

        return myCell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 20, height: 20)
//    }
    
    
}
