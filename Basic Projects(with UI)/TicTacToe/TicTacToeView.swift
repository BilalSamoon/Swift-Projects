import SwiftUI

struct TicTacToeView: View {
    
    //true -X, false - 0
    @State private var player: Bool = Bool.random()
    
    // 3x3 Board
    @State private var board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
    ]
    
    @State private var triggerAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var attempts : Int = 9
    
    var body: some View {
        VStack {
            Text("TicTacToe")
                .font(.largeTitle)
                .foregroundColor(Color(UIColor(named: "TitleColor")!))
            
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { col in
                        Button(action: {
                            if self.board[row][col] == "" {
                                self.board[row][col] = self.player ? "X" : "O"
                                self.player.toggle()
                                self.attempts -= 1
                                
                                self.checkWinner(row: row, col: col)
                            }
                        }) {
                            Text("\(self.board[row][col])")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundColor(Color(UIColor(named: "TileTextColor")!))
                                .frame(minWidth: 70, minHeight: 70)
                                .background(Color(UIColor(named: "TileBackgroundColor")!))
                        }
                        .alert(isPresented: self.$triggerAlert) {
                            Alert(title: Text("\(self.alertTitle)"), message: Text("\(alertMessage)"), dismissButton: .default(Text("Dismiss")){
                                self.resetGame()
                                
                            })
                        }
                    }//ForEach
                }//HStack
            }//ForEach
        }//vstack
        
    }//BODY

    private func resetGame(){
        self.board = [
            ["", "", ""],
            ["", "", ""],
            ["", "", ""]
        ]
        self.player = Bool.random()
        self.alertTitle = ""
        self.alertMessage = ""
        self.attempts = 9
    }
    
    private func checkWinner(row: Int, col: Int) {
        let currentPlayer = self.board[row][col]
        
        // Check rows
        if self.board[row][0] == currentPlayer && self.board[row][1] == currentPlayer && self.board[row][2] == currentPlayer {
            self.alertTitle = "Winner"
            self.alertMessage = "Player \(currentPlayer) wins"
            self.triggerAlert = true
        }
        
        // Check columns
        if self.board[0][col] == currentPlayer && self.board[1][col] == currentPlayer && self.board[2][col] == currentPlayer {
            self.alertTitle = "Winner"
            self.alertMessage = "Player \(currentPlayer) wins"
            self.triggerAlert = true
        }
        
        if (self.attempts <= 0){
            self.alertTitle = "Game Over"
            self.alertMessage = "Better Luck Next time"
            self.triggerAlert =  true
        }
    }

}



struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
