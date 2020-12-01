/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Implements a view controller introducing each flower product.
*/

import UIKit
import AVFoundation
import Vision

class ProductViewController: UIViewController {
    
    @IBOutlet var productView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var productPhoto: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var myLabel: UITextField!
    
    @IBOutlet weak var uiDeviceName: UILabel!
    @IBOutlet weak var manufactuer: UILabel!
    @IBOutlet weak var devicePhoto: UIImageView!
    
    @IBOutlet weak var trackerDomains: UILabel!
    @IBOutlet weak var dataRequestsPerHour: UILabel!
    @IBOutlet weak var usesCamera: UILabel!
    @IBOutlet weak var usesMicrophone: UILabel!
    // This is an array of dictionaries.
    @IBOutlet weak var usesLocation: UILabel!
    
    @IBOutlet weak var oRec: UILabel!
    @IBOutlet weak var security: UILabel!
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var ownership: UILabel!
    @IBOutlet weak var gov: UILabel!
    
    @IBOutlet weak var oRecImage: UIImageView!
    @IBOutlet weak var securityImage: UIImageView!
    @IBOutlet weak var privacyImage: UIImageView!
    @IBOutlet weak var govImage: UIImageView!
    
    @IBOutlet weak var ownershipImage: UIImageView!
    
    // My beautiful fake data definitions since current model always returns high percentage
    let deviceDefinitions: [[String: String]] = [[
        "company": "Amazon",
        "deviceName":"Echo",
        "imgName":"echo"
    ], [
        "company": "Amazon",
        "deviceName":"Ring",
        "imageName":"ring"
    ], [
        "company": "Google",
        "deviceName":"Google Home"
    ]]
    var count = 0
    var productID: String!
    var productCatalog: [String: [String: Any]]!
    
    @IBAction func dismissProductView(_ sender: Any) {
        dismiss(animated: true) {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Read the product catalog from the plist file into the dictionary.
        if let path = Bundle.main.path(forResource: "MicroCatalog", ofType: "plist") {
            productCatalog = NSDictionary(contentsOfFile: path) as? [String: [String: Any]]
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        productView.layer.masksToBounds = true
        
        //Just for testing, who needs real data?
        //let randomIndex = Int.random(in: 0...2)
        
        // Uncomment these lines if you wanna just test with random display data
        //manufactuer.text = deviceDefinitions[randomIndex]["company"]
        // var deviceName = deviceDefinitions[randomIndex]["deviceName"]!
       // uiDeviceName.text = deviceDefinitions[randomIndex]["deviceName"]

        // Product ID correlates to the label coming from the .mlmodel
        // We need to make sure that the key of that label matches up to the entry in Device catalog.plist
        print("Attempting to pull up info for ")
        
        if (productID.contains("Amazon")) {
            productID = "Amazon_Echo"
        } else {
            productID = "Google_Home_Mini"
        }
        
        
        
        print(productID)
        if (productCatalog.keys.contains(productID)) {
            // Print out whole entry for found Item
            print(productCatalog[productID])
            
            // Print out found label
            print("Product ID : " + productID)
            var deviceName = productCatalog[productID]?["label"] as? String
            
            dataRequestsPerHour.text = productCatalog[productID]?["dataRequestsPerHour"] as? String

            trackerDomains.text = productCatalog[productID]?["trackerDomains"] as? String
            usesCamera.text = productCatalog[productID]?["usesCamera"] as? String
            usesMicrophone.text = productCatalog[productID]?["usesMicrophone"] as? String
            usesLocation.text = productCatalog[productID]?["usesLocation"] as? String

            manufactuer.text = productCatalog[productID]?["manufacturer"] as? String
            
            //Recommendations

//            security.text = productCatalog[productID]?["security"] as? String
//            privacy.text = productCatalog[productID]?["privacy"] as? String
//            ownership.text = productCatalog[productID]?["ownership"] as? String
//            gov.text = productCatalog[productID]?["governance"] as? String
            let imgName = productCatalog[productID]?["orec"] as? String
            oRecImage.image = UIImage(named: imgName! + "circle.png")
         
            let secImgName = productCatalog[productID]?["security"] as? String
            securityImage.image = UIImage(named: secImgName! + "circle.png")
            
            let privacyName = productCatalog[productID]?["privacy"] as? String
            privacyImage.image = UIImage(named: privacyName! + "circle.png")
            
            let ownName = productCatalog[productID]?["ownership"] as? String
            ownershipImage.image = UIImage(named: ownName! + "circle.png")
            
            
            let govName = productCatalog[productID]?["governance"] as? String
            govImage.image = UIImage(named: govName! + "circle.png")
            
            uiDeviceName.text = deviceName
            // Needs to correlate to file name of device in product resources directory
            let deviceImageBuffer = UIImage(named: (deviceName?.lowercased())! + ".jpg")
            devicePhoto.image = deviceImageBuffer
        } else {
          // does not contain key
            print("Device name does not exist in library ")
        }
        

            
    }
}
