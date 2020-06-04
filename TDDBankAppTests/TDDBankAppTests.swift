import XCTest
// @testable is a property wrapper to import
// modules into your unit testing project
@testable import TDDBankApp

class TDDBankAppTests: XCTestCase {

    internal var acc: Account!

    // MARK: #©setUp will be run before each & every test
    /**©-----------------------©*/
    override func setUp() {
        printf("Created ()--> running func test")
        super.setUp()
        // Initializing our object
        self.acc = Account()
    }

    override func tearDown() {
        // Will run depending on how many test functions there are. 🤔
        printf("Destroyed ()--> running func test")
        acc = nil
        super.tearDown()
        print("")
    }
    /**©-----------------------©*/

    // MARK: _©Test-Funcs
    /**©------------------------------------------------------------------------------©*/

    func test_WithdrawFromInsufficientFunds() {
        // Test covers if you have insufficient
        // funds or == 0 an error is thrown
        acc.deposit(100)
        XCTAssertThrowsError(try acc.withdraw(300)) { error in
            XCTAssertEqual(error as! AccError, AccError.insufficientFunds)
        }
    }
    
    func test_WithdrawFunds() {
        acc.deposit(100)
        try? acc.withdraw(50)

        XCTAssertEqual(50, acc.balance)
    }
    func test_InitialBalanceZero() {
        // Assert means that we either think the condition is true or false.
        //Depending on which assert function we are implementing to check either.
        printf("test_InitialBalanceZero()")
        XCTAssertTrue(acc.balance == 0, "Balance is ! == zero")
    }

    func test_DepositFunds() {
        printf("test_DepositFunds()")
        acc.deposit(100)
        XCTAssertEqual(100, acc.balance)
    }
    /**©------------------------------------------------------------------------------©*/
}
