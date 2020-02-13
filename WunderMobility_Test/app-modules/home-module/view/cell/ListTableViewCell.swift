//
//  ListTableViewCell.swift
//  WunderMobility_Test
//
//  Created by Farhan Mirza on 12/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class ListTableViewCell : UITableViewCell {
    
    
    let nameLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.DemiBold, fontSize: 16)
    
    let engineTypeLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 15)
    
    let addressLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 14)
    
    let fuelLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 13)
    
    let exteriorLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 13)
    
    let interiorLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 13)
    
    let vinLabel = UIComponents.shared.label(text: "", alignment: .left, color: UIColor.AppColor.defaultBlue, fontName: FontName.Medium, fontSize: 13)
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:   reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    func setupViews() {
        addSubViews(views: nameLabel,engineTypeLabel,addressLabel,fuelLabel,interiorLabel,exteriorLabel,vinLabel)
        addHConstraint(leftInset: 16, rightInset: 16, views: [nameLabel,engineTypeLabel,addressLabel,fuelLabel,interiorLabel,exteriorLabel,vinLabel])
        addConstraintsWithFormat("V:|-16-[v0]-2-[v1]-2-[v2]-2-[v3]-2-[v4]-2-[v5]-2-[v6]-16-|", views: nameLabel,engineTypeLabel,addressLabel,fuelLabel,interiorLabel,exteriorLabel,vinLabel)
        
    }
    
    func bindData(data : Vehicle) {
        nameLabel.text = "Name: " + data.name
        engineTypeLabel.text = "Engine-Type: " + data.engineType
        addressLabel.text = "Address: " + data.address
        fuelLabel.text = "Fuel: \(data.fuel)"
        interiorLabel.text = "Interior: " + data.interior
        exteriorLabel.text = "Exterior: " + data.exterior
        vinLabel.text = "Vin: " + data.vin
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
