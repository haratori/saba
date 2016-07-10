import UIKit
import PagingMenuController


private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    private var pagingControllers: [UIViewController] {
        let viewController1 = L3_1ViewController()
        let viewController2 = L3_2ViewController()
        return [viewController1, viewController2]
    }
    
    private struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .SegmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
    }
    
    private struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "First Menu"))
        }
    }
    private struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "Second Menu"))
        }
    }
}

class L3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()
        
        //表示オプション
        let options = PagingMenuOptions()
        
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 20
        pagingMenuController.view.frame.size.height -= 20
        
        self.addChildViewController(pagingMenuController)
        self.view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}