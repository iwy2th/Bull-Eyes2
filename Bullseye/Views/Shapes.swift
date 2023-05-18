//
//  Shapes.swift
//  Bullseye
//
//  Created by Iwy2th on 04/04/2023.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  var body: some View {
    VStack {
      if !wideShapes {

        Circle()
        //     .fill(Color.blue)
          .strokeBorder(Color.blue, lineWidth: 20)
          .frame(width: 200, height: 100)
          .background(Color.green)
          .transition(.scale)
      }
      Rectangle()
        .frame(width: wideShapes ? 200 : 100 , height: 100)
        .background(Color.green)
  //      .animation(.easeInOut, value: wideShapes)
      Ellipse()
        .frame(width: wideShapes ? 200 : 100 , height: 100)
        .background(Color.green)
      Button("Animation") {
        withAnimation{
          wideShapes.toggle()
        }
      }
    }
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
