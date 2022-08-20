//
//  UILabel+extension.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
