#import "QRCodeReaderView.h"

@interface QRCodeReaderView ()
@property (nonatomic, strong) CAShapeLayer *overlay;

@end

@implementation QRCodeReaderView

- (id)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
    [self addOverlay];
  }

  return self;
}

- (void)drawRect:(CGRect)rect
{
    int originalWidth = rect.size.width;
    int originalHeight = rect.size.height;
    
    int innerRectWidth = 50;
    int innerRectHeight = originalHeight * 0.4; // portrait mode
    
    if (originalWidth > originalHeight) { // landscape
        innerRectHeight = originalHeight * 0.3;
    }
    
    CGRect innerRect = CGRectInset(rect, innerRectWidth, innerRectHeight);

    CGRect offsetRect = CGRectOffset(innerRect, 0, 15);

    _overlay.path = [UIBezierPath bezierPathWithRoundedRect:offsetRect cornerRadius:5].CGPath;
}

#pragma mark - Private Methods

- (void)addOverlay
{
  _overlay = [[CAShapeLayer alloc] init];
  _overlay.backgroundColor = [UIColor clearColor].CGColor;
  _overlay.fillColor       = [UIColor clearColor].CGColor;
  _overlay.strokeColor     = [UIColor whiteColor].CGColor;
  _overlay.lineWidth       = 3;
  _overlay.lineDashPattern = @[@7.0, @7.0];
  _overlay.lineDashPhase   = 0;

  [self.layer addSublayer:_overlay];
}

@end
