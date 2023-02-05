//
//  APISession.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import Foundation
import UIKit

// Web API用クラス
extension APIData {
    
        // Web API用メソッド
        func getAPIData() async {
                    
            // リクエストURLの組み立て
            guard let req_url = URL(string: "https://cooking-records.ex.oishi-kenko.com/cooking_records?limit=100") else {
                return
            }
            print(req_url)
            
            do {
                // リクエストURLからダウンロード
                let (data , _) = try await URLSession.shared.data(from: req_url)
                
                // JSONDecoderのインスタンス取得
                let decoder = JSONDecoder()
                
                // 受け取ったJSONデータをパース（解析）して格納
                let json = try decoder.decode(ResultJson.self, from: data)
                
                // 情報が取得できているか確認
                guard let items = json.cooking_records else { return }
                
                // @Publishedの変数を更新するときはメインスレッドで更新する必要がある
                DispatchQueue.main.async {
                    
                    // リストを初期化
                    self.APIList.removeAll()
                    
                    // 取得している数だけ処理
                    for cooking_records in items {
                        // 画像URL等をアンラップ
                        if let image_url = cooking_records.image_url,
                           let comment = cooking_records.comment,
                           let recipe_type = cooking_records.recipe_type,
                           let recorded_at = cooking_records.recorded_at{
                            // 構造体でまとめて管理
                            let APIData = APIItem(image_url: image_url, comment: comment, recipe_type: recipe_type, recorded_at: recorded_at)
                            // 配列へ追加
                            self.APIList.append(APIData)
                        }
                    }
                    print(self.APIList)
                }
                
            } catch {
                // エラー処理
                print("エラーが出ました")
            }
        }
    }
