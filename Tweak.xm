#import <UIKit/UIKit.h>

@interface _UILegibilityView : UIView
@end

@interface SBIconView : UIView
- (void)setLabelHidden:(BOOL)hidden;
@property(nonatomic) int location;
@end

%hook SBIconView

- (void) layoutSubviews {
    %orig;

    BOOL isInDock = [self location] == 3; //SBIconViewLocation.SBIconViewLocationDock

    MSHookIvar<_UILegibilityView *>(self, "_labelView").hidden = isInDock;
}

%end
