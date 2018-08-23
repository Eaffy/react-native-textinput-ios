/**
 * Created by QiaoYiFei on 2018/7/31
 */
// MapView.js
import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {requireNativeComponent} from 'react-native';

class TextInputIOS extends Component {
  
  componentDidMount () {
    if (this.props.autoFocus) {
      this._textInput.focus()
    }
  }

  _onChange = (event) => {
    // Make sure to fire the mostRecentEventCount first so it is already set on
    // native when the text value is set.
    var text = event.nativeEvent.text;
    this.props.onChange && this.props.onChange(event);
    this.props.onChangeText && this.props.onChangeText(text);

    if (!this._textInput) {
      // calling `this.props.onChange` or `this.props.onChangeText`
      // may clean up the input itself. Exits here.
      return;
    }
  }

  _onFocus = (event) => {
    
  }

  _onBlur = (event) => {
    this._textInput.focus()
  }

  _getText = () => {
    const {defaultValue, value} = this.props
    return value || defaultValue || ''
  }

  render() {
    return <RNGTextField ref={component => this._textInput = component}
              style={{width: 400, height: 50}} {...this.props}
              text={this._getText()}
              onChange={this._onChange}
              onFocus={this._onFocus}
              onBlur={this._onBlur}/>;
  }
}

TextInputIOS.propTypes = {
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
};

var RNGTextField = requireNativeComponent('RNGTextField', TextInputIOS);

module.exports = TextInputIOS;