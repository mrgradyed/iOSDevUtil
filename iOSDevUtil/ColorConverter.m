//# The MIT License (MIT)
//
//# Copyright (c) 2014 Emiliano D'Alterio
//
//# Permission is hereby granted, free of charge, to any person obtaining a copy
//# of this software and associated documentation files (the "Software"), to deal
//# in the Software without restriction, including without limitation the rights
//# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//# copies of the Software, and to permit persons to whom the Software is
//# furnished to do so, subject to the following conditions:
//
//# The above copyright notice and this permission notice shall be included
//# in all copies or substantial portions of the Software.
//
//# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//# SOFTWARE.

@import Foundation;
@import UIKit;

#import "ColorConverter.h"

@implementation ColorConverter

#pragma mark - COLORS

+ (UIColor *)colorFromHEXString:(NSString *)hexString withAlpha:(CGFloat)alpha
{
    // A HEX string to UIColor converter.

    if ([hexString hasPrefix:@"#"])
    {
        // If the HEX string has a # prefix, remove it.

        hexString = [hexString substringFromIndex:1];
    }

    if ([hexString length] != 6)
    {
        // The HEX string must be 6 chars now, if not, exit returning nil.

        return nil;
    }

    // Split the HEX string into 3 slices of 2 chars each.

    NSString *red = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *green = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *blue = [hexString substringWithRange:NSMakeRange(4, 2)];

    // Get a string scanner on the first slice.

    NSScanner *scanner = [NSScanner scannerWithString:red];

    unsigned redInt;

    // Scan the "red" slice of the HEX string.

    if (![scanner scanHexInt:&redInt])
    {
        // Error, no valid hexadecimal integer representation found, return nil.

        return nil;
    }

    // Scan the "green" slice of the HEX string.

    scanner = [NSScanner scannerWithString:green];

    unsigned greenInt;

    if (![scanner scanHexInt:&greenInt])
    {
        // Error, no valid hexadecimal integer representation found, return nil.

        return nil;
    }

    // Scan the "blue" slice of the HEX string.

    scanner = [NSScanner scannerWithString:blue];

    unsigned blueInt;

    if (![scanner scanHexInt:&blueInt])
    {
        // Error, no valid hexadecimal integer representation found, return nil.

        return nil;
    }

    // We got valid red, green and blue values,
    // create and return the UIColor with the specified alpha.
    // Extreme values for r,g,b are (0/255.0) = 0.0 and (255/255.0) = 1.0

    return [UIColor colorWithRed:redInt / 255.0f
                           green:greenInt / 255.0f
                            blue:blueInt / 255.0f
                           alpha:alpha];
}

@end
