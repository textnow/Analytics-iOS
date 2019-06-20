//
//  ViewController.swift
//

import UIKit
import AnalyticLayer

class ViewController: UIViewController {

    // Used to show you how you can test the non-singleton pattern. 
    var analytics: AnalyticsScope = Analytics()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var segments: UISegmentedControl!
    
    override func viewDidLoad() {
        analytics.addEventTracker(key: EventTrackerKeys.exampleTracker.key, tracker: ExampleTracker())
        
        // Used to show how you would test the singleton pattern, if you decide to use it.
        Analytics.shared.track(event: ExampleEvents.launch)
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed() {
        analytics.track(event: ExampleEvents.buttonPressed)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        analytics.track(event: ExampleEvents.userInteractedWithApp, with: ExampleParameterEnum.toggledSwitch(sender.isOn).parameter)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        analytics.track(event: ExampleEvents.userInteractedWithApp, with: ExampleParameterEnum.movedSlider(sender.value).parameter)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        analytics.track(event: ExampleEvents.userInteractedWithApp, with: ExampleParameterEnum.selectedSegment(sender.selectedSegmentIndex).parameter)
    }
    
    @IBAction func trackAllValues() {
        analytics.track(event: ExampleEvents.userInteractedWithApp, with: ExampleParameterEnum.exampleMultiple(segments.selectedSegmentIndex, toggle.isOn, slider.value).parameter)
    }
}
