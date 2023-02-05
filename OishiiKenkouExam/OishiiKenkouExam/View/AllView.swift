//
//  AllView.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import SwiftUI

//1枚目のビュー(全ての記録)
struct AllView: View {
    
    // APIDataを参照する状態変数
    @StateObject var APIDataList = APIData()
    
    var body: some View {
        // 垂直にレイアウト（縦方向にレイアウト）
        VStack {
            // タイトルを記載
            Text("料理記録アルバム(全ての記録)")
            // .taskは非同期で処理を実行できる
                .task {
                    await APIDataList.getAPIData()
                }
                // 上下左右に空白を空ける
                .padding()
                    
                    // リスト表示する
                    List(APIDataList.APIList) { APIData in
                        // 1つ1つの要素を取り出す
                            
                            // Listの表示内容を生成する
                            VStack {
                                
                                // 各々の写真を表示する
                                PicView(url: APIData.image_url)
                                
                                // 記録コメントなどを表示する
                                CommentView(comment: APIData.comment, rec: APIData.recorded_at)
                                
                            } // VStackここまで
                        
                            // 画面下部がセーフエリア外までいっぱいなるように指定
                            .edgesIgnoringSafeArea(.bottom)
                        
                    } // Listここまで
                } // VStackここまで
        } // bodyここまで
    } // Viewここまで
