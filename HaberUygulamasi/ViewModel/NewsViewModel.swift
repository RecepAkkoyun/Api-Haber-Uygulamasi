//
//  NewaViewModel.swift
//  HaberUygulamasi
//
//  Created by Recep Akkoyun on 22.09.2022.
//

import Foundation

struct NewsTableViewModel{
    let newList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newList.count
    }
    func newsAtIndexPath(index : Int) -> NewsViewModel {
        let news = self.newList[index]
        return NewsViewModel(news: news )
    }
    
}

struct NewsViewModel{
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
    
}
