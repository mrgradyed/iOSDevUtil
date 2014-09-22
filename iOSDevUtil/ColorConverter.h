//
//  Utilities.h
//  Memorans
//
//  Created by emi on 29/07/14.
//  Copyright (c) 2014 Emiliano D'Alterio. All rights reserved.
//

@interface ColorConverter : NSObject

#pragma mark - PUBLIC METHODS

// A HEX string to UIColor converter.

+ (UIColor *)colorFromHEXString:(NSString *)hexString withAlpha:(CGFloat)alpha;

@end
