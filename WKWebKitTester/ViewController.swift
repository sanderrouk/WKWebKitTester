import WebKit
import UIKit

final class ViewController: UIViewController {

    private let addressBar = UITextField()
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        addressBar.textColor = .black

        view.addSubview(addressBar)
        addressBar.text = "https://google.com"
        addressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addressBar.heightAnchor.constraint(equalToConstant: 40),
            addressBar.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),
            addressBar.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])


        let goButton = UIButton(type: .system)
        goButton.addTarget(self, action: #selector(loadFromAddress), for: .touchUpInside)
        goButton.setTitle("Go", for: .normal)

        view.addSubview(goButton)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goButton.centerYAnchor.constraint(equalTo: addressBar.centerYAnchor),
            goButton.leftAnchor.constraint(equalTo: addressBar.rightAnchor, constant: 10),
            goButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])

        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: addressBar.topAnchor)
        ])

        loadFromAddress()
    }

    @objc private func loadFromAddress() {
        let url = URL(string: addressBar.text!)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}

