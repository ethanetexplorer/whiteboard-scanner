//
//  WhiteboardDetailView.swift
//  whiteboard-scanner
//
//  Created by Seth Loh on 19/11/22.
//

import SwiftUI

struct WhiteboardDetailView: View {
    
    @Binding var whiteboard: Whiteboard
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(whiteboard.thumbnailName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding()
                TextField(whiteboard.description, text: $whiteboard.description)
                    .padding()
            }
        }
        .navigationTitle(Text("\(whiteboard.title)"))
    }
}

//struct WhiteboardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WhiteboardDetailView(whiteboard: .constant(Whiteboard(title: "Test", description: "desc test", dateCreated: Date(), imageData: )))
//    }
//}
