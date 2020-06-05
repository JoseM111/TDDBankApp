import XCTest
// @testable is a property wrapper to import
// modules into your unit testing project
@testable import TDDBankApp

// Base class for all the other test classes
class Setup_Account: XCTestCase {
    // MARK: #©Source-Of-Truth
    var acc: Account!

    // MARK: _©Test XCTestCase
    /**©-----------------------©*/
    override func setUp() {
        // Will run depending on how many test functions there are. 🤔
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
}

class BDD_when_creating_a_bank_account: Setup_Account {
    // MARK: _©Test-Funcs
    /**©------------------------------------------------------------------------------©*/
    func test_should_initialize_account_with_balance_zero() {
        XCTAssertEqual(0, acc.balance)
    }

    /**©------------------------------------------------------------------------------©*/
}

class BDD_depositing_money_into_bank_account: Setup_Account {
    // MARK: _©Test-Funcs
    /**©------------------------------------------------------------------------------©*/
    func test_should_deposit_successfully() {
        acc.deposit(100)
        XCTAssertEqual(100, acc.balance)
    }
    /**©------------------------------------------------------------------------------©*/
}

class BDD_withdrawing_funds_from_account: Setup_Account {
    // MARK: _©Test-Funcs
    /**©------------------------------------------------------------------------------©*/
    func test_should_deduct_amount_successfully() {
        acc.deposit(100)
        try? acc.withdraw(50)

        XCTAssertEqual(50, acc.balance)
    }

    func test_should_throw_exception_when_there_is_insufficient_funds() {
        acc.deposit(150)
        XCTAssertThrowsError(try acc.withdraw(300)) { error in
            XCTAssertEqual(error as? AccError, AccError.insufficientFunds)
        }
    }
    /**©------------------------------------------------------------------------------©*/
}
