#import "FlutterNfcPlugin.h"
#import "NdefParser.h"
#import "NdefResult.h";

@implementation FlutterNfcPlugin

API_AVAILABLE(ios(11.0))
NFCNDEFReaderSession* nfcSession;
FlutterResult resulter;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_nfc"
            binaryMessenger:[registrar messenger]];
  FlutterNfcPlugin* instance = [[FlutterNfcPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    resulter = result;
    
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"readNfc" isEqualToString:call.method]) {
      [self handleRead];
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)handleRead {
    if (@available(iOS 11.0, *)) {
        nfcSession = [[NFCNDEFReaderSession alloc]initWithDelegate:self queue:dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT) invalidateAfterFirstRead: YES];
        [nfcSession beginSession];
    } 
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages  API_AVAILABLE(ios(11.0)){
    for (NFCNDEFMessage *message in messages) {
        for (NFCNDEFPayload *payload in message.records) {
            
            NSString *type = [[NSString alloc] initWithData:payload.type encoding:NSUTF8StringEncoding];
            NdefResult *result;
            
            if([type  isEqual: @"T"]) {
                result = [NdefParser getNdefTextContent:payload.payload];
            } else {
                result = [NdefParser getNdefUrnContent:payload.payload];
            }
            
            resulter([result toString]);
        }
    }
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error  API_AVAILABLE(ios(11.0)){
    
}

@end
