//
//  File.swift
//  
//
//  Created by Nick Berendsen on 07/09/2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif


#if os(macOS)

/// Alias for NSImage
public typealias SWIFTImage = NSImage

/// Alias for NSColor
public typealias SWIFTColor = NSColor

let primaryColor = NSColor.labelColor
let backgroundColor = NSColor.windowBackgroundColor

/// Alias for NSFont
public typealias SWIFTFont = NSFont

#else

/// Alias for UIImage
public typealias SWIFTImage = UIImage

/// Alias for UIColor
public typealias SWIFTColor = UIColor

/// Alias for UIFont
public typealias SWIFTFont = UIFont

//let primaryColor = UIColor.label
//let backgroundColor = UIColor.systemBackground

let primaryColor = UIColor.init(hex: "454647")
let backgroundColor = UIColor.init(hex: "303133")
let stringColor = UIColor.init(hex: "6E6F70")
let fretColor = UIColor.init(hex: "1D1D1D")
let nutColor = UIColor.init(hex: "929394")
let dotColor = UIColor.init(hex: "19C63E")
let dotLabelColor = UIColor.init(hex: "121212")






#endif
