import Foundation

//@objc(ClassName) is needed to avoid having a module name in the class name for reflection, see BaseViewController.prepareForSegue()
@objc(FirstToSecond) class FirstToSecond : AppControllerSegue
  {
  override func perform()
    {
    let destinationState = AppControllerStateSecond()
    destinationState.viewController = self.visualSegue.destinationViewController
    self.destinationSceneController = destinationState
    //Transfer any data between AppControllerStates and ViewControllers here
    super.perform()
    }
  }
