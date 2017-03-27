//
//  RootViewController.swift
//  GreenRefactoring
//
//  Created by DaichiSaito on 2017/03/17.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print(0)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
            vc.request = NiftyAPI.SearchWearImage()
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        case 1:
            print(1)
        case 2:
            print(2)
        default:
            print("default")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
