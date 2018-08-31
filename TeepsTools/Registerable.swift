//
//  Registerable.swift
//  TeepsTools
//
//  Created by Chayel Heinsen on 8/31/18.
//  Copyright © 2018 teeps. All rights reserved.
//

import UIKit

/**
 Protocol to register and load TableView and CollectionView cells.
 */
public protocol Registerable {
  /**
   The cell identifier. Defaults to the class name.
   */
  static var identifier: String { get }
  /**
   The nib for the cell. Defaults to the nib named with the identifier.
   */
  static var nib: UINib { get }
}

public extension Registerable {
  public static var identifier: String { return String(describing: Self.self) }
  public static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}

public extension Registerable where Self: UITableViewCell {
  /**
   Registers a cell with a TableView.
   
   ```
   MyTableViewCell.register(tableView: tableView)
   ```
   
   - Parameter tableView: The TableView to register the cell to.
   */
  public static func register(tableView: UITableView) {
    tableView.register(nib, forCellReuseIdentifier: identifier)
  }
  
  /**
   Dequeues a reusable cell.
   
   ```
   MyTableViewCell.cell(forTable: tableView)
   ```
   
   - Parameter table: The TableView to dequeue the cell from.
   
   - Returns: A dequeued cell
   */
  public static func cell(forTable table: UITableView) -> Self {
    //swiftlint:disable:next force_cast
    return table.dequeueReusableCell(withIdentifier: self.identifier) as! Self
  }
  
  /**
   Dequeues a reusable cell.
   
   ```
   MyTableViewCell.cell(forTable: tableView, indexPath: indexPath)
   ```
   
   - Parameter table: The TableView to dequeue the cell from.
   - Parameter indexPath: The indexPath of the cell.
   
   - Returns: A dequeued cell
   */
  public static func cell(forTable table: UITableView, indexPath: IndexPath) -> Self {
    //swiftlint:disable:next force_cast
    return table.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! Self
  }
}

public extension Registerable where Self: UICollectionViewCell {
  /**
   Registers a cell with a CollectionView.
   
   ```
   MyCollectionViewCell.register(collectionView: collectionView)
   ```
   
   - Parameter collectionView: The CollectionView to register the cell to.
   */
  public static func register(collectionView: UICollectionView) {
    collectionView.register(nib, forCellWithReuseIdentifier: identifier)
  }
  
  /**
   Dequeues a reusable cell.
   
   ```
   MyCollectionViewCell.cell(forCollection: collectionView, indexPath: indexPath)
   ```
   
   - Parameter collectionView: The CollectionView to dequeue the cell from.
   - Parameter indexPath: The indexPath of the cell.
   
   - Returns: A dequeued cell
   */
  public static func cell(forCollection collectionView: UICollectionView, indexPath: IndexPath) -> Self {
    return collectionView.dequeueReusableCell(
      withReuseIdentifier: self.identifier,
      for: indexPath
      //swiftlint:disable:next force_cast
    ) as! Self
  }
}
