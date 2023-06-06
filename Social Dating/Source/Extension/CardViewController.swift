//
//  CardViewController.swift
//  Social Dating
//
//  Created by SHIVAM GAIND on 06/06/23.
//

import UIKit
import Shuffle_iOS

class CardViewController: UIViewController{
    
    
    
    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Variables
    var images = [UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named: "Img4"),UIImage(named: "Img5"),UIImage(named: "Img3"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named: "Img4"),UIImage(named: "Img5"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named: "Img4"),UIImage(named: "Img5"),UIImage(named: "Img1"),UIImage(named: "Img2"),UIImage(named: "Img3"),UIImage(named: "Img4"),UIImage(named: "Img5")]
    var currentIndex = 0
    var cardStack: SwipeCardStack!
    var topCard: SwipeCard? {
        return cardStack.subviews.last as? SwipeCard
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStack = SwipeCardStack()
        cardStack.delegate = self
        cardStack.dataSource = self
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        cardContainerView.addSubview(cardStack)
        NSLayoutConstraint.activate([
            cardStack.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor),
            cardStack.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor),
            cardStack.topAnchor.constraint(equalTo: cardContainerView.topAnchor),
            cardStack.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor)
        ])
        
        cardStack.reloadData()
        
        let swipeGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardStack.addGestureRecognizer(swipeGestureRecognizer)
    }
    @objc func handleSwipe(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let topCard = topCard else { return }
        
        let translation = gestureRecognizer.translation(in: cardContainerView)
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
}
    
extension CardViewController: SwipeCardStackDelegate {
        func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
            currentIndex += 1
            if currentIndex >= images.count {
                currentIndex = 0
            }
            
            let newImage = images[currentIndex]
            imageView.image = newImage
        }
    }

extension CardViewController: SwipeCardStackDataSource {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.content = CardContentView(image: images[index])
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return images.count
    }
}

    
