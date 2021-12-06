
import Foundation

import UIKit

class Game {
    var currentPlayer = 1
    var winner = "undefined"
    var isGameOver = false
    var isGameWon = false
    var filledCells = 0
    var board = [[Cell(1),Cell(2),Cell(3)],[Cell(4),Cell(5),Cell(6)],[Cell(7),Cell(8),Cell(9)]]
    func newTurn(p1: Int, p2: Int){
        //player finishes turn
        changeCell(p1: p1, p2: p2)
        //check if there is a streak or possible streak
        if isStraek() {
            print("it is a streak")
            setWinner()
            isGameOver = true
            isGameWon = true
        }
        else if isboardfull() {
            //tie
            print("the board is full, it is a tie")
            isGameOver = true
        }
        else {
            //prepare for next turn
            changePlayer()
        }
    }
    func setWinner() {
        if currentPlayer == 1 {winner = "Red"}
        else {winner = "Blue"}
    }
    private func changePlayer() {
        if currentPlayer == 1 { currentPlayer = 2 }
        else { currentPlayer = 1 }
    }
    func getCurrentPlayerColor() -> UIColor {
        if currentPlayer == 1 {return UIColor.red}
        else {return UIColor.blue}
    }
    private func changeCell(p1: Int, p2: Int) {
        board[p1][p2].check(currentPlayer)
        filledCells += 1
    }
    private func isStraek() -> Bool {
        let p = currentPlayer
        //search row
        let r1 = board[0][0].player == p && board[0][1].player == p && board[0][2].player == p
        let r2 = board[1][0].player == p && board[1][1].player == p && board[1][2].player == p
        let r3 = board[2][0].player == p && board[2][1].player == p && board[2][2].player == p
        //search column
        let c1 = board[0][0].player == p && board[1][0].player == p && board[2][0].player == p
        let c2 = board[0][1].player == p && board[1][1].player == p && board[2][1].player == p
        let c3 = board[0][2].player == p && board[1][2].player == p && board[2][2].player == p
        //search diagonal
        let d1 = board[0][0].player == p && board[1][1].player == p && board[2][2].player == p
        let d2 = board[0][2].player == p && board[1][1].player == p && board[2][0].player == p
        return r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
    }
    private func isboardfull() -> Bool {
        if filledCells == 9 { return true }
        else { return false }
    }
}

class Cell {
    var id: Int
    var player = 0 //no player yet
    var checked = false
    init(_ id: Int) {
        self.id = id
    }
    func check(_ player: Int){ //player is eaither 1 or 2
        self.player = player
        checked = true
    }
    func ischecked() -> Bool{
        return checked
    }
}



