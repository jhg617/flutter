import 'package:flutter/material.dart';

class Tabinfo{
  final IconData icon;
  final String label;

  const Tabinfo({
    required this.icon,
    required this.label,
  });
}

const TABS = [
  Tabinfo(
    icon: Icons.account_balance_outlined,
    label: '지갑',
  ),
  Tabinfo(
    icon: Icons.alarm_add_outlined,
    label: '알람',
  ),
  Tabinfo(
    icon: Icons.keyboard,
    label: '키보드',
  ),
  Tabinfo(
    icon: Icons.ac_unit,
    label: '온도',
  ),
  Tabinfo(
    icon: Icons.adb,
    label: '안드로이드',
  ),
];