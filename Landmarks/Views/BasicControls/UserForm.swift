//
//  UserForm.swift
//  Landmarks
//
//  Created by Nand Parikh on 24/02/21.
//

import SwiftUI
//https://medium.com/swlh/learn-master-%EF%B8%8F-swiftui-basic-components-in-10-minutes-dc327e71d245

enum Language : String, CaseIterable {
        case Hindi
        case English
        case Gujarati
}

struct UserForm: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var street: String = ""
    @State private var houseNumber: String = ""
    @State private var zip: String = ""
    @State private var city: String = ""
    @State private var termsAccepted: Bool = false
    @State private var privacyAccepted: Bool = false
    @State private var sharingAccepted: Bool = false
    @State private var isAlertVisible: Bool = false
    @State private var showingSheet = false
    @State private var date: Date = Date()
    @State private var ageRange: CountableClosedRange<Int> = 1...100
    @State private var ageValue : Int = 18
    @State private var fullName : String = ""
    @State private var password : String = ""
    @State private var selectedLanguage : Language = .English
    
    
    let button1 = ActionSheet.Button.default(Text("Facebook")) {}
    let button2 = ActionSheet.Button.default(Text("Instagram")) {}
    let button3 = ActionSheet.Button.default(Text("Twitter")) {}
    let dismissButton = ActionSheet.Button.cancel {}


    var body: some View {

        Form{
            Section{
                Text("First name").font(.headline)
                TextField("First name", text: $firstName)
                
                Text("Last name").font(.headline)
                TextField("Last name", text: $lastName)
                
                HStack{
                    Text("Full Name").font(.headline)
                    TextField("Full Name", text: $fullName)
                }
                
                HStack{
                    Text("Password").font(.headline)
                    SecureField("Password",text: $password)
                }
                
                HStack{
                    Text("Language").font(.headline)
                    Picker(selection: $selectedLanguage, label: Text("Language")) {
                        ForEach(Language.allCases, id: \.self) { language in
                            Text(language.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            
            Section{
                Text("Street").font(.headline)
                TextField("Street", text:$street)
                
                Text("House number").font(.headline)
                TextField("House number", text:$houseNumber)
                
                Text("Zip").font(.headline)
                TextField("Zip", text:$zip)
                
                Text("City").font(.headline)
                TextField("City", text:$city)
            }
            
            Section{
                DatePicker(selection: $date, displayedComponents: [.date]) {
                    Text("Birthday").font(.headline)
                }
                
                HStack{
                    Text("Age")
                    Text("\(ageValue)")
                    Stepper(value: $ageValue, in: ageRange) {}

                }
                
            }

            
            Section{
                
                Toggle(isOn: $termsAccepted) {
                    Text("Terms").font(.headline)
                }
                
                Toggle(isOn: $privacyAccepted) {
                    Text("Privacy").font(.headline)
                }
                
                let buttons = [button1, button2, button3, dismissButton]

                Toggle(isOn: $sharingAccepted) {
                    
                    Text("Share").font(.headline)
                        .onChange(of: sharingAccepted) { (value) in
                            print(value)
                            if value {
                                showingSheet = true
                            }else {
                                showingSheet = false
                            }
                        }
                }.actionSheet(isPresented: $showingSheet) { () -> ActionSheet in
                    ActionSheet(
                        title: Text("What do you want to do?"),
                        message: Text("There are 3 sharing options available"),
                        buttons: buttons
                    )
                }
            }
            
            
            Section{
                Button(action:{
                    self.isAlertVisible.toggle()
                    
                }){
                    Text("Submit")
                }
                .alert(isPresented: $isAlertVisible){
                    Alert(title: Text("Hey"), message: Text("I'm a simple alert"), dismissButton: .default(Text("Dismiss"), action: {
                        
                        self.isAlertVisible  = false
                    }))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding()
                .background(Color.green).cornerRadius(5)
                .foregroundColor(Color.white)
                .font(.title2)
                
            }
        }.navigationTitle("UserForm")
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
    }
}

//struct CustomActionSheet : View {
//    @State private var isActionSheetVisible = false
//    private var actionSheet: ActionSheet {
//        let button1 = ActionSheet.Button.default(Text("Facebook")) {
//            self.isActionSheetVisible = false
//        }
//        let button2 = ActionSheet.Button.default(Text("Instagram")) {
//            self.isActionSheetVisible = false
//        }
//        let button3 = ActionSheet.Button.default(Text("Twitter")) {
//            self.isActionSheetVisible = false
//        }
//        let dismissButton = ActionSheet.Button.cancel {
//            self.isActionSheetVisible = false
//        }
//        let buttons = [button1, button2, button3, dismissButton]
//        return ActionSheet(title: Text("Share"),
//                           buttons: buttons)
//    }
//
//    var body: some View {
//        actionSheet(isPresented: self.$isActionSheetVisible) {
//            self.actionSheet
//        }
//    }
//}
