import 'dart:ui';

var physicalScreenSize = window.physicalSize;
var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;

var width3 = logicalScreenSize.width * 0.03;
var width4 = logicalScreenSize.width * 0.04;
var width5 = logicalScreenSize.width * 0.05;
var width8 = logicalScreenSize.width * 0.08;
var width9 = logicalScreenSize.width * 0.09;

var width10 = logicalScreenSize.width * 0.1;
var width15 = logicalScreenSize.width * 0.15;
var width20 = logicalScreenSize.width * 0.2;
var width25 = logicalScreenSize.width * 0.25;

var height1 = logicalScreenSize.height * 0.01;
var height2 = logicalScreenSize.height * 0.02;
var height5 = logicalScreenSize.height * 0.05;
var height10 = logicalScreenSize.height * 0.1;
var height15 = logicalScreenSize.height * 0.15;
var height50 = logicalScreenSize.height * 0.5;
