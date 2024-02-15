//
//  ViewController.swift
//  TaskKatsun3
//
//  Created by 渡邊 翔矢 on 2023/12/14.
//

import SwiftUI



struct ViewController: View {
    @State var isShowSafari = false
    @State private var items: [Item] = []
    @State private var selectionURL: URL?
    
    var body: some View {
        List(items) { item in
            Button {
                DispatchQueue.main.async {
                    selectionURL = item.url
                    isShowSafari = true
                    print(item.url)
                    print(selectionURL!)
                }
            } label: {
                HStack {
                    AsyncImage(url: item.user.profileImageURL) { image in
                        image.resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    ItemDetailView(item: item)
                }
            }
        }
        .onAppear {
            Task {
               await fetchData()
            }
        }
        .sheet(isPresented: $isShowSafari) {
            SafariView(url: $selectionURL)
        }
    }
    
    @MainActor
    func fetchData() async {
        Task {
            do{
                let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=10")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedItems = try JSONDecoder().decode([Item].self, from: data)
                self.items = decodedItems
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}



struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
