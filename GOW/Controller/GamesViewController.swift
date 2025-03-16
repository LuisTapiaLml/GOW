//
//  GamesViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class GamesViewController: UIViewController {
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var imagePageControl: UIPageControl!
    
    @IBAction func righSwipeDone(_ sender: Any) {
        
        print("right swipe")
        
        if( imagePageControl.currentPage == 0 ){
            imagePageControl.currentPage = gamePosters.count
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
        }else{
            
            imagePageControl.currentPage -= 1
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
            
        }
        
    }
    
    
    @IBAction func leftSwipeDone(_ sender: Any) {
        print("left swipe")
        
        if( imagePageControl.currentPage == gamePosters.count ){
            imagePageControl.currentPage = 0
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
        }else{
            
            imagePageControl.currentPage += 1
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
            
        }
        
        
    }
    
    
    //datasource :P
    let gamePosters = Array(0...7)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blackBackground
        
        
        
        // Do any additional setup after loading the view.
        imagePageControl.numberOfPages = gamePosters.count
        gameImage.image = UIImage(named: gamePosters.first?.description ?? "0")
        
        let originalImage = UIImage(named: "gow_logo")!
        
        imagePageControl.transform = CGAffineTransform(scaleX: 2, y: 2);
        self.imagePageControl.currentPageIndicatorTintColor = UIColor.gowRed
        
        
        for ( index , _ ) in gamePosters.enumerated() {
            if #available(iOS 16.0, *) {
                //imagePageControl.transform = CGAffineTransform(scaleX: 2.5, y: 2.5);
                
                imagePageControl.setCurrentPageIndicatorImage(originalImage,forPage: index)
                
                
                
            } else {
                // Fallback on earlier versions
            }
        }
        
        
       
        
    }
    
    
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
