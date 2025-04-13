//
//  SwiftUITabsView.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import SwiftUI

struct SwiftUITabsView: View {
    @State private var selectedTab: Tab = .description
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel


    enum Tab: String, CaseIterable {
        case reviews = "اراء العملاء"
        case info = "معلومات اضافيه"
        case description = "وصف المنتج"
           
         
    }

    var body: some View {
        VStack{
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    VStack(spacing: 4) {
                        Text(tab.rawValue)
                            .textStyle(
                                DefaultTextStyle(
                                    color: .black,
                                    fontSize: 15,
                                    fontweight: selectedTab == tab ? .bold : .regular
                                )
                            )
                           
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(
                                selectedTab == tab ? .black : .clear
                            )
                            .animation(
                                .easeInOut(duration: 0.2),
                                value: selectedTab
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selectedTab = tab
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
               
               
            Divider()

      
            VStack(alignment: .center, spacing: 10) {
                switch selectedTab {
                case .description:
                    SwiftUIHTMLDescriptionView(viewModel: viewModel)
                case .info:
                    SwiftUIAdditionalInfoView(viewModel: viewModel)
                case .reviews:
                    SwiftUICustomerRatingView(viewModel: viewModel)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
               
        }
      
    }
}

#Preview {
    SwiftUITabsView(viewModel: SwiftUIProductDetailsViewModel() )
}


struct SwiftUIHTMLDescriptionView: View {
    @ObservedObject var viewModel: SwiftUIProductDetailsViewModel

    var body: some View {
        VStack{
           HTMLWebView(htmlContent: viewModel.productInfo?.description?.html ?? "")
                .frame(height: 230)
        }
        .padding(4)
        .border(Color.gray.opacity(0.2), width: 1)
        }
}

import WebKit

struct HTMLWebView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = true
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
