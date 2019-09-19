//
//  MessageType.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 18/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import Foundation
// Int String canbe used without providing encoding initializer but if the keys are different than we need to provide also the value as audio = "AudioFile"
enum MessageType: String, Decodable {
//    this type of ussage is more convenient to use trough the app and just use switch cases to prevent different type of data actions
    case audio
    case video
    case text
}
