//
//  RouterTest.swift
//  MVP IOS DevTests
//
//  Created by Dmitry on 24.07.2021.
//

import XCTest
@testable import MVP_IOS_Dev

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    var assembly = AssamblyModelBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assamblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC
        
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
