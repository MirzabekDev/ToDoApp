//
//  SignUpPage.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//

import SwiftUI

struct SignUpPage: View {
    
    /// Connections
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SignUpViewModel()
    @EnvironmentObject var session: SessionStore
    @State var email = ""
    @State var password = ""
    @State var cPassword = ""
    @State var isLoading = false
    @State var isEmail = false
    @State var isPassword = false
    @State var isCPassword = false
   
    
    /// SignUp function
    func doSignUp(){
        if email.isValidEmail && password.isValidPassword && password == cPassword {
            viewModel.apiSignUp(email: email, password: password, completion: { result in
                if !result {
                    
                } else{
                    var user = User(email: email)
                    user.uid = session.session?.uid
                    
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
        if email.isValidEmail == false{
            isEmail = true
        } else { isEmail = false}
        if password.isValidPassword == false {
            isPassword = true
        } else { isPassword = false}
        if password != cPassword { isCPassword = true } else { isCPassword = false}
    }
    
    var body: some View {
        
        NavigationView(){
          
            VStack(){
                ZStack(){
                    Circle().frame(width: 300,height: 300).foregroundColor(Color("Color2"))
                        .padding(.top,-200).padding(.leading,-200)
                    /// Title of the signIn
                    HStack(alignment: .top){
                        Text("Create New Account !")
                            .foregroundColor(Color("Color3"))
                            .font(.system(size: 30)).fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                }
                Spacer()
                
                /// Login Button /  textField
                VStack{
                    
                    /// Email TextField
                    HStack{
                        Image(systemName: "person").foregroundColor(Color("Color3"))
                        TextField("Enter your Email",text: $email)
                    }.padding()
                        .background(Color("Color2")).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                    if isEmail {
                        Text("Enter suitable email")
                            .foregroundColor(Color("Color2"))
                            .padding(.leading)
                            .font(.system(size: 13))
                    }
                    
                    /// Password TextField
                    HStack{
                        Image(systemName: "key").foregroundColor(Color("Color3"))
                        SecureField("Enter your Email",text: $password)
                    }.padding()
                        .background(Color("Color2")).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                    if isPassword {
                        Text("The password must contain at least 1 capital letter, number and symbol!")
                            .foregroundColor(Color("Color2"))
                            .font(.system(size: 13)).multilineTextAlignment(.center)
                    }
                }
                
                /// Confirm PasswordField
                HStack{
                    Image(systemName: "lock").foregroundColor(Color("Color3"))
                    SecureField("Confirm Password",text: $cPassword)
                }.padding()
                    .background(Color("Color2")).cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                if isCPassword {
                    Text("The password is not the same!")
                        .foregroundColor(Color("Color2"))
                        .font(.system(size: 13))
                }
                
                /// Sign Button
                Button(action: {
                    doSignUp()
                }, label: {
                    HStack{
                        Spacer()
                        Text("Create").foregroundColor(Color("Color1"))
                        Spacer()
                    }
                    .padding()
                    .background(Color("Color2"))
                    .cornerRadius(20)
                }).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color3"),lineWidth: 2))
                
                Spacer()
                ///Note...
                HStack(alignment: .bottom){
                    Text("If you have an account back to the main page log in your existance accaount").font(.system(size: 15))
                        .foregroundColor(Color("Color2"))
                        .multilineTextAlignment(.center)
                }
            }
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Color1"))
            
            
        
    }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("Create an Account")
        /// BackBar Button changing
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                
              Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "arrow.left.circle")
                    .foregroundColor(Color("Color1"))
            }
        }))
    }
    }
    

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
