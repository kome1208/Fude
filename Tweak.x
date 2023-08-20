#import "Tweak.h"

BOOL enabled = NO;
UIColor *homebarColor;

static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.kome1.fude.plist")];
	enabled = [[settings objectForKey:@"enabled"] boolValue] ? [[settings objectForKey:@"enabled"] boolValue] : NO;
	homebarColor = [SparkColourPickerUtils colourWithString:[settings objectForKey:@"homebarColor"] withFallback:@"#ffffff"]; 
}

%group Tweak
%hook MTLumaDodgePillView
- (void)_updateStyle {
	%orig;
	self.style = 0;
}
- (void)layoutSubviews {
	%orig;
	self.backgroundColor = homebarColor;
}
%end
%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.kome1.fude/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (enabled) {
		%init(Tweak);
	}
}