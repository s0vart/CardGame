//
//  ViewController.swift
//  CardGame
//
//  Created by Mark Nevmerzhitskiy on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentraitionGame(numberOfPairsOfCards: (cardCollection.count + 1) / 2)
    
    var touchesCount = 0 {
        didSet {
            scoreLabel.text = "Total score: \(touchesCount)"
        }
    }
    
    var emojiCollection = ["☠️", "👻", "🎃", "👽", "👮‍♂️", "👾", "👞", "👑", "🦁"]
    
    var emojiDictionary = [Int:String]()
    
    //MARK: Actions
    
    @IBAction func reverseCArd(_ sender: Any) {
        if let indexButton = cardCollection.firstIndex(of: sender as! UIButton) {
            game.chooseCard(at: indexButton)
            updateViewFromModel()
            touchesCount+=1
        }
        
    }
    
    //MARK: Outlets
    
    @IBOutlet var cardCollection: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Function
    
    func emojiIdentificator(for card: Card) -> String {
        
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in cardCollection.indices {
            let button = cardCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentificator(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .systemBlue
            }
        }
    }
}

