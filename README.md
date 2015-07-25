# iOSAppTemplateSwift
iOS application template implementing Model View Controller pattern in Swift.
iOS has its specifics: application interfaces are made of separate screens (scenes), this is why it has the storyboard feature.
There is a UIViewController class that looks like a controller in MVC pattern, while it is actually not: it is always a mix of a business logic and view implementation specific things (there are always a lot of IBActions and IBOutlets there). Let’s think of it as a part of a View as well as UIView.
There is also a class implementing UIApplicationDelegate protocol which is definitely a controller, but the global one.
Let's create controllers specific for concrete screen (scene) and call them AppControllerStates.
Let's also call the UIApplicationDelegate implementation AppController.
Let's transfer system events like willResignActive or didRecieveMemoryWarning from the AppController to the current AppControllerState.
Let's make it possible for UIViewControllers to send View specific events back to their AppControllerStates (specific AppControllerState knows it's UIViewController class with all its features, while UIViewController can only send some messages which specific AppControllerState made available).
Let's make it possible to save both AppControllerState and UIViewController current state on every transition to a new screen so that we can go back to the last state in case if the application is killed in background for example. We can also create custom subclasses of UIStoryboardSegue that will kill the previous UIViewController (as well as AppControllerState) to save memory and load everything back when doing an unwind segue.
Let's avoid creating the one huge object knowing everything about all the AppControllerStates and UIViewControllers, but make several small but very specific AppControllerSegue classes instead. Every one of them knows how to transfer data between two specific AppControllerStates as well as UIViewControllers, but nothing more than that.
Let's create those AppControllerSegue classes in runtime by their class names written as Identifiers of UIStoryboardSegue objects in story board file.
