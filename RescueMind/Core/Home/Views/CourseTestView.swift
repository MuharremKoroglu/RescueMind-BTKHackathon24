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
    
    let course : EducationalMaterialModel
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                
                MessageView(
                    messageData: viewModel.messages,
                    size: size
                )
                
                HStack {
                    ForEach(viewModel.testResponseButtonTitles, id: \.self) { buttonTitle in
                        Button {
                            viewModel.prompt = buttonTitle
                            viewModel.sendMessageToGenerativeAI()
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
                .navigationTitle("\(course.title) Test")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        BackButtonView {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        RotatingImage(
                            imageName: "gemini_star_logo",
                            isImageRotating: viewModel.isLoading,
                            imageWidth: size.width * 0.065,
                            imageHeight: size.width * 0.065
                        )
                    }
                }
                .alert(Constants.alertTitle, isPresented: $viewModel.anErrorOccured, actions: {
                    AlertActionButtonView {
                        dismiss()
                    }
                }, message: {
                    Text(Constants.alertMessage)
                })
                .onAppear{
                    viewModel.prompt = Constants.courseTestPrompt(courseName: course.title)
                    viewModel.getMessageFromGenerativeAI()
                }
                .onDisappear {
                    viewModel.cleanMessages()
                }
        }
    }
}
