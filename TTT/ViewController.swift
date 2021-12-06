import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWinner.text = ""
    }
    func gameTurn(p1: Int, p2: Int) {
        game.newTurn(p1: p1,p2: p2)
        if game.isGameOver {
            print("Game is over")
            if game.isGameWon {
                labelWinner.text = "The Winner is \(game.winner)!"
                print("Game is won" + game.winner)
            }
            else {
                labelWinner.text = "The Game is a Tie!"
            }
        }
    }
    @IBAction func btnResetGame(_ sender: Any) {
        btn1.backgroundColor = UIColor.systemGray
        btn2.backgroundColor = UIColor.systemGray
        btn3.backgroundColor = UIColor.systemGray
        btn4.backgroundColor = UIColor.systemGray
        btn5.backgroundColor = UIColor.systemGray
        btn6.backgroundColor = UIColor.systemGray
        btn7.backgroundColor = UIColor.systemGray
        btn8.backgroundColor = UIColor.systemGray
        btn9.backgroundColor = UIColor.systemGray
        labelWinner.text = ""
        game = Game()
    }
    @IBAction func btn1(_ sender: Any) {
        if !game.board[0][0].ischecked() {
            btn1.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 0, p2: 0)
        }
    }
    @IBAction func btn2(_ sender: Any) {
        if !game.board[0][1].ischecked() {
            btn2.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 0, p2: 1)
        }
    }
    @IBAction func btn3(_ sender: Any) {
        if !game.board[0][2].ischecked() {
            btn3.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 0, p2: 2)
        }
    }
    @IBAction func btn4(_ sender: Any) {
        if !game.board[1][0].ischecked() {
            btn4.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 1, p2: 0)
        }
    }
    @IBAction func btn5(_ sender: Any) {
        if !game.board[1][1].ischecked() {
            btn5.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 1, p2: 1)
        }
    }
    @IBAction func btn6(_ sender: Any) {
        if !game.board[1][2].ischecked() {
            btn6.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 1, p2: 2)
        }
    }
    @IBAction func btn7(_ sender: Any) {
        if !game.board[2][0].ischecked() {
            btn7.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 2, p2: 0)
        }
    }
    @IBAction func btn8(_ sender: Any) {
        if !game.board[2][1].ischecked() {
            btn8.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 2, p2: 1)
        }
    }
    @IBAction func btn9(_ sender: Any) {
        if !game.board[2][2].ischecked() {
            btn9.backgroundColor = game.getCurrentPlayerColor()
            gameTurn(p1: 2, p2: 2)
        }
    }
    
}

