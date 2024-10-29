/*
 * Copyright (C) Yubico.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI

struct ListStatusView: View {
    
    let image: Image
    let message: String
    let height: CGFloat
    @State var showWhatsNew = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 25) {
                image
                    .font(.system(size: 100.0))
                    .foregroundColor(Color(.yubiBlue))
                    .accessibilityHidden(true)
                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                Spacer()
            }
            Spacer()
        }
        .frame(height: height)
    }
}

struct ListStatusViewView_Previews: PreviewProvider {
    static var previews: some View {
        ListStatusView(image: Image(systemName: "figure.surfing"), message: "Gone surfing, will be back tomorrow", height: 300)
    }
}
