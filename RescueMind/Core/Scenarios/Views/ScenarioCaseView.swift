//
//  ScenarioCaseView.swift
//  RescueMind
//
//  Created by Muharrem Köroğlu on 1.11.2024.
//

import SwiftUI

struct ScenarioCaseView: View {
    
    @EnvironmentObject private var viewModel : ScenariosViewViewModel
    
    @Environment(\.dismiss) private var dismiss
        
    let scenario : EducationalMaterialModel
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                
                MessageView(
                    messageData: viewModel.messages,
                    size: size
                )
                
                HStack {
                    TextField("Enter your answer...", text: $viewModel.userAnswer, axis: .vertical)
                        .lineLimit(3)
                        .font(.avenir(size: size.width * 0.045))
                        .padding()
                        .background(.lighterAccent.opacity(0.3),in: Capsule())
                        .autocorrectionDisabled()
                    Button {
                        viewModel.prompt = viewModel.userAnswer
                        viewModel.sendMessageToGenerativeAI()
                        viewModel.userAnswer = ""
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.largeTitle)
                    }.disabled(viewModel.isButtonDisabled)
                    
                }
                
            }.padding([.leading,.trailing,.bottom],10)
                .navigationTitle("\(scenario.title) Scenario")
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
                    viewModel.prompt = Constants.scenarioCasePrompt(scenarioName: scenario.title)
                    viewModel.getMessageFromGenerativeAI()
                }
                .onDisappear {
                    viewModel.cleanMessages()
                }
            
        }
    }
}
