//
//  ViewController.swift
//  Project-Consolidation11
//
//  Created by Antoni on 22/08/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    var selectedCells = [CardCell]()
    var openedCards = 0
    
    var names = ["Axe", "EarthShacker", "Invoker", "PhantomAssassin", "QoP", "Roshan", "TemplarAssassin","WindRanger"]
    
    var cardsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PAIRS"
        cardsArray += names + names
        cardsArray.shuffle()
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CardCell else { fatalError() }
        cell.hiddenImageView.image = UIImage(named: cardsArray[indexPath.row])
        cell.name = cardsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
        cell.flip()
        selectedCells.append(cell)
        if selectedCells.count == 2 {
            if selectedCells[0].name != selectedCells[1].name {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [weak self] in
                    self?.selectedCells[0].flip()
                    self?.selectedCells[1].flip()
                    self?.selectedCells.removeAll()
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [weak self] in
                    self?.selectedCells[0].flip()
                    self?.selectedCells[1].flip()
                    self?.selectedCells[0].removeFromSuperview()
                    self?.selectedCells[1].removeFromSuperview()
                    self?.selectedCells.removeAll()
                }
                openedCards += 2
            }
        }
        if openedCards == 16 {
            let ac = UIAlertController(title: "You won!", message: "Do you want start new game?", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
                self?.cardsArray.removeAll()
                self?.collectionView.reloadData()
                self?.cardsArray += self!.names + self!.names
                self?.cardsArray.shuffle()
                self?.openedCards = 0
                self?.collectionView.reloadData()
            }))
            ac.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            present(ac, animated: true, completion: nil)
        }
    }


}

