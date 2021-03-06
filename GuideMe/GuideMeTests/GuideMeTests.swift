//
//  GuideMeTests.swift
//  GuideMeTests
//
//  Created by Pea M. Tyczynska on 06/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import XCTest
import Alamofire
import CoreLocation
@testable import GuideMe

class GuideMeTests: XCTestCase {
    
    var viewController : ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
    }
    
    func testBackgroundColorisBlack() {
        let backgroundColor = viewController.view.backgroundColor
        XCTAssertEqual(backgroundColor, UIColor.black)
    }
    
    func testStartMessageIsGuideMe() {
        let startMessage = viewController.distanceReading.text
        XCTAssertEqual(startMessage, "Welcome to Guide Me")
    }
    
    func testFontStyle() {
        let fontStyle = viewController.distanceReading.font.fontName
        XCTAssertEqual(fontStyle, "Courier-Bold")
    }
    
    func testReplyFromBeaconMinorFromRoad1() {
        viewController.giveDirections(beaconNumber: 1)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Stairs ahead, follow the handrail on the left, go down 13 steps")
    }
    
    func testReplyFromBeaconMinorFromRoad41693() {
        viewController.giveDirections(beaconNumber: 41693)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Follow the handrail left, 180 degrees, go down 13 steps")
    }
    

    func testReplyFromBeaconMinorFromRoad49281() {
        viewController.giveDirections(beaconNumber: 49281)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are at the bottom of the stairs, keep right against the wall, walk straight ahead")
    }
    
    func testReplyFromBeaconMinorFromRoad5300() {
        viewController.giveDirections(beaconNumber: 50300)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Turn left to approach the ticket barriers")
    }
    
    func testReplyFromBeaconMinorFromRoad5500() {
        viewController.giveDirections(beaconNumber: 50500)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Ticket machines are on your left, keep left for the wide gate")
    }
    
    func testReplyFromBeaconMinorFromRoad50800() {
        viewController.giveDirections(beaconNumber: 50800)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Turn right for Westbound platform")
    }
    

    func testReplyFromBeaconMinorFromRoad651659() {
        viewController.giveDirections(beaconNumber: 50800)
        viewController.giveDirections(beaconNumber: 65159)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are now on the Westbound platform")
    }
    

    func testReplyFromBeaconMinorFromTrain1() {
        viewController.lastBeacon = 41693
        viewController.giveDirections(beaconNumber: 1)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are now exiting Algate station")
    }

    func testReplyFromBeaconMinorFromTrain41693() {
        viewController.lastBeacon = 49281
        viewController.giveDirections(beaconNumber: 41693)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Follow the handrail left, 180 degrees, go up 13 steps")
    }
    
    func testReplyFromBeaconMinorFromTrain49281() {
        viewController.lastBeacon = 50500
        viewController.giveDirections(beaconNumber: 49281)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Stairs ahead, go up 13 steps, handrail on your left")
    }
    
    func testReplyFromBeaconMinorFromTrain50500() {
        viewController.lastBeacon = 50800
        viewController.giveDirections(beaconNumber: 50500)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are approaching the ticket barriers, keep right for the wide gate")
    }
    
    func testReplyFromBeaconMinorFromTrain50800() {
        viewController.lastBeacon = 60000
        viewController.giveDirections(beaconNumber: 50800)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Turn right for Commercial Street")
    }
    
    func testReplyFromBeaconMinorFromTrain60000() {
        viewController.lastBeacon = 65159
        viewController.giveDirections(beaconNumber: 60000)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "Turn left for WhiteChapel Road")
    }
  
    
    func testReplyFromBeaconMinorFromTrain65159() {
        viewController.lastBeacon = 65159
        viewController.giveDirections(beaconNumber: 65159)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are now on the Aldgate platform")
    }
    
    func testReplyFromANoneExistingBeacon8000() {
        viewController.giveDirections(beaconNumber: 65159)
        viewController.giveDirections(beaconNumber: 80000)
        let message = viewController.distanceReading.text
        XCTAssertEqual(message, "You are now on the Aldgate platform")
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}
