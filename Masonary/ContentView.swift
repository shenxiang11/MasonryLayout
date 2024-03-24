//
//  ContentView.swift
//  Masonary
//
//  Created by 香饽饽zizizi on 2024/3/3.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var images = ImageData.sample.shuffled()

    var body: some View {
        NavigationStack {
            ScrollView {
                MasonaryLayout(columns: verticalSizeClass == .compact ? 4 : 2, spacing: 8) {
                    ForEach(images) { item in
                        AsyncImage(url: URL(string: item.url)) { image in
                            image.resizable()
                                .scaledToFit()

                        } placeholder: {
                            Color.gray.opacity(0.3)
                                .aspectRatio(1, contentMode: .fit)
                        }
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25.0)
                        )

                    }
                }
                .padding(8)
            }
            .refreshable {
                images = ImageData.sample.shuffled()
            }
            .navigationTitle("Midjourney")
        }
    }
}

struct MasonaryLayout: Layout {
    var columns = 2
    var spacing: CGFloat = 10

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }

        var heights: [CGFloat] = Array(repeating: 0, count: columns)

        var y = heights.min() ?? 0
        var idx = heights.firstIndex { $0 == y } ?? 0
        let realWidth = ((proposal.width ?? 0) - spacing * CGFloat(columns - 1)) / CGFloat(columns)

        for view in subviews {
            let size = view.dimensions(in: .init(width: realWidth, height: nil))

            heights[idx] += size.height + spacing
            y = heights.min() ?? 0
            idx = heights.firstIndex { $0 == y } ?? 0
        }

        return .init(width: proposal.width ?? 0, height: heights.max() ?? 0)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }

        var heights: [CGFloat] = Array(repeating: 0, count: columns)

        var y = heights.min() ?? 0
        var idx = heights.firstIndex { $0 == y } ?? 0
        let realWidth = ((proposal.width ?? 0) - spacing * CGFloat(columns - 1)) / CGFloat(columns)

        for view in subviews {
            let size = view.dimensions(in: .init(width: realWidth, height: nil))
            let x = bounds.minX + size.width * CGFloat(idx) + spacing * CGFloat(idx)

            view.place(at: .init(x: x, y: y + bounds.minY), anchor: .topLeading, proposal: .init(width: size.width, height: size.height))

            heights[idx] += size.height + spacing

            y = heights.min() ?? 0
            idx = heights.firstIndex { $0 == y } ?? 0
        }
    }


}

#Preview {
    ContentView()
}
