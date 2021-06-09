#import <Cocoa/Cocoa.h>

#define WINDOW_WIDTH 1280
#define WINDOW_HEIGHT 720

@interface ViewController : NSViewController

@end

@interface ViewController () {
  NSView *redBox;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  redBox = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
  [self.view addSubview:redBox];
  [redBox setWantsLayer:YES];
  [[redBox layer] setBackgroundColor:[[NSColor redColor] CGColor]];
}

- (void)setRepresentedObject:(id)representedObject {
  [super setRepresentedObject:representedObject];
}

- (void)loadView {
  self.view = [[NSView alloc]
      initWithFrame:NSMakeRect(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)];
}

@end

@interface AppDelegate : NSObject <NSApplicationDelegate>

@end

@interface AppDelegate () {
  NSWindow *window;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  window = [[NSWindow alloc]
      initWithContentRect:NSMakeRect(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)
                styleMask:NSWindowStyleMaskMiniaturizable |
                          NSWindowStyleMaskClosable |
                          NSWindowStyleMaskResizable | NSWindowStyleMaskTitled
                  backing:NSBackingStoreBuffered
                    defer:NO];
  [window setTitle:@"A random app"];
  [window setContentViewController:[[ViewController alloc] init]];
  [window makeKeyAndOrderFront:nil];

  CGFloat xPos =
      NSWidth([[window screen] frame]) / 2 - NSWidth([window frame]) / 2;
  CGFloat yPos =
      NSHeight([[window screen] frame]) / 2 - NSHeight([window frame]) / 2;
  [window setFrame:NSMakeRect(xPos, yPos, NSWidth([window frame]),
                              NSHeight([window frame]))
           display:YES];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

@end

int main(int argc, const char *argv[]) {
  AppDelegate *appDelegate = [[AppDelegate alloc] init];
  [[NSApplication sharedApplication] setDelegate:appDelegate];
  return NSApplicationMain(argc, argv);
}