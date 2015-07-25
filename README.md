# iOSAppTemplateSwift
iOS application template implementing Model View Controller pattern in Swift
iOS has its specifics: application interfaces are made of separate screens (scenes), this is why it has the storyboard feature.
There is a UIViewController class that looks like a controller in MVC pattern, while it is actually not: it is always a mix of a business logic and view implementation specific things (there are always a lot of IBActions and IBOutlets there).
