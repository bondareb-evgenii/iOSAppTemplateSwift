import Foundation
import UIKit

protocol AppControllerSegueProtocol
  {
  var sourceSceneController: SceneController! {get set}
  var destinationSceneController: SceneController! {get set}
  func perform()
  }

//Subclasses are very specific classes, every one of them:
// - Knows everything about both AppControllerStates and ViewControllers it is transfering between
// - Lives for a very short time while transitioning
// - Is needed to transfer data in between AppControllerStates and ViewControllers
// - Helps to minimize connectivity between states and avoid having one superheavy and smart object than knows everything about every AppControllerState and ViewController

@objc class AppControllerSegue: NSObject, AppControllerSegueProtocol//NSObject and @objc is needed for reflection to work, see BaseViewController.prepareForSegue()
  {
  var sourceSceneController: SceneController!
  
  var destinationSceneController: SceneController!
  
  var visualSegue: UIStoryboardSegue!
  
  func perform()
    {
    let isSegueBack = self.visualSegue.identifier!.hasPrefix("BackFrom")
    if (!isSegueBack)
      {
      saveSourceViewControllerState();
      saveSourceAppControllerState();
      }
    else
      {
      loadDestinationAppControllerState();
      loadDestinationViewControllerState();
      }
    
    AppController.sharedAppController.currentState = self.destinationSceneController as! AppControllerState
    }
  
  //Helper methods:
  
  func saveSourceAppControllerState()
    {
    if let persistentState = (sourceSceneController as StateSerializable).persistentState?()
      {
      NSUserDefaults.standardUserDefaults().setObject(persistentState, forKey: NSStringFromClass(sourceSceneController!.dynamicType) + "_State")
      }
    }
  
  func loadDestinationAppControllerState()
    {
    if let persistentState = NSUserDefaults.standardUserDefaults().objectForKey(NSStringFromClass(destinationSceneController!.dynamicType) + "_State")
      {
      destinationSceneController.loadPersistentState?(persistentState)
      }
    }
  
  func saveSourceViewControllerState()
    {
    if let persistentState = (visualSegue.sourceViewController as? StateSerializable)?.persistentState?()
      {
      NSUserDefaults.standardUserDefaults().setObject(persistentState, forKey: NSStringFromClass(visualSegue.sourceViewController.dynamicType) + "_ViewControllerState")
      }
    }
  
  func loadDestinationViewControllerState()
    {
    let destinationViewController = visualSegue.destinationViewController as! StateSerializable
    if let persistentState = NSUserDefaults.standardUserDefaults().objectForKey(NSStringFromClass(destinationViewController.dynamicType) + "_ViewControllerState")
      {
      destinationViewController.loadPersistentState?(persistentState)
      }
    }
  }
