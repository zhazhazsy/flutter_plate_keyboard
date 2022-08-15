// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'flutter_plate_keyboard.dart';

class PlateKeyboard {
  static const list = [0,1,2,3,4,5,6,7];

  /// [controller]:键盘控制器
  ///
  /// [fontSize]:键盘字体大小
  ///
  /// [clickMaskDismiss]：true（点击遮罩后，将关闭dialog），false（不关闭）
  ///
  /// [debounce]：防抖功能
  ///
  /// [onDismiss]：关闭键盘的时候，该回调将会被触发
  ///
  /// [onMask]：点击遮罩时，该回调将会被触发
  ///
  /// [backDismiss]：true（返回事件将关闭，但是不会关闭页面），
  /// false（返回事件不会关闭，也不会关闭页面），你仍然可以使用dismiss方法来关闭
  ///
  /// [bindPage]：将该dialog与当前页面绑定，绑定页面不在路由栈顶，dialog自动隐藏，绑定页面置于路由栈顶，dialog自动显示;
  /// 绑定页面被关闭,被绑定在该页面上的dialog也将被移除
  PlateKeyboard.show({
    required KeyboardController controller,
    double fontSize = 14,
    VoidCallback? onDismiss,
    VoidCallback? onMask,
    bool? clickMaskDismiss = true,
    bool? backDismiss = true,
    bool bindPage = true,
    bool debounce = true,
  }) {
    SmartDialogController smartDialogController = SmartDialogController();
    SmartDialog.show<String?>(
        alignment: Alignment.bottomCenter,
        onDismiss: onDismiss,
        onMask: onMask,
        controller: smartDialogController,
        clickMaskDismiss: clickMaskDismiss,
        bindPage: bindPage,
        backDismiss: backDismiss,
        debounce: debounce,
        keepSingle: true,
        builder: (context){
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.index > 6 ? Container(
                  height: 44,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          "完成",
                          style: TextStyle(
                              fontSize: fontSize,
                              color: const Color(0xFF008AFF)
                          ),
                        ),
                        onTap: (){
                          SmartDialog.dismiss(result: controller.plate);
                        },
                      ),
                      const SizedBox(width: 15)
                    ],
                  ),
                ):const SizedBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                  child: GridView.count(
                    padding: const EdgeInsets.all(0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true,
                    crossAxisCount: 8,
                    childAspectRatio: 0.74,
                    crossAxisSpacing: 8,
                    children: list.map((k) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: controller.index == k ? const Color(0xFF008AFF) : k == 7 ? const Color(0xFF969799) : const Color(0xFF555555),
                            width: 2,
                          )
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.plateNumber[k],
                        style: TextStyle(
                            fontSize: fontSize
                        ),
                      ),
                    )).toList(),
                  ),
                ),
                Container(
                  color: const Color(0xFFF2F3F5),
                  padding: const EdgeInsets.all(10),
                  child: GridView.count(
                    padding: const EdgeInsets.all(0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true,
                    crossAxisCount: controller.index == 0 ? 9 : 10,
                    childAspectRatio: 0.74,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: [
                      ...controller.keyList[controller.index].clickableKey.map((e) => GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.keyList[controller.index].notClickable.contains(e)?const Color(0xFF909399):Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontSize: fontSize
                            ),
                          ),
                        ),
                        onTap: (){
                          if(!controller.keyList[controller.index].notClickable.contains(e)){
                            controller.input(e);
                            if(controller.isComplete){
                              SmartDialog.dismiss(result: controller.plate);
                            }
                            smartDialogController.refresh();
                          }
                        },
                      )).toList(),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        onTap: (){
                          controller.delete();
                          smartDialogController.refresh();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}