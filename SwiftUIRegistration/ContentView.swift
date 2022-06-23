//
//  ContentView.swift
//  SwiftUIRegistration
//
//  Created by maqiqing on 2022/6/23.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var username = ""
//    @State private var password = ""
//    @State private var passwordConfirm = ""
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            
            VStack {
                RegistrationView(isTextField: true, placeholder: "用户名", fieldValueValue: $viewModel.username)
                if !viewModel.isUsernameLengthValid {
                    InputErrorView(iconName: "exclamationmark.circle.fill", text: "用户不存在")
                }
            }
            VStack {
                RegistrationView(isTextField: false, placeholder: "密码", fieldValueValue: $viewModel.password)
                if !viewModel.isPasswordLengthValid || !viewModel.isPasswordCapitalLetter {
                    InputErrorView(iconName: "exclamationmark.circle.fill", text: "密码不正确")
                }
            }
            VStack {
                RegistrationView(isTextField: false, placeholder: "再次输入密码", fieldValueValue: $viewModel.passwordConfirm)
                if !viewModel.isPasswordConfirmValid {
                    InputErrorView(iconName: "exclamationmark.circle.fill", text: "两次密码需要相同")
                }
            }
            
            Button {
                
            } label: {
                Text("注册")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct RegistrationView: View {
    
    var isTextField = false
    var placeholder = ""
    @Binding var fieldValueValue: String
    
    var body: some View {
        
        VStack {
            if isTextField {
                TextField(placeholder, text: $fieldValueValue)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.horizontal)
            } else {
                SecureField(placeholder, text: $fieldValueValue)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
        
    }
    
}

// 错误信息
struct InputErrorView: View {
    
    var iconName: String = ""
    var text: String = ""
    private let warnColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var body: some View {
        
        HStack {
            
            Image(systemName: iconName)
                .foregroundColor(warnColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(warnColor)
            Spacer()
            
        }.padding(.leading, 10)
        
    }

}
