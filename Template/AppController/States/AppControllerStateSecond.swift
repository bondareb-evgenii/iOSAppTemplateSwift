import UIKit

@objc class AppControllerStateSecond: AppControllerState
  {
  override var viewController: UIViewController!
    {
    didSet
      {
      (self.viewController as? BaseViewController)?.setAction(Selector("test"), forTarget: self, forStateViewEvent: TestStateViewEvent)
      }
    }
  func test()
    {
    print("AppControllerStateSecond's test() method is called!!!")
    }
  

//  override func isEqualTo(other: EquatableBase) -> Bool
//    {
//    let otherDynamic = other as! AppControllerStateSecond
//    return  super.isEqualTo(other) &&
//            self.state == otherDynamic.state
//    }
  }
