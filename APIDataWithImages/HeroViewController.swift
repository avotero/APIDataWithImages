//
//  HeroViewController.swift
//  APIDataWithImages
//
//  Created by administrator on 8/4/20.
//  Copyright © 2020 Adrian. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var legsLabel: UILabel!
    
    var item: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = item?.name
        attributeLabel.text = item?.type
        descriptionLabel.text = item?.description
        legsLabel.text = "\((item?.id)!)"
        
        let urlString = "\((item?.icon_large)!)"
        let url = URL(string: urlString)
        imageView.downloaded(from: url!)
    }
    
}
