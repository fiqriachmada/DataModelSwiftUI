//
//  ContentView.swift
//  DataModelSwiftUI
//
//  Created by Achmada Fiqri A Rasyad on 20/09/20.
//

import SwiftUI

//model data
struct ProductModel: Identifiable {
    let id: Int
    let productName: String
    let productPhoto: String
    let productPrice: Int
    let location: String
    let rating: Int
    let totalRating: Int
    
    init(id: Int, productName: String, productPhoto: String, productPrice: Int, location: String, rating: Int, totalRating: Int) {
        self.id = id
        self.productName = productName
        self.productPhoto = productPhoto
        self.productPrice = productPrice
        self.location = location
        self.rating = rating
        self.totalRating = totalRating
    }
}

struct ContentView: View {
    let data: [ProductModel] = [
        ProductModel(id: 1, productName: "Polygon Sangar", productPhoto: "1", productPrice: 7000000, location: "Arab Saudi", rating: 3, totalRating: 30),
        ProductModel(id: 2, productName: "Polygon Blibet", productPhoto: "2", productPrice: 87000000, location: "Surabaya", rating: 4, totalRating: 30),
        ProductModel(id: 3, productName: "Polygon Lucu", productPhoto: "3", productPrice: 67000000, location: "Trenggalek", rating: 5, totalRating: 30),
        ProductModel(id: 4, productName: "Polygon Miber", productPhoto: "4", productPrice: 37000000, location: "Tulungagung", rating: 2, totalRating: 30),
        ProductModel(id: 5, productName: "Polygon Biasa", productPhoto: "5", productPrice: 27000000, location: "Arab Saudi", rating: 4, totalRating: 30),
        ProductModel(id: 6, productName: "Polygon NOS", productPhoto: "6", productPrice: 7000000, location: "Arab Saudi", rating: 5, totalRating: 30),
        ProductModel(id: 7, productName: "Polygon Mahal", productPhoto: "7", productPrice: 70000000, location: "Arab Saudi", rating: 4, totalRating: 30),
        ProductModel(id: 8, productName: "Polygon Murah", productPhoto: "8", productPrice: 3000000, location: "Arab Saudi", rating: 3, totalRating: 30),
        ProductModel(id: 9, productName: "Polygon Legit", productPhoto: "9", productPrice: 17000000, location: "Arab Saudi", rating: 4, totalRating: 30),
        ProductModel(id: 10, productName: "Polygon Lapis", productPhoto: "10", productPrice: 117000000, location: "Arab Saudi", rating: 5, totalRating: 30)
    ]
    
    
    var body: some View {
//        Product(data: <#T##ProductModel#>)
        NavigationView{
            ScrollView{
                ForEach(data) {
                    row in
                    VStack(spacing: 10){
                        Product(data: row)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Polygon")
            .navigationBarItems(
                trailing:
                    HStack(spacing: 20){
                        Button(action: {print("Ashiap")}) {
                            Image(systemName: "cart.fill")
                        }
                        Button(action: {print("Masuk angin")}) {
                            Image(systemName: "person.fill")
                        }
                    }
            )
        }
        .accentColor(.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    let data: ProductModel
    
    
    var body: some View{
        VStack(alignment: .leading){
            //foto
            ZStack(alignment: .topTrailing){
                Image(self.data.productPhoto)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(.red)
                }
            }
            Text(self.data.productName)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp. \(self.data.productPrice)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.red)
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.location)
                
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                ForEach(0..<self.data.rating){
                    items in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            Button(action: {print("Masuk")}){
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "cart")
                        Text("Tambah ke Keranjang")
                            .font(.callout)
                            .padding()
                    }
                    Spacer()
                }
            }
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
        .background(Color("color"))
        .cornerRadius(15)
        
    }
}
