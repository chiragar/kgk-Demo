// final List<String> shapeList = ["BR", "CU", "OV", "RAD"];
import 'package:kgk/src/core/constant/app_assets.dart';
import 'package:kgk/src/data/model/stone_shape.dart';

List<StoneShape> stoneShapeData = [
  StoneShape(
    id: 1,
    stoneName: "CU",
    stoneImage: AppAssets.cushion,
  ),
  StoneShape(
    id: 2,
    stoneName: "EM",
    stoneImage: AppAssets.emerald,
  ),
  StoneShape(
    id: 3,
    stoneName: "HS",
    stoneImage: AppAssets.heart,
  ),
  StoneShape(
    id: 4,
    stoneName: "MQ",
    stoneImage: AppAssets.marquise,
  ),
  StoneShape(
    id: 5,
    stoneName: "OV",
    stoneImage: AppAssets.oval,
  ),
  StoneShape(
    id: 6,
    stoneName: "PR",
    stoneImage: AppAssets.pear,
  ),
  StoneShape(
    id: 7,
    stoneName: "PS",
    stoneImage: AppAssets.princess,
  ),
  StoneShape(
    id: 8,
    stoneName: "RAD",
    stoneImage: AppAssets.radiant,
  ),
  StoneShape(
    id: 9,
    stoneName: "RAD",
    stoneImage: AppAssets.round,
  ),
  StoneShape(
    id: 10,
    stoneName: "BR",
    stoneImage: AppAssets.others,
  ),
];

final List<String> colorList = [
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O-P",
  "U-V",
  "F-YELLOW"
];
final List<String> clarityList = [
  "FL",
  "IF",
  "VVS1",
  "VVS2",
  "VS1",
  "VS2",
  "SM1",
  "SM2",
  "SM3",
  "I1",
  "I2",
  "I3"
];
final List<String> labList = ["GIA", "IGI", "HRD", "OTHER"];
