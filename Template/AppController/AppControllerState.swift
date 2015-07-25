import UIKit


@objc protocol AppControllerStateProtocol: SceneController
  {
  // should not be called explicitly (are called by application controller)
  optional func applicationDidReceiveMemoryWarning(application:UIApplication)
  optional func applicationWillResignActive(application: UIApplication)
  optional func applicationDidBecomeActive(application: UIApplication)
  optional func applicationDidEnterBackground(application: UIApplication)
  optional func applicationWillEnterForeground(application: UIApplication)
  optional func applicationWillTerminate(application: UIApplication)
  }

@objc class AppControllerState: EquatableBase, AppControllerStateProtocol
  {
  var viewController: UIViewController!
  
  override func isEqualTo(other: EquatableBase) -> Bool
    {
    let otherDynamic = other as! AppControllerState
    return  super.isEqualTo(other) &&
            self.viewController == otherDynamic.viewController
    }
  }
