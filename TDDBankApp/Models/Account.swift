import Foundation

enum AccError: Error {
    case insufficientFunds
}

struct Account {
    var balance: Double = 0.0

    // Has to be mutating function since we are using a struct
    mutating func deposit(_ amt: Double) {
        self.balance += amt
    }
    
    mutating func withdraw(_ amt: Double) throws{
        let netBalance: Double = self.balance - amt
        if netBalance < 0 {
            throw AccError.insufficientFunds
        } else {
            self.balance -= amt
        }
    }
}
