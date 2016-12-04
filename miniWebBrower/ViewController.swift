//
//  ViewController.swift
//  miniWebBrower
//
//  Created by DongSu Han on 2016. 12. 5..
//  Copyright © 2016년 DongSuHan. All rights reserved.
//

import UIKit

//텍스트 필드에서 생기는 이벤트들을 UITextFieldDelegate가 처리해준다.
class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: UIWebView!
    
    @IBOutlet weak var spinningActivity: UIActivityIndicatorView!
    
    @IBAction func goBackButton(_ sender: Any) {
        mainWebView.goBack()
    }
    @IBAction func goForwardButton(_ sender: Any) {
        mainWebView.goForward()
    }
    
    

    @IBAction func bookMarkAction(_ sender: Any) {
        
    
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)!
        let urlString = "https://www.\(bookMarkUrl).com"
        mainWebView.loadRequest(URLRequest(url:URL(string:urlString)!));
        urlTextField.text = urlString;
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https;//"){
            urlString = "https://\(urlTextField.text!)"
        }
        mainWebView.loadRequest(URLRequest(url:URL(string:urlString)!));
        textField.resignFirstResponder();
        return true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        spinningActivity.startAnimating()
        let urlString = "https://www.facebook.com"
        //url 로드
        mainWebView.loadRequest(URLRequest(url:URL(string:urlString)!));
        urlTextField.text = urlString;
//        spinningActivity.stopAnimating()
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        spinningActivity.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivity.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

