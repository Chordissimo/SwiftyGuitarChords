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

let primaryColor = UIColor(rgb: 0x454647)
let backgroundColor = UIColor(rgb: 0x303133)
let stringColor = UIColor(rgb: 0x6E6F70)
let fretColor = UIColor(rgb: 0x1D1D1D)
let nutColor = UIColor(rgb: 0x929394)
let dotColor = UIColor(rgb: 0x19C63E)
let dotLabelColor = UIColor(rgb: 0x121212)






#endif
