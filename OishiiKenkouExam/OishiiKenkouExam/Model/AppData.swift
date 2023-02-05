//
//  AppData.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import Foundation
import UIKit

// Identifiableプロトコルを利用して、情報をまとめる構造体
struct APIItem: Identifiable {
    let id = UUID()
    let image_url: URL
    let comment: String
    let recipe_type: String
    let recorded_at: String
}

// APIデータ用クラス
class APIData: ObservableObject {
    
    // JSONのデータ構造
    struct ResultJson: Codable {
        // JSONのCooking_records内のデータ構造
        struct Cooking_records: Codable {
            // イメージ画像のURL
            let image_url: URL?
            // コメント
            let comment: String?
            // レシピの種類
            let recipe_type: String?
            // 掲載日時
            let recorded_at: String?
        }
        // 複数要素
        let cooking_records: [Cooking_records]?
    }
    
    // データのリスト（Identifiableプロトコル）
    @Published var APIList: [APIItem] = []
}
