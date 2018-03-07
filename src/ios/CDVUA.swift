import Foundation
import WebKit

@objc(CDVUA) class CDVUA: CDVPlugin {
    
  override func pluginInitialize() {
    
    print(CDVUserAgentUtil.originalUserAgent())
    
    // 起動が終わったことを知らせる
    let center = NotificationCenter.default;
    center.addObserver(self, selector: #selector(type(of: self).finishLaunching), name: NSNotification.Name.UIApplicationDidFinishLaunching, object: nil)
    
  }
  
  func finishLaunching() {


    print("finishLaunching")
    let tmpWebView:UIWebView = UIWebView()
    let userAgent:String! = tmpWebView.stringByEvaluatingJavaScript(from: "navigator.userAgent")
    let userAgentStr = "追加のuseragent"
    let customUserAgent:String = userAgent + userAgentStr
    print(customUserAgent)
    let dic:NSDictionary = ["UserAgent":customUserAgent]
 
//    CDVUserAgentUtil.acquireLock({ lockToken in
//        CDVUserAgentUtil.setUserAgent("fffffffffffffffffff", lockToken: lockToken)
//        CDVUserAgentUtil.releaseLock(CDVViewController().userAgentLockToken)
//    })
    
    UserDefaults.standard.register(defaults: dic as! [String : AnyObject])
    let userAgent2:String! = tmpWebView.stringByEvaluatingJavaScript(from: "navigator.userAgent")
//    print(userAgent2)
//    let wkwebview  = WKWebView()
//    wkwebview.customUserAgent = customUserAgent

  }
}
