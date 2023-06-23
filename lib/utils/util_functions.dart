import 'package:comnsec_mc_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(Widget? prefixIcon) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide:
      BorderSide.none,
    ),
    fillColor: bottombarColor,
    alignLabelWithHint: true,
    filled: true,
    isDense: true,
    isCollapsed: true,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    ),
    contentPadding: const EdgeInsets.only(left: 10, right: 10,top: 15),
    prefixIcon: prefixIcon,
    counter: const Text(""),
    hintStyle: const TextStyle(
        color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
  );
}



IgnorePointer buildIgnorePointer() {
  return IgnorePointer(
    ignoring: true,
    child: SizedBox(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bottombarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text(
              'x1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pause_rounded, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.redo_rounded,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    ),
  );
}