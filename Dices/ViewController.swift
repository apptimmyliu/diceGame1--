//
//  ViewController.swift
//  Dices
//
//  Created by Timmy on 2023/10/4.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerAScoreLabel: UILabel!
    @IBOutlet weak var playerBScoreLabel: UILabel!
    
    @IBOutlet weak var playerAPointLabel: UILabel!
    @IBOutlet weak var playerBPointLabel: UILabel!
    
    @IBOutlet weak var playerADice1ImageView: UIImageView!
    @IBOutlet weak var playerADice2ImageView: UIImageView!
    @IBOutlet weak var playerADice3ImageView: UIImageView!
    
    @IBOutlet weak var playerBDice1ImageView: UIImageView!
    @IBOutlet weak var playerBDice2ImageView: UIImageView!
    @IBOutlet weak var playerBDice3ImageView: UIImageView!
    
    @IBOutlet weak var AwinImageView: UIImageView!
    @IBOutlet weak var BwinImageView: UIImageView!
    
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    //使用array依序產出骰子點數圖片
    let diceImages = ["one","two","three","four","five","six"]
    
    //定義骰子總和數數字、贏得之總場次數字
    var playerAResult = 0
    var playerBResult = 0
    var playerASum = 0
    var playerBSum = 0
    var winCount = 0
    
    //使圖片亂數生成
    func diceRandom() {
        playerADice1ImageView.image = UIImage(named: diceImages.randomElement()!)
        playerADice2ImageView.image = UIImage(named: diceImages.randomElement()!)
        playerADice3ImageView.image = UIImage(named: diceImages.randomElement()!)
        playerBDice1ImageView.image = UIImage(named: diceImages.randomElement()!)
        playerBDice2ImageView.image = UIImage(named: diceImages.randomElement()!)
        playerBDice3ImageView.image = UIImage(named: diceImages.randomElement()!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerADice1ImageView.image = UIImage(named: "one")
        playerADice2ImageView.image = UIImage(named: "one")
        playerADice3ImageView.image = UIImage(named: "one")
        
        playerBDice1ImageView.image = UIImage(named: "one")
        playerBDice2ImageView.image = UIImage(named: "one")
        playerBDice3ImageView.image = UIImage(named: "one")
        
        //將物件隱藏
        playAgainButton.isHidden = true
        AwinImageView.isHidden = true
        BwinImageView.isHidden = true
        
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
        
       //將骰子總和在func裡為0（每次按下按鈕，將總分歸零）
        var playerASum = 0
        var playerBSum = 0
        
        //骰子圖片亂數顯示
        diceRandom()
        // 生成骰子點數
        let playerADice1 = Int.random(in: 1...6)
        let playerADice2 = Int.random(in: 1...6)
        let playerADice3 = Int.random(in: 1...6)
        let playerATotal = playerADice1 + playerADice2 + playerADice3
        
        let playerBDice1 = Int.random(in: 1...6)
        let playerBDice2 = Int.random(in: 1...6)
        let playerBDice3 = Int.random(in: 1...6)
        let playerBTotal  = playerBDice1 + playerBDice2 + playerBDice3
       
        // 顯示骰子點數和設定圖片
        playerAPointLabel.text = "\(playerATotal)"
        playerADice1ImageView.image = UIImage(named: diceImages[playerADice1-1])
        playerADice2ImageView.image = UIImage(named: diceImages[playerADice2-1])
        playerADice3ImageView.image = UIImage(named: diceImages[playerADice3-1])
        
        playerBPointLabel.text = "\(playerBTotal)"
        playerBDice1ImageView.image = UIImage(named: diceImages[playerBDice1-1])
        playerBDice2ImageView.image = UIImage(named: diceImages[playerBDice2-1])
        playerBDice3ImageView.image = UIImage(named: diceImages[playerBDice3-1])
        
    
        // 判斷playerA/B 總得分並更新分數
        if playerATotal > playerBTotal {
            playerAResult = playerAResult+1
            playerAScoreLabel.text = "\(playerAResult)"
        }else if playerATotal < playerBTotal {
            playerBResult = playerBResult+1
            playerBScoreLabel.text = "\(playerBResult)"
        }
        // 判斷勝利條件為７分
        if playerAResult == 7 {
            AwinImageView.isHidden = false
            playAgainButton.isHidden = false
            rollButton.isHidden = true
        }else if playerBResult == 7 {
            BwinImageView.isHidden = false
            playAgainButton.isHidden = false
            rollButton.isHidden = true
        }
        }
    
    @IBAction func restart(_ sender: UIButton) {
        // 重新遊戲的按鈕點擊事件
        AwinImageView.isHidden = true
        BwinImageView.isHidden = true
        playerAResult = 0
        playerBResult = 0
        playerASum = 0
        playerBSum = 0
        // 重置畫面上的分數
        playerAPointLabel.text = "\(playerAResult)"
        playerBPointLabel.text = "\(playerBResult)"
        playerAScoreLabel.text = "\(playerASum)"
        playerBScoreLabel.text = "\(playerBSum)"
       
        // 顯示骰子圖片和按鈕
        rollButton.isHidden = false
        playAgainButton.isHidden = true
    }
}
