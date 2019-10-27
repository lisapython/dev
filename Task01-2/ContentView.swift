//
//  ContentView.swift
//  Task01-2
//
//  Created by 呂麗莎 on 2019/10/20.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let otherStrings = ["0"," + "," - "]
    //let firstNum = "0"
    @State var inputContent:String = ""
    //@State var name: String = ""
    //@State var buttonString: String = ""
    
    var body: some View {
        VStack{
            //            TextField("0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            //                .padding(.horizontal, 16)
            Text(" \(inputContent)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.yellow)
                //.padding(.vertical, 8)
                .frame(width: 256, height: 62, alignment: Alignment.init(horizontal: .trailing, vertical: .center))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 4)
            )
            
            //.border(Color.gray, width: 2)
            //.frame(width: 1.0)
            
            ForEach(0 ..< 3) { rows in
                HStack {
                    //Text("this is a test title")
                    ForEach(1 ..< 4) { cols in
                        Button(action: {
                            let aaa = String(cols+3*rows)
                            //print(" \(aaa)")
                            self.showInputNum(inputNum: aaa)
                        }) {
                            Text(" \(cols+3*rows)")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .frame(width: 53, height: 62, alignment: Alignment.center)
                            //.multilineTextAlignment(.center)
                            //.background(Color.red)
                            //.lineLimit(1)
                        }
                            //.padding(.top, 18)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.orange)
                            .frame(width: 80, height: 80)
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
            
            HStack{
                ForEach(otherStrings, id: \.self) { item in
                    Button(action: {
                        self.showInputNum(inputNum: item)
                    }) {
                        Text(item)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 53, height: 62, alignment: Alignment.center)
                        //.background(Color.gray)
                        //.lineLimit(_1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .frame(width: 80, height: 80)
                    .multilineTextAlignment(.center)
                    //.fixedSize(horizontal: true, vertical: true)
                }
            }
            
            
            HStack {
                Button(action: {
                    self.getResult()
                }) {
                    //Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                    Text("=")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 133, height: 62, alignment: .center)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Color.orange)
                .frame(width: 90, height: 80, alignment: Alignment.init(horizontal: .leading, vertical: .center))
                .multilineTextAlignment(.center)
                
                Button(action: {
                    self.clear()
                }) {
                    //Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                    Text("AC")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 52, height: 62, alignment: Alignment.center)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.orange)
                .frame(width: 162, height: 80, alignment: Alignment.init(horizontal: .trailing, vertical: .center))
                .multilineTextAlignment(.center)
            }
        }
    }
    
    func showInputNum(inputNum: String) {
        //print("oooooo!")
        //print(inputNum)
        if inputNum == "" {
            self.inputContent = inputNum
        }else{
            self.inputContent.append(inputNum)
        }
        
    }
    
    func getResult() {
        let resultString: Int
        let kekka = self.inputContent.components(separatedBy: " ")
        if(kekka[1] == "+"){
            resultString = Int(kekka[0])! + Int(kekka[2])!
        }else{
            resultString = Int(kekka[0])! - Int(kekka[2])!
        }
        //print(self.inputContent)
        
        //return String(resultString)
        self.inputContent = String(resultString)
    }
    
    func clear() {
        self.inputContent = ""
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
