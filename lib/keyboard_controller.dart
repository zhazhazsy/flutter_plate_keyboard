// ignore_for_file: constant_identifier_names
import 'package:flutter/cupertino.dart';

class KeyboardController extends ValueNotifier<KeyboardValue>{
  KeyboardController({this.initPlate = "",}) : super(KeyboardValue(plate: initPlate,index: initPlate.length > 7 ? 7 : initPlate.length)){
    if(initPlate != ""){
      for(int i = 0; i < initPlate.length; i++){
        plateNumber[i] = initPlate[i];
      }
    }
    _plateWidget();
  }
  final String initPlate;

  List<KeyboardContent> keyList = [];//键盘显示的内容，维护这个列表即可

  List<String> plateNumber = List.filled(8, "");

  String get plate => value.plate;
  int get index => value.index;

  bool _complete = false;

  @override
  set value(KeyboardValue newValue) {
    super.value = newValue;
  }

  input(String key){
    plateNumber[index] = key;
    if(index == 7){
      _complete = true;
    }else{
      _complete = false;
    }
    value = value.copyWith(plate: plate + key,index: _complete? 7 :index + 1);
  }

  delete(){
    int index2 = index;
    _complete = false;
    if(plateNumber[index] != ""){
      plateNumber[index] = "";
    }else{
      if(index > 0){
        plateNumber[index - 1] = "";
        index2 = index - 1;
      }else{
        index2 = 0;
      }
    }
    String p = _getPlate();
    value = value.copyWith(plate: p, index: index2);
  }

  bool get isComplete => _complete;

  String _getPlate(){
    String result = "";
    for (var value in plateNumber) {
      result += value;
    }
    return result;
  }

  _plateWidget(){
    List<String> keyboardItem = [];
    keyboardItem.addAll(NUMBERS);
    keyboardItem.addAll(ALPHABETS[0]);
    keyboardItem.addAll(ALPHABETS[1]);
    keyboardItem.addAll(ALPHABETS[2]);

    KeyboardContent keyboard1 = KeyboardContent();
    keyboard1.clickableKey = PROVINCES;
    keyList.add(keyboard1);

    KeyboardContent keyboard2 = KeyboardContent();

    keyboard2.clickableKey = keyboardItem;
    keyboard2.notClickable.addAll(NUMBERS);
    keyboard2.notClickable.addAll(SPECIALS);
    keyList.add(keyboard2);

    KeyboardContent keyboard3 = KeyboardContent();
    keyboard3.clickableKey = keyboardItem;
    keyboard3.notClickable.addAll(SPECIALS);
    keyList.add(keyboard3);

    KeyboardContent keyboard4 = KeyboardContent();
    keyboard4.clickableKey = keyboardItem;
    keyboard4.notClickable.addAll(SPECIALS);
    keyList.add(keyboard4);

    KeyboardContent keyboard5 = KeyboardContent();
    keyboard5.clickableKey = keyboardItem;
    keyboard5.notClickable.addAll(SPECIALS);
    keyList.add(keyboard5);

    KeyboardContent keyboard6 = KeyboardContent();
    keyboard6.clickableKey = keyboardItem;
    keyboard6.notClickable.addAll(SPECIALS);
    keyboard6.notClickable.add("O");
    keyList.add(keyboard6);

    KeyboardContent keyboard7 = KeyboardContent();
    keyboard7.clickableKey.addAll(NUMBERS);
    keyboard7.clickableKey.addAll(ALPHABETS[3]);
    keyboard7.clickableKey.addAll(ALPHABETS[1]);
    keyboard7.clickableKey.addAll(ALPHABETS[2]);
    keyList.add(keyboard7);
    keyList.add(keyboard7);
  }
}


class KeyboardValue{
  const KeyboardValue({this.plate = "", this.index = 0});

  final int index;
  final String plate;

  KeyboardValue copyWith({required String plate, required int index}){
    return KeyboardValue(plate: plate,index: index);
  }
}

class KeyboardContent{
  List<String> clickableKey = [];
  List<String> notClickable = [];
}

const PROVINCES = ['京', '津', '晋', '冀', '蒙', '辽', '黑', '吉', '沪', '苏', '浙', '皖', '闽', '赣', '鲁', '豫',
  '鄂', '湘', '粤', '桂', '琼', '渝', '川', '贵', '云', '藏', '陕', 'W', '甘', '青', '宁', '新', '使', '虚', '台',
];
const NUMBERS = [
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
];
const ALPHABETS = [
  [
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'O', 'P', '领',
  ],
  [
    'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', '警',
  ],
  [
    'Z', 'X', 'C', 'V', 'B', 'N', 'M', '港', '澳',
  ],
  [
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'P', '学', '领',
  ],
];
const SPECIALS = [
  '学', '领', '警', '港', '澳',
];