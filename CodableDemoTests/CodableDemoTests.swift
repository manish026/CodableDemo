//
//  CodableDemoTests.swift
//  CodableDemoTests
//
//  Created by Manish on 28/11/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import XCTest
import Alamofire
@testable import CodableDemo

class CodableDemoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getData<T: Codable>(with url: String, sucess: @escaping (T)->()) {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseDecodable { (response: DataResponse<T>) in
            
            guard case let .failure(error) = response.result else {
                
                XCTAssertNotNil(response.result.value)
                print(response.result)
                
                if let model = response.result.value {
                    sucess(model)
                }
                
                return
            }
            
            
            print(error.localizedDescription)
            XCTFail()
            
            
            
        }
        
    }
    
    func test_UserResponseDecodable() {
        
        let exp = expectation(description: "Wait for response")
        
        getData(with: "https://reqres.in/api/users?page=1") { (data: UserEntity) in
            print(data)
            exp.fulfill()
            
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
        
    }
    
    func test_UserResponseJSON() {
        
        let exp = expectation(description: "Wait for response")
        
        Alamofire.request("https://reqres.in/api/users?page=1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            
            if let jsonData = response.result.value {
                
                do {
                
                let model = try JSONDecoder().decode(UserEntity.self, from: jsonData)
                    
                    exp.fulfill()
                    
                } catch let error {
                    
                    
                    assertionFailure("Unable to decode due to \(error.localizedDescription)")
                    
                }
            }
            
        }
        
         waitForExpectations(timeout: 10.0, handler: nil)
        
    }

    

}
