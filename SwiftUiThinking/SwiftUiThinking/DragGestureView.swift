//
//  DragGestureView.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 18/11/2022.
//

import SwiftUI

struct DragGestureView: View {
    @State var offset: CGSize = .zero
    var body: some View {
        ZStack {
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
        }
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 500)
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .rotationEffect(Angle(degrees: getRotationAmount()))
            .gesture(
                DragGesture()
                    .onChanged {
                        value in
                        withAnimation(.spring()) {
                            offset = value.translation
                        }
                    }
                    .onEnded {
                        value in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
    }
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let cureentAmount = abs(offset.width)
        let percentage = cureentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    func getRotationAmount() ->Double {
        let max = UIScreen.main.bounds.width / 2
        let cureentAmount = offset.width
        let percentage = cureentAmount / max
        let percentageDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageDouble * maxAngle

    }
}
struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}

//
//  DragGesture.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 18/11/2022.
//

