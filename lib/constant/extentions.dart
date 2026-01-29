import 'package:flutter/material.dart';

extension gap1 on num {
  SizedBox get gap => SizedBox(height: this.toDouble(), width: this.toDouble());
}
