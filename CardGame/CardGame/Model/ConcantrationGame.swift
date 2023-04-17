//
//  ConcantrationGame.swift
//  CardGame
//
//  Created by Mark Nevmerzhitskiy on 17.04.2023.
//

import Foundation


class ConcentraitionGame {
    
     var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCards: Int?
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCards, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCards = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCards = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
