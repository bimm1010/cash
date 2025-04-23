//
//  ModelList.swift
//  CaseManager
//
//  Created by Hoàng Nam on 22/4/25.
//

import Foundation
import SwiftUICore


struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let color: Color
}


let categories: [Category] = [
    .init(name: "Ăn Uống", image: "eat", color: .orange),
    .init(name: "Chi tiêu", image: "wash", color: .green),
    .init(name: "Quần áo", image: "Clothes", color: .purple),
    .init(name: "Mỹ Phẩm", image: "Makeup", color: .pink),
    .init(name: "Giao Lưu", image: "Playmoney", color: .yellow),
    .init(name: "Y tế", image: "pharmacy", color: .green),
    .init(name: "Giáo dục", image: "Study", color: .red),
    .init(name: "Tiền Điện", image: "Electricmoney", color: .blue),
    .init(name: "Đi lại", image: "Goto", color: .brown),
    .init(name: "Liên lạc", image: "Phonemoney", color: .black),
    .init(name: "Tiền nhà", image: "Homemoney", color: .orange),
    .init(name: "Internet", image: "Internetmoney", color: .pink),
    ]
