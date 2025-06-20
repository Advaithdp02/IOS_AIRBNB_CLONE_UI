//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Adu on 11/06/25.
//

import SwiftUI
enum DestinationSearchOptions{
    case location
    case date
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination=""
    @State private var selectedOptions:DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests=0;
    var body: some View {
        VStack{
            
            
            HStack{
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label:{
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                Spacer()
                if( !destination.isEmpty){
                    Button("clear"){
                        destination=""
                        
                        
                    }.foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
            }
                .padding()
            
            VStack(alignment: .leading){
                if (selectedOptions == .location){
                    Text("Where To?")
                        .font(.headline)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search Destinations",text:$destination)
                            .font(.subheadline)
                    }.frame(height: 44)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                            
                            
                        }
                }else{
                            CollapsedPickerView(title:"Where?",description: "add location")
                        }
                }
            .modifier(collapsableViewModifier())
                    .frame(height: selectedOptions == .location ? 120 : 64)
                   
                    .onTapGesture {
                        withAnimation(.snappy)
                            {
                                selectedOptions = .location
                            }
                        
                    }
            
            //date
            VStack(alignment: .leading){
                if (selectedOptions == .date){
                    Text("when's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("From",selection: $startDate,displayedComponents: .date)
                        Divider()
                        DatePicker("To",selection: $endDate,displayedComponents: .date)
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                }else{CollapsedPickerView(title:"When?",description: "add dates")
                        
                        }
                    
                }.modifier(collapsableViewModifier())
                .frame(height: selectedOptions == .date ? 180 : 64)
                
                
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOptions = .date
                }
                }
            
           
            
            
            //num guest
            VStack(alignment: .leading){
                if (selectedOptions == .guests){
                    Text("Whos coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuests) Adults")
                        
                    }onIncrement: {
                        numGuests+=1
                    }onDecrement: {
                        guard numGuests>0 else{return}
                        numGuests-=1
                    }
                }else{CollapsedPickerView(title:"Who?",description: "add guests")
                        
                        }
                    
                }
            .modifier(collapsableViewModifier())
                .frame(height: selectedOptions == .guests ? 120 : 64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOptions = .guests
                }
                }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}
struct collapsableViewModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .padding()
            
            .background(.white)
            
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
struct CollapsedPickerView: View {
    let title:String
    let description:String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                
                Text(description)
                
            }.fontWeight(.semibold).font(.subheadline)
        }
//        .padding()
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding()
//            .shadow(radius: 10)
    }
}
