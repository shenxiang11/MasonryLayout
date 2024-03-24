//
//  data.swift
//  Masonary
//
//  Created by 香饽饽zizizi on 2024/3/3.
//

import Foundation

struct ImageData: Identifiable {
    let id = UUID()
    var url: String
}

extension ImageData {
    static let sample: [ImageData] = [
        .init(url: "https://cdn.midjourney.com/776e70c9-e862-48e1-9af8-ab86bc7a1f02/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/e110af43-aa94-4262-a0fd-1041a92c2aa9/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/dc58cf67-06f4-48e4-937d-cf74009de3e2/0_1.webp"),
        .init(url: "https://cdn.midjourney.com/7761fb58-bd31-43ac-98bb-b66d865a837e/0_2.webp"),
        .init(url: "https://cdn.midjourney.com/c92593c0-54d5-467d-a93c-150141bb4a6a/0_1.webp"),
        .init(url: "https://cdn.midjourney.com/a467c8f2-2122-40b6-9f1f-84f81bf934a2/0_2.webp"),
        .init(url: "https://cdn.midjourney.com/91cf4ba4-f9a7-4ae7-ae34-e4d56d6cede1/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/5309640c-9438-4a01-91e7-f2c0fb09d019/0_3.webp"),
        .init(url: "https://cdn.midjourney.com/192b8a25-1d44-4863-ade6-215750858008/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/3165866e-b180-4a70-9153-33934c79192b/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/c8a26fde-e570-4758-afb0-ec683714898a/0_2.webp"),
        .init(url: "https://cdn.midjourney.com/e31c9eab-43c7-41c0-93f3-76451d8f6313/0_0.webp"),
        .init(url: "https://cdn.midjourney.com/fe098d9e-76e6-4c8c-aef1-5f1f475a8d87/0_0.webp"),
    ]
}
