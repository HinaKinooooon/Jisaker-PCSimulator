//
//  PCPart.swift
//  Jisaker-PCSimulator
//
//  Created by 木下陽汰 on 2024/11/21.
//

import Foundation
import RealmSwift


// パーツのモデルクラスを作成
class PCPart: Object {
    @objc dynamic var name: String = "" // パーツ名
    @objc dynamic var price: Double = 0.0 // 価格
    @objc dynamic var type: String = "" // パーツの種類 (CPU, GPUなど)
    @objc dynamic var compatibility: String = "" //互換性情報(簡易化のため文字列
}

func savePart(name: String, price: Double, type: String, compatibility: String) {
    let newPart = PCPart()
    newPart.name = name
    newPart.price = price
    newPart.type = type
    newPart.compatibility = compatibility
    
    let realm = try! Realm()
    
    try! realm.write {
        realm.add(newPart)
    }
}

func fetchPCParts() -> [PCPart] {
    let realm = try! Realm()
    let parts = realm.objects(PCPart.self)
    return Array(parts)
}
