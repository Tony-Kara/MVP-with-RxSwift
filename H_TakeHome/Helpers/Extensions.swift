//
//  Color.swift
//  SwensonHe_WeatherApp
//
//  Created by Eniola Anthony on 6/24/23.
//

import UIKit
import RxSwift
import RxCocoa

public extension UIColor {
  static let SwensonHe_BackgroundColor = UIColor(hex: "#002762")
  static let SwensonHe_TextColor = UIColor(hex: "#444E72")
  
}

public extension UIStackView {
  
  convenience init(
    views: [UIView],
    axis: NSLayoutConstraint.Axis = .horizontal,
    distribution: Distribution = .fill,
    alignment: Alignment = .fill,
    spacing: CGFloat = 0
  ) {
    self.init(arrangedSubviews: views)
    self.axis = axis
    self.distribution = distribution
    self.alignment = alignment
    self.spacing = spacing
  }
}

public extension UITableView {
  
  func registerClassForCell(_ cellClass: UITableViewCell.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
  }
}

public extension NSObject {
  static var reuseIdentifier: String {
    return NSStringFromClass(self)
  }
}

public extension Reactive where Base: UITableView {
  
  // swiftlint:disable all
  func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
  (_ cellClass: Cell.Type)
  -> (_ source: Source)
  -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
  -> Disposable where Source.Element == Sequence {
    return base.rx.items(cellIdentifier: cellClass.reuseIdentifier, cellType: cellClass)
  }
}

public extension UICollectionView {
  
  func registerClassForCell(_ cellClass: UICollectionViewCell.Type) {
    register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
  }
}

public extension Reactive where Base: UICollectionView {
  
  // swiftlint:disable all
  func items<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType>
  (_ cellClass: Cell.Type)
  -> (_ source: Source)
  -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
  -> Disposable where Source.Element == Sequence {
    return base.rx.items(cellIdentifier: cellClass.reuseIdentifier, cellType: cellClass)
  }
}

public extension UIStackView {
  func addArrangedSubviews(_ subviews: [UIView]) {
    subviews.forEach { subview in
      addArrangedSubview(subview)
    }
  }
  
  func insert(view: UIView, after arrangedSubview: UIView) {
    guard let insertIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
      return
    }
    insertArrangedSubview(view, at: insertIndex + 1)
  }
  
  func insert(view: UIView, before arrangedSubview: UIView) {
    guard let insertIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
      return
    }
    insertArrangedSubview(view, at: insertIndex)
  }
}


extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
    // TODO:  Download files asynchronously
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}

// MARK: - Hex colors

public extension UIColor {
  
  convenience init(hex: UInt32) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  convenience init(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    guard let intHex = UInt32(hexSanitized, radix: 16) else {
      fatalError("Incorrect string hex")
    }
    
    self.init(hex: intHex)
  }
}
