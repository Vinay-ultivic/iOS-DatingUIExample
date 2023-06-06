//
//  DiscoverVC.swift
//  Social Dating
//  Created by SHIVAM GAIND on 25/05/23.


import UIKit
import Koloda
import Shuffle_iOS

class DiscoverVC: UIViewController {
    
    // MARK: - Variables
   var images = [UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named: "Img4"),UIImage(named:         "Img5"),UIImage(named: "Img3"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named:         "Img4"),UIImage(named: "Img5"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named:        "Img4"),UIImage(named: "Img5"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named:   "Img4"),UIImage(named: "Img5")]
    
    var arrUserName  = ["Rahul","sita","Ram","Sushil","Aman","Mohan","Sohan","Rahul","sita","Ram","Sushil","Aman","Mohan","Sohan","Rahul","sita","Ram","Sushil","Aman","Mohan","Sohan"]
    
    var arrLoction   = ["India","Australia","Canada","Germany","China","France","Colombia","India","Australia","Canada","Germany","China","France","Colombia","India","Australia","Canada","Germany","China","France","Colombia",]
    
    var isSideViewOpen: Bool = false
    // var continers = [ContainerVC]()
    
    var currentIndex = 0
    var cardStack: SwipeCardStack!
    var topCard: SwipeCard? {
        return cardStack.subviews.last as? SwipeCard
    }

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var kolodaView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnMembership: UIButton!
    @IBOutlet weak var lblMembershipDay: UILabel!
    @IBOutlet weak var btnMatches: UIButton!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnSeeker: UIButton!
    @IBOutlet weak var btnInviteFriends: UIButton!
    @IBOutlet weak var btnTermsCondtion: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        kolodaView.layer.cornerRadius = 16
        kolodaView.layer.masksToBounds = true
//        kolodaView.dataSource = self
//        kolodaView.delegate = self
        backView.isHidden = true
        
        btnProfile.layer.cornerRadius = 21
        btnProfile.layer.masksToBounds = true
        
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
        imgProfile.image = UIImage(named: "Img5")
//
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.sideView.addGestureRecognizer(swipeRight)
        
        cardStack = SwipeCardStack()
        cardStack.delegate = self
        cardStack.dataSource = self
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        kolodaView.addSubview(cardStack)
        NSLayoutConstraint.activate([
            cardStack.leadingAnchor.constraint(equalTo: kolodaView.leadingAnchor, constant: -17),
            cardStack.trailingAnchor.constraint(equalTo: kolodaView.trailingAnchor,constant: 17),
            cardStack.topAnchor.constraint(equalTo: kolodaView.topAnchor,constant: -17),
            cardStack.bottomAnchor.constraint(equalTo: kolodaView.bottomAnchor,constant: 17)
        ])
        
        cardStack.reloadData()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        let swipeGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardStack.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        backView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  loadContainersView()
       // kolodaView.reloadData()
    }

    @objc func handleSwipe(_ gestureRecognizer: UIPanGestureRecognizer) {
           guard let topCard = topCard else { return }
           
           let translation = gestureRecognizer.translation(in: kolodaView)
           let direction: SwipeDirection = translation.x > 0 ? .right : .left
           
           switch gestureRecognizer.state {
           case .began:
               topCard.panGestureRecognizer.state = .began
           case .changed:
               topCard.panGestureRecognizer.state = .changed
           case .ended, .cancelled:
               topCard.panGestureRecognizer.state = .ended
               topCard.swipe(direction: direction)
           default:
               break
           }
       }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                hideBackView()
            default:
                break
            }
        }
    }
    
    private func showBackView() {
        backView.alpha = 0.0
        backView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.backView.alpha = 1.0
        }
    }

    private func hideBackView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backView.alpha = 0.0
        }) { _ in
            self.backView.isHidden = true
        }
    }

//    func loadContainersView(){
//        for _ in 0...arrImages.count - 1 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContainerVC") as! ContainerVC
//            self.addChild(vc)
//            continers.append(vc)
//        }
//    }
    
    // MARK: - Button actions for sideMenu
    @IBAction func profile(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnMembership(_ sender: UIButton){
        
    }
    
    @IBAction func btnMatches(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "matchesVC") as! matchesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnMessage(_ sender: UIButton){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnNotification(_ sender: UIButton){
        
    }
    
    @IBAction func btnSeeker(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeekersVC") as! SeekersVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnInviteFriends(_ sender: UIButton){
        
    }
    
    @IBAction func btnTermsCondtion(_ sender: UIButton){
        
    }
    
    @IBAction func btnSettings(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLogout(_ sender: UIButton){
        
    }
   ////end
    
    // MARK: - Button Actions Koloda Animation View
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        backView.isHidden = true
    }
    
    @IBAction func btnCross(_ sender: UIButton){
       // kolodaView.swipe(.left)
        cardStack.swipe(.left, animated: true)
    
    }
    
    @IBAction func btnLike(_ sender: UIButton){
        cardStack.swipe(.right, animated: true)
    }
    
    @IBAction func undo(_ sender: UIButton){
       // kolodaView.revertAction()
        cardStack.accessibilityPath?.reversing()
    }
    @IBAction func btnFilter(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func sideMenu(_ sender: UIButton){
        
        showBackView()
        // :-/-/->>> left swipe Side Menu animation <<<-\-\-
//        let presentedVC = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuProfileVC")
//        presentedVC.view.backgroundColor = UIColor.white
//        presentedVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(didTapCloseButton(_:)))
//        let nvc = UINavigationController(rootViewController: presentedVC)
//        present(nvc, animated: false, pushing: true, completion: nil)
        
    }
//    @objc func didTapCloseButton(_ sender: Any) {
//        if let presentedVC = presentedViewController {
//            let transition = CATransition()
//            transition.duration = 0.5
//            transition.type = CATransitionType.push
//            transition.subtype = CATransitionSubtype.fromRight
//            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            presentedVC.view.window!.layer.add(transition, forKey: kCATransition)
//        }
//        dismiss(animated: false, completion: nil)
//    }
}

//// MARK: - KolodaView Delegate and DataSource
//extension DiscoverVC: KolodaViewDelegate,KolodaViewDataSource {
//
//    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
//        let container = continers[index]
//        container.image = self.arrImages[index]
//        container.name = self.arrUserName[index]
//        container.location = self.arrLoction[index]
//        container.resetContent()
//        return continers[index].view
//    }
//    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
//        return continers.count
//    }
//    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        koloda.reloadData()
//    }
//    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
//        return .fast
//    }
//}

extension UIViewController {
    
    open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, pushing: Bool, completion: (() -> Void)? = nil) {
        
        if pushing {
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            view.window?.layer.add(transition, forKey: kCATransition)
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            self.present(viewControllerToPresent, animated: false, completion: completion)
            
        } else {
            self.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
}




extension DiscoverVC: SwipeCardStackDelegate {
        func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
            currentIndex += 1
            if currentIndex >= images.count {
                currentIndex = 0
            }
            
            let newImage = images[currentIndex]
            imageView.image = newImage
        }
    }

extension DiscoverVC: SwipeCardStackDataSource {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.content = CardContentView(image: images[index])
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return images.count
    }
}

    
class CardContentView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        
        imageView.image = image
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
