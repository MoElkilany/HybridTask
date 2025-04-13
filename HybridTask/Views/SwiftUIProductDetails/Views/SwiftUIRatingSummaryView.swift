//
//  SwiftUIRatingSummaryView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUIRatingSummaryView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text(String(viewModel.productInfo?.reviewCount ??  0 ))
                        .textStyle(
                            DefaultTextStyle(
                                color: .black,
                                fontSize: 18,
                                fontweight:  .bold
                            )
                        )
                    Text("تقييمات وآراء العملاء : ")
                        .textStyle(
                            DefaultTextStyle(
                                color: .black,
                                fontSize: 18,
                                fontweight:  .bold
                            )
                        )
                }
                HStack{
                    Spacer()
                    StarView()
                }
                
                
                HStack{
                    Spacer()
                    
                    Text("من التقييمات")
                        .textStyle(
                            DefaultTextStyle(
                                color: .gray,
                                fontSize: 16,
                                fontweight:  .bold
                            )
                        )
                    
                    Text(String(viewModel.productInfo?.ratingSummary ??  0 ))
                        .textStyle(
                            DefaultTextStyle(
                                color: .gray,
                                fontSize: 16,
                                fontweight:  .bold
                            )
                        )
                    Text("بناء علي ")
                        .textStyle(
                            DefaultTextStyle(
                                color: .gray,
                                fontSize: 16,
                                fontweight:  .bold
                            )
                        )
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 160)
            .background(Color.gray.opacity(0.1))
        }
        .padding()
    
    }
}

#Preview {
    SwiftUIRatingNumberView(viewModel: SwiftUIProductDetailsViewModel())
}


struct StarView: View {
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(.star)
            }
        }
    }
}





struct SwiftUIAddRatingView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                   
                    Text("إضافة تقييم")
                        .textStyle(
                            DefaultTextStyle(
                                color: .systemBlue,
                                fontSize: 24,
                                fontweight:  .bold
                            )
                        )
                }
               
                
                
                HStack{
                    Spacer()
                    
                   
                    
                    Text(
                        "يرجي تسجيل الدخول او انشاء حساب اولا للسماح بإضافة تقيميك"
                    )
                    .textStyle(
                        DefaultTextStyle(
                            color: .gray,
                            fontSize: 16,
                            fontweight:  .bold
                        )
                    )
                    .multilineTextAlignment(.trailing)
                }
                
                
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack{
                            Text("متابعة")
                                .textStyle(
                                    DefaultTextStyle(
                                        color: .white,
                                        fontSize: 20,
                                        fontweight:  .regular
                                    )
                                )
                        }
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .cornerRadius(25)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .border(.gray.opacity(0.1), width: 1)
            .cornerRadius(12)
        }
        .padding()
        .onAppear(){
            viewModel.fetchProductDetails()
        }
    }
}




struct SwiftUIRatingNumberView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel
    
    var body: some View {
       
                HStack{
                    Spacer()
                    
                    Text("من تقييمات العملاء")
                        .textStyle(
                            DefaultTextStyle(
                                color: .black,
                                fontSize: 24,
                                fontweight:  .bold
                            )
                        )
                    
                    Text(String(viewModel.productInfo?.ratingSummary ??  0 ))
                        .textStyle(
                            DefaultTextStyle(
                                color: .black,
                                fontSize: 24,
                                fontweight:  .bold
                            )
                        )
                    
                    
                }
                .padding(.horizontal)
            }}



struct SwiftUICustomerRatingView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack{
            SwiftUIRatingSummaryView(viewModel: viewModel)
            SwiftUIAddRatingView(viewModel: viewModel)
            SwiftUIRatingNumberView(viewModel: viewModel)
        }
    }

}
