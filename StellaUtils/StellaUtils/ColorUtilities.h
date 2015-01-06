
@interface ColorUtilities : NSObject

#pragma mark - PUBLIC METHODS

// A HEX string to UIColor converter.

+ (UIColor *)colorFromHEXString:(NSString *)hexString withAlpha:(CGFloat)alpha;

// A random color generator that uses a nice palette.

+ (UIColor *)randomNiceColor;

// A random 3-color gradient generator.

+ (CAGradientLayer *)randomGradient;

@end
