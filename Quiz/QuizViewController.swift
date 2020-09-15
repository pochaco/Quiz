//
//  QuizViewController.swift
//  Quiz
//
//  Created by Yamamoto Miu on 2020/09/15.
//  Copyright © 2020 Yamamoto Miu. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["問題文1","選択肢1","選択肢2","選択肢3",2])
        quizArray.append(["問題文2","選択肢1","選択肢2","選択肢3",1])
        quizArray.append(["問題文3","選択肢1","選択肢2","選択肢3",3])
        quizArray.append(["問題文4","選択肢1","選択肢2","選択肢3",3])
        quizArray.append(["問題文5","選択肢1","選択肢2","選択肢3",2])
        quizArray.append(["問題文6","選択肢1","選択肢2","選択肢3",1])
        
        //問題をシャッフルする　-> 出題分がランダムに
        quizArray.shuffle()
        
        choiceQuiz()
        
    }
    
    func choiceQuiz(){
        
        //一時的に問題文を取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //ボタンに選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    //問題が全て終わると自動的に結果画面に遷移させるメソッド
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toResultView" {
            let resultViewContoroller = segue.destination as! ResultViewController
            resultViewContoroller.correctAnswer = self.correctAnswer
        }
        
    }

    //選択肢が押された時のメソッド
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
            correctAnswer = correctAnswer + 1
        }
        
        //といた問題をQuizArrayから取り除く
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        }
        else {
            choiceQuiz()
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
