# react-native-textinput-ios
### react native version of UITextField
为了解决，在设置了 maxLength 之后，最后一个中文字符无法输入的问题

#### Installing
`npm install react-native-textinput-ios --save`
#### Lingking Native Dependencies
`react-naitve link react-native-textinput-ios`
#### Usage
`import TextInputIOS from 'react-native-textinput-ios';`
```
<TextInputIOS defaultValue='sdfsdf' maxLength={5}/>

```
#### Properties
```
placeholder: PropTypes.string,
placeholderTextColor: PropTypes.string,
maxLength: PropTypes.number,
onChange: PropTypes.func,
onChangeText: PropTypes.func,
defaultValue: PropTypes.string,
value: PropTypes.string,
returnKeyType: PropTypes.oneOf([
'done',
'go',
'next',
'search',
'send',
'default',
'emergency-call',
'google',
'join',
'route',
'yahoo',
]),
autoFocus: PropTypes.bool,
text: PropTypes.string,
onFocus: PropTypes.func,
onBlur: PropTypes.func,
onEndEditing: PropTypes.func
```
