#import <Flutter/Flutter.h>
#import <CoreNFC/CoreNFC.h>

@interface FlutterNfcPlugin : NSObject<FlutterPlugin, NFCNDEFReaderSessionDelegate>
@end
