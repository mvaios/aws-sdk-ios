//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSTranslateResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranslateResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranslateResources

+ (instancetype)sharedInstance {
    static AWSTranslateResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranslateResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-07-01\",\
    \"endpointPrefix\":\"translate\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Translate\",\
    \"serviceId\":\"Translate\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"translate\",\
    \"targetPrefix\":\"AWSShineFrontendService_20170701\",\
    \"uid\":\"translate-2017-07-01\"\
  },\
  \"operations\":{\
    \"TranslateText\":{\
      \"name\":\"TranslateText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TranslateTextRequest\"},\
      \"output\":{\"shape\":\"TranslateTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"UnsupportedLanguagePairException\"},\
        {\"shape\":\"DetectedLanguageLowConfidenceException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Translates input text from the source language to the target language. You can translate between English (en) and one of the following languages, or between one of the following languages and English.</p> <ul> <li> <p>Arabic (ar)</p> </li> <li> <p>Chinese (Simplified) (zh)</p> </li> <li> <p>French (fr)</p> </li> <li> <p>German (de)</p> </li> <li> <p>Portuguese (pt)</p> </li> <li> <p>Spanish (es)</p> </li> </ul> <p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BoundedLengthString\":{\
      \"type\":\"string\",\
      \"max\":5000,\
      \"min\":1\
    },\
    \"DetectedLanguageLowConfidenceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"DetectedLanguageCode\":{\
          \"shape\":\"LanguageCodeString\",\
          \"documentation\":\"<p>Auto detected language code from Comprehend.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The confidence that Amazon Comprehend accurately detected the source language is low. If a low confidence level is acceptable for your application, you can use the language in the exception to call Amazon Translate again. For more information, see the <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/API_DetectDominantLanguage.html\\\">DetectDominantLanguage</a> operation in the <i>Amazon Comprehend Developer Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An internal server error occurred. Retry your request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request is invalid.</p>\",\
      \"exception\":true\
    },\
    \"LanguageCodeString\":{\
      \"type\":\"string\",\
      \"max\":5,\
      \"min\":2\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Amazon Translate is unavailable. Retry your request later.</p>\",\
      \"exception\":true\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TextSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The size of the input text exceeds the length constraint for the <code>Text</code> field. Try again with a shorter text. </p>\",\
      \"exception\":true\
    },\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of requests exceeds the limit. Resubmit your request later.</p>\",\
      \"exception\":true\
    },\
    \"TranslateTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"SourceLanguageCode\",\
        \"TargetLanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"BoundedLengthString\",\
          \"documentation\":\"<p>The text to translate.</p>\"\
        },\
        \"SourceLanguageCode\":{\
          \"shape\":\"LanguageCodeString\",\
          \"documentation\":\"<p>One of the supported language codes for the source text. If the <code>TargetLanguageCode</code> is not \\\"en\\\", the <code>SourceLanguageCode</code> must be \\\"en\\\".</p> <p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call Amazon Comprehend to determine the source language.</p>\"\
        },\
        \"TargetLanguageCode\":{\
          \"shape\":\"LanguageCodeString\",\
          \"documentation\":\"<p>One of the supported language codes for the target text. If the <code>SourceLanguageCode</code> is not \\\"en\\\", the <code>TargetLanguageCode</code> must be \\\"en\\\".</p>\"\
        }\
      }\
    },\
    \"TranslateTextResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranslatedText\",\
        \"SourceLanguageCode\",\
        \"TargetLanguageCode\"\
      ],\
      \"members\":{\
        \"TranslatedText\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text translated into the target language.</p>\"\
        },\
        \"SourceLanguageCode\":{\
          \"shape\":\"LanguageCodeString\",\
          \"documentation\":\"<p>The language code for the language of the input text. </p>\"\
        },\
        \"TargetLanguageCode\":{\
          \"shape\":\"LanguageCodeString\",\
          \"documentation\":\"<p>The language code for the language of the translated text. </p>\"\
        }\
      }\
    },\
    \"UnsupportedLanguagePairException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Amazon Translate cannot translate input text in the source language into this target language. For more information, see <a>how-to-error-msg</a>. </p>\",\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<p>Provides translation between English and one of six languages, or between one of the six languages and English.</p>\"\
}\
";
}

@end