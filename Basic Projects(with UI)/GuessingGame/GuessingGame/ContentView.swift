import SwiftUI

struct ContentView: View {
    @State private var randomNumber = Int.random(in: 1...25)
    @State private var userGuess: String = ""
    @State private var attemptsLeft = 5
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var gamesPlayed = 0
    @State private var gamesWon = 0
    @State private var gamesLost = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Guess the number between 1 and 25!")
                
                TextField("Enter your guess", text: $userGuess)
                    .keyboardType(.numberPad)
                    .padding()
                    .border(Color.gray, width: 1)
                
                Text("Attempts left: \(attemptsLeft)")
                
                Button("Check Guess") {
                    checkGuess()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
            }
            .padding()
            .navigationBarTitle("Guessing Game")
            .navigationBarItems(trailing:
                Button(action: {
                    showStats()
                }, label: {
                    Text("Stats")
                })
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                    if alertTitle == "Congratulations!" || alertTitle == "Game Over" {
                        resetGame()
                    }
                })
            }
        }
    }
    
    func checkGuess() {
        guard let guessedInt = Int(userGuess) else {
            alertTitle = "Error"
            alertMessage = "Please enter a valid number."
            showingAlert = true
            return
        }
        
        if guessedInt == randomNumber {
            gamesWon += 1
            alertTitle = "Congratulations!"
            alertMessage = "You've guessed the right number!"
            showingAlert = true
            return
        } else if guessedInt > randomNumber {
            alertTitle = "Oops!"
            alertMessage = "Your guess is too high!"
        } else if guessedInt < randomNumber {
            alertTitle = "Oops!"
            alertMessage = "Your guess is too low!"
        }
        
        attemptsLeft -= 1
        
        if attemptsLeft == 0 {
            gamesLost += 1
            alertTitle = "Game Over"
            alertMessage = "The correct number was \(randomNumber)."
            showingAlert = true
        } else {
            showingAlert = true
        }
    }
    
    func resetGame() {
        randomNumber = Int.random(in: 1...25)
        attemptsLeft = 5
        userGuess = ""
        gamesPlayed += 1
    }
    
    func showStats() {
        alertTitle = "Game Stats"
        alertMessage = """
        Games Played: \(gamesPlayed)
        Games Won: \(gamesWon)
        Games Lost: \(gamesLost)
        """
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
