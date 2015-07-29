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

@objc class AppControllerState: NSObject, EquatablePolymorphic, AppControllerStateProtocol
  {
  var viewController: UIViewController!
  
  func isEqualTo(other: AppControllerState) -> Bool
    {
    if self.dynamicType != other.dynamicType
      {
      return false;
      }
    return  self.viewController == other.viewController
    }
  }
