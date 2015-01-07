
@import Foundation;

@interface SharedNetworkIndicatorController : NSObject

#pragma mark - PUBLIC PROPERTIES

@property(nonatomic) NSInteger networkActivitiesCount;

#pragma mark - PUBLIC METHODS

- (void)networkActivityDidStart;

- (void)networkActivityDidStop;

+ (instancetype)sharedInstance;

@end
