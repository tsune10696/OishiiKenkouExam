//
//  PicView.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import SwiftUI

// 各々の写真を表示する子ビュー
struct PicView: View {
    
    var url: URL
    
    var body: some View {
        // 画像を読み込み、表示する
        AsyncImage(url: url) { image in
            // 画像を表示する
                image
                // リサイズする
                .resizable()
                // アスペクト比（縦横比）を維持してエリア内に収まるようにする
                .aspectRatio(contentMode: .fit)
                // 高さ
                .frame(height: 300, alignment: .center)
                // 上下左右に空白を空ける
                .padding()
        } placeholder: {
                // 読み込み中はインジケーターを表示する
                ProgressView()
        }
    }
}
