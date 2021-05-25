//
//  String extension + HTML convert.swift
//  Quizzy
//
//  Created by Fabrice Ortega on 24/05/2021.
//

import Foundation

extension String {
    var decoded: String {
        let attr = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil)

        return attr?.string ?? self
    }
}
