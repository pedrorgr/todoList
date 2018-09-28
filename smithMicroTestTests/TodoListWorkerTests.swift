//
//  smithMicroTestTests.swift
//  smithMicroTestTests
//
//  Created by pedroribeiro on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import XCTest
@testable import smithMicroTest

class TodoListWorkerTests: XCTestCase {
    
    var sut:TodoListWorker?
    let mockService:serviceSpy?
    
    override func setUp() {
        super.setUp()
        
        mockService = serviceSpy()
        sut = TodoListWorker(service:mockService)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    class serviceSpy:Service {
        
        var addItemsCalled = false
        var itemsListCalled = false
        var deleteItemCalled = false

        func saveItem(text: String, userId: String) {
            
            addItemsCalled = true
        }
        
        func itemsList(userId: String, completion: @escaping ([Item]) -> ()) {
            
            itemsListCalled = true
        }
        
        func deleteItem(item: Item) {
            
            deleteItemCalled = true
        }

    }

    func testWorkerShouldCallAddItemsMethod() {
        
        //Given
        let title = "test"
        let userIdTest = "id"
    
        //When
        sut?.addItems(text: title, userId: userIdTest)
        
        //Then
        XCTAssert(mockService?.addItemsCalled, "Add items was called")
    }
    
}
