//
//  ModuleSelectionView.swift
//  AutoSecLearn
//
//  Created by meagan alfaro on 4/5/26.
//

import Foundation
import SwiftUI

struct ModuleSelectionView: View {
    // Styling
    let moduleGradients: [LinearGradient] = [
        LinearGradient(colors: [Color("accentTeal"), Color("accentBlue")], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(colors: [Color("accentIndigo"), Color("accentPurple")], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing),
        LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: AppTheme.paddingMedium) {
                
                // Header
                VStack(spacing: 8) {
                    Text("Module Exams")
                        .font(AppTheme.largeTitle)
                        .foregroundStyle(AppTheme.primaryGradient)
                    
                    Text("Select a module to begin")
                        .font(AppTheme.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, AppTheme.paddingLarge)
                .padding(.bottom, AppTheme.paddingSmall)
                
                // Module cards
                ForEach(QuestionStorage.allModules.indices, id: \.self) { index in
                    let module = QuestionStorage.allModules[index]
                    
                    NavigationLink(destination: ExamView(module: module, gradient: moduleGradients[index])) {
                        HStack(spacing: AppTheme.paddingMedium) {
                            
                            // Module number badge
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white.opacity(0.3))
                                    .frame(width: 44, height: 44)
                                Text("\(index + 1)")
                                    .font(AppTheme.headline)
                                    .foregroundStyle(.white)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(module.name)
                                    .font(AppTheme.headline)
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.leading)
                                Text("\(module.questions.count) questions")
                                    .font(AppTheme.caption)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.white.opacity(0.8))
                                .font(.caption)
                        }
                        .padding(AppTheme.paddingMedium)
                        .background(moduleGradients[index])
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius))
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                    }
                    .padding(.horizontal, AppTheme.paddingMedium)
                }
                
            }
            .padding(.bottom, AppTheme.paddingLarge)
        }
        .background(AppTheme.cardBackground.ignoresSafeArea())
        .navigationTitle("Meagan's Section")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ModuleSelectionView()
    }
}
