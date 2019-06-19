//
//  ViewControllerTests.swift
//

import XCTest
@testable import AnalyticFramework

class ViewControllerTests: XCTestCase {
    
    var vc: ViewController!
    
    var wildcardExampleTracker: WildcardEventTracker!
    var wildcardLaunchOnlyTracker: WildcardEventTracker!
    
    let userInteractedWithAppEventName = "User interacted with the app"
    
    override func setUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        vc = (sb.instantiateInitialViewController() as? ViewController)!
        vc.loadView()
        
        wildcardExampleTracker = WildcardEventTracker(customEventSupport: ExampleTracker().isEventNameSupported)
        wildcardLaunchOnlyTracker = WildcardEventTracker(customEventSupport: LaunchOnlyTracker().isEventNameSupported)
        
        for tracker in EventTrackerKeys.allCases {
            switch tracker {
            case .exampleTracker:
                vc.analytics.addEventTracker(key: EventTrackerKeys.exampleTracker.key, tracker: wildcardExampleTracker)
            case .launchOnlyTracker:
                Analytics.shared.addEventTracker(key: tracker.key, tracker: wildcardLaunchOnlyTracker)
            }
        }
        
    }
    
    func testInitialization() {
        XCTAssertNotNil(vc)
    }
    
    func testViewDidLoad() {
        vc.viewDidLoad()
        XCTAssertEqual(wildcardLaunchOnlyTracker.lastEventTracked, "Launch")
        XCTAssertEqual(wildcardLaunchOnlyTracker.lastParameterTracked, "")
        XCTAssertEqual(wildcardLaunchOnlyTracker.eventCount, 1)
        XCTAssertEqual(wildcardLaunchOnlyTracker.parameterCount, 0)
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, "")
        XCTAssertEqual(wildcardExampleTracker.eventCount, 0)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 0)
    }
    
    func testButtonPressed() {
        vc.buttonPressed()
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, "BUTTON_PRESSED")
        XCTAssertEqual(wildcardExampleTracker.lastParameterTracked, "")
        XCTAssertEqual(wildcardExampleTracker.eventCount, 1)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 0)
    }
    
    func testSwitchToggled() {
        vc.switchToggled(vc.toggle)
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, userInteractedWithAppEventName)
        XCTAssertEqual(wildcardExampleTracker.lastParameterTracked, #"[AnyHashable("Toggled Switch"): true]"#)
        XCTAssertEqual(wildcardExampleTracker.eventCount, 1)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 1)
    }
    
    func testsliderChanged() {
        vc.sliderChanged(vc.slider)
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, userInteractedWithAppEventName)
        XCTAssertEqual(wildcardExampleTracker.lastParameterTracked, #"[AnyHashable("Moved Slider"): 0.5]"#)
        XCTAssertEqual(wildcardExampleTracker.eventCount, 1)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 1)
    }
    
    func testSegmentChanged() {
        vc.segmentChanged(vc.segments)
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, userInteractedWithAppEventName)
        XCTAssertEqual(wildcardExampleTracker.lastParameterTracked, #"[AnyHashable("Selected Segment"): 0]"#)
        XCTAssertEqual(wildcardExampleTracker.eventCount, 1)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 1)
    }
    
    func testTrackAllValues() {
        vc.trackAllValues()
        XCTAssertEqual(wildcardExampleTracker.lastEventTracked, userInteractedWithAppEventName)
        XCTAssertTrue(wildcardExampleTracker.lastParameterTracked.contains(#"AnyHashable("Selected Segment"): 0"#))
        XCTAssertTrue(wildcardExampleTracker.lastParameterTracked.contains(#"AnyHashable("Switch State"): true"#))
        XCTAssertTrue(wildcardExampleTracker.lastParameterTracked.contains(#"AnyHashable("Slider Position"): 0.5"#))
        XCTAssertEqual(wildcardExampleTracker.eventCount, 1)
        XCTAssertEqual(wildcardExampleTracker.parameterCount, 1)
    }
}
