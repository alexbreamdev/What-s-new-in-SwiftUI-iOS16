//
//  AlternativeStackLayout.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 23.04.2023.
//

import SwiftUI

struct AlternativeStackLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        // check if there any subviews, if not return container with zero size
        guard !subviews.isEmpty else { return .zero}
        
        // iterate through subviews and assign them their ideal size
        // array of width and height of all subviews that were presented
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        // array of ally width of subviews
        let allWidth = subviewSizes.map { $0.width }
        // getting max width of view that is even
        let evenWidthMax = allWidth.enumerated() // returns array of tuple (index, element)
            .filter { $0.0.isMultiple(of: 2) }  // filter out even indices
            .map {$0.1} // turns back to array of elements widths
            .max() // returns max value of widths of even elements
        
        // same for odd indices
        let oddWidthMax = allWidth.enumerated()
            .filter { !$0.0.isMultiple(of: 2) }
            .map {$0.1}
            .max()
        
        // calculate total height of elements in contaner
        let totalHeight = subviewSizes.map { $0.height}
            .reduce(0, +)
        
        // returning the size of the container
        // evenWidth is guard checked so can be force unwrapped
        // oddWidth may not exist
        return CGSize(width: evenWidthMax! + (oddWidthMax ?? 0), height: totalHeight)
    }
    
    // MARK: - Subview placement is defined here
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        // check if any subviews
        guard !subviews.isEmpty else { return }
        
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let allWidth = subviewSizes.map { $0.width }
        let evenWidthMax = allWidth.enumerated() // returns array of tuple (index, element)
            .filter { $0.0.isMultiple(of: 2) }  // filter out even indices
            .map {$0.1} // turns back to array of elements widths
            .max() // returns max value of widths of even elements
        
        // create coordinates for views
        let evenX = bounds.minX
        let oddX = bounds.minX + evenWidthMax!
        
        var y = bounds.minY
        
        for (index, subview) in subviews.enumerated() {
            let subviewSize = subviewSizes[index]
            let proposedSize = ProposedViewSize(width: subviewSize.width, height: subviewSize.height)
            if index.isMultiple(of: 2) {
                subview.place(at: CGPoint(x: evenX, y: y), anchor: .topLeading, proposal: proposedSize)
            } else {
                subview.place(at: CGPoint(x: oddX, y: y), anchor: .topLeading, proposal: proposedSize)
            }
            y += subviewSize.height
        }
    }
    
    
}

//struct AlternativeStackLayout_Previews: PreviewProvider {
//    static var previews: some View {
//        AlternativeStackLayout()
//    }
//}
