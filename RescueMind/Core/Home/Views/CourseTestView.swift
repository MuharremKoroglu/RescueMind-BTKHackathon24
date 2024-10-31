//
//  CourseTestView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 28.10.2024.
//

import SwiftUI

struct CourseTestView: View {
    
    @EnvironmentObject private var viewModel : HomeViewViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    let course : CourseModel
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                
                MessageView(
                    messageData: viewModel.messages,
                    size: size
                )
                
                HStack {
                    ForEach(Constants.testResponseButtonTitles, id: \.self) { buttonTitle in
                        Button {
                            viewModel.sendMessageToGenerativeAI(messageContent: buttonTitle)
                        } label: {
                            Text(buttonTitle)
                                .frame(maxWidth: .infinity)
                                .font(.avenir(size: size.width * 0.04))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.accent)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }.disabled(viewModel.isButtonDisabled)
                    }
                }
                
            }.padding([.leading,.trailing,.bottom],10)
                .navigationTitle("\(course.courseTitle) Test")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.accent)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        AnimatedGeminiStarLogo(
                            isImageRotating: viewModel.isLoading,
                            imageWidth: size.width * 0.065,
                            imageHeight: size.width * 0.065
                        )
                    }
                }
                .onReceive(viewModel.$anErrorOccured) { errorOccured in
                    if errorOccured {
                        dismiss()
                    }
                }
                .onAppear{
                    viewModel.generateQuestionWithGenerativeAI(
                        prompt: Constants.courseTestPrompt(
                            courseName: course.courseTitle
                        )
                    )
                }
                .onDisappear {
                    viewModel.cleanMessages()
                }
        }
    }
}
