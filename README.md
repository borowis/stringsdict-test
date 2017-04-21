# stringsdict-test
Testing iOS/macOS plurals localization file format (stringsdict). Take aways:
* order of dictionaries doesn’t matter e.g.
  ```xml
  <key>fields</key>
  <dict>
      <key>NSStringFormatSpecTypeKey</key>
      <string>NSStringPluralRuleType</string>
      <key>NSStringFormatValueTypeKey</key>
      <string>d</string>
      <key>one</key>
      <string>%3$d field</string>
      <key>other</key>
      <string>%3$d fields</string>
  </dict>

  <key>geese</key>
  <dict>
      <key>NSStringFormatSpecTypeKey</key>
      <string>NSStringPluralRuleType</string>
      <key>NSStringFormatValueTypeKey</key>
      <string>d</string>
      <key>one</key>
      <string>%2$d goose</string>
      <key>other</key>
      <string>%2$d geese</string>
  </dict>
  ```
* indices on `%#@...@` variables matter
  ```xml
  <key>NSStringLocalizedFormatKey</key>
  <string>%1$d: %3$#@geese@ landed on %2$#@fields@</string>
  ```
  is not the same as 
  ```xml
  <key>NSStringLocalizedFormatKey</key>
  <string>%1$d: %2$#@geese@ landed on %3$#@fields@</string>
  ```
* indices of dictionaries should agree with indices of placeholders
  e.g. this won't work
  ```xml
  <key>geese.landed.ct</key>
  <dict>
      <key>NSStringLocalizedFormatKey</key>
      <string>%2$#@geese@ landed on %1$#@fields@</string>
      <key>geese</key>
      <dict>
          <key>NSStringFormatSpecTypeKey</key>
          <string>NSStringPluralRuleType</string>
          <key>NSStringFormatValueTypeKey</key>
          <string>d</string>
          <key>one</key>
          <string>%1$d goose</string>
          <key>other</key>
          <string>%1$d geese</string>
      </dict>

      <key>fields</key>
      <dict>
          <key>NSStringFormatSpecTypeKey</key>
          <string>NSStringPluralRuleType</string>
          <key>NSStringFormatValueTypeKey</key>
          <string>d</string>
          <key>one</key>
          <string>%2$d field</string>
          <key>other</key>
          <string>%2$d fields</string>
      </dict>
  </dict>  
  ```
  
