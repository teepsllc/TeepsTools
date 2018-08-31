//
//  NSObjectExtensions.swift
//  TeepsTools
//
//  Created by Chayel Heinsen on 8/31/18.
//  Copyright © 2018 teeps. All rights reserved.
//

import Foundation

public extension NSObjectProtocol where Self: NSObject {
  /**
   Observe changes with KVO.
   
   - Note: Ensure you dispose fo the observation using DisposeBag.
   
   ```
   observe(\textField.text) { value in
    // Do something with the new text
   }.disposedBy(disposeBag)
   ```
   
   - Parameter keyPath: The keypath to observe changes on
   - Parameter onChange: The closure that will be called when the value changes.
   */
  public func observe<Value>(_ keyPath: KeyPath<Self, Value>, onChange: @escaping (Value) -> Void) -> Disposable {
    let observation = observe(keyPath, options: [.initial, .new]) { _, change in
      guard let newValue = change.newValue else { return }
      
      onChange(newValue)
    }
    
    return Disposable { observation.invalidate() }
  }
}

public extension NSObjectProtocol where Self: NSObject {
  /**
   Bind changes to a target. In this example, any changes to the textFields text property will also update the labels text property.
   
   - Note: Ensure you dispose of the observation using DisposeBag.
   
   ```
   bind(
     \textField.text,
     to: label,
     at: \UILabel.text
   ).disposedBy(disposeBag)
   ```
   
   - Parameter sourceKeyPath: Keypath to observe changes on
   - Parameter target: The target object
   - Parameter at: Keypath to bind changes to
   */
  public func bind<Value, Target>(_ sourceKeyPath: KeyPath<Self, Value>, to target: Target, at targetKeyPath: ReferenceWritableKeyPath<Target, Value>) -> Disposable {
    return observe(sourceKeyPath) { target[keyPath: targetKeyPath] = $0 }
  }
}

/**
 Disposables are objects that hold onto other objects until they are ready to be disposed of.
 */
public final class Disposable {
  private var disposeClosure: () -> Void
  
  /**
   Create a Disposable. Disposable will create a strong reference to anything that is in the dispose closure. You should invalidate/nullify your objects in there.
   
   ```
   func createTimer() -> Disposable {
     let timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: true) { _ in }
   return Disposable { timer.invalidate() }
   }
   ```
   
   - Parameter dispose: The closure that will be called when the disposable should be disposed of. You should invalidate
   */
  public init(_ dispose: @escaping () -> Void) {
    self.disposeClosure = dispose
  }
  
  /**
   Ensure that the Disposable is disposed up properly.
   
   ```
   bind(
     \textField.text,
     to: label,
     at: \UILabel.text
   ).disposedBy(disposeBag)
   ```
   
   - Parameter disposeBag: The bag to add to
   */
  public func disposedBy(_ disposeBag: DisposeBag) {
    disposeBag.append(self)
  }
  
  /**
   You can call this to manually dispose of the disposable. Ideally you should call disposedBy(_:) instead of calling dispose() manually as disposedBy(_:) will take care of this for you.
   */
  public func dispose() {
    disposeClosure()
  }
  
  deinit {
    dispose()
  }
}

public final class DisposeBag {
  private var disposables: [Disposable] = []
  
  /**
   Add a new disposable to the bag
   */
  public func append(_ disposable: Disposable) {
    disposables.append(disposable)
  }
  
  /**
   You can call this to manually dispose of all disposables in the bag. Ideally you should call disposedBy(_:) on Disposable instead of calling dispose() manually as disposedBy(_:) will take care of this for you.
   */
  public func dispose() {
    for disposable in disposables {
      disposable.dispose()
    }
  }
  
  deinit {
    dispose()
  }
}
