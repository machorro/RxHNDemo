//
//  HNPost.swift
//  RxHNDemo
//
//  Created by humbertog on 2017-08-01.
//  Copyright © 2017 humbertog. All rights reserved.
//

import Foundation

struct HNPost: Codable {
    enum PostType: String, Codable {
        case job
        case story
        case comment
        case poll
        case pollopt
    }
    typealias HNId = UInt64
    
    let id: HNId
    let title: String
    let type: PostType
    let author: String
    let time: Date
    let text: String?
    
    /* not really interested for now
    let deleted: Bool
    let dead: Bool
    */
    
    let parent: HNId? //have now clue what this helps with
    let poll: HNId? //poll id
    let kids: [HNId]?
    let url: URL?
    let score: UInt
    let parts: [HNId]?
    let descendants: UInt?
}

extension HNPost: CustomStringConvertible {
    var description: String {
        let text = self.text ?? "no-text"
        return """
        by:\(author), id:\(id), type:\(type.rawValue)
        \(title)
        text: \(text)
"""
    }
}

private extension HNPost {
    private enum CodingKeys: String, CodingKey {
        case id, title, type, time, text, parent, poll, kids, url, score, parts, descendants
        case author = "by"
    }
}
