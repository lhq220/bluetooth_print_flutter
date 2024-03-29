import 'package:json_annotation/json_annotation.dart';

part 'bluetooth_print_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BluetoothDevice {
  BluetoothDevice();

  String? name;
  String? address;
  int? type = 0;
  bool? connected = false;

  factory BluetoothDevice.fromJson(Map<String, dynamic> json) =>
      _$BluetoothDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$BluetoothDeviceToJson(this);

  BluetoothDevice.fromMap(Map map)
      : name = map['name'],
        address = map['address'];
}

@JsonSerializable(includeIfNull: false)
class LineText {
  LineText(
      {this.type, //text,barcode,qrcode,image(base64 string)
      this.content,
      this.content2,
      this.size = 0,
      this.align = ALIGN_LEFT,
      this.weight = 0, //0,1
      this.width = 0, //0,1
      this.height = 0, //0,1
      this.fontZoom = 1,
      this.underline = 0, //0,1
      this.linefeed = 0, //0,1
      this.x = 0,
      this.relativeX = 0,
      this.y = 0});

  static const String TYPE_TEXT = 'text';
  static const String TYPE_BARCODE = 'barcode';
  static const String TYPE_QRCODE = 'qrcode';
  static const String TYPE_IMAGE = 'image';
  static const int ALIGN_LEFT = 0;
  static const int ALIGN_CENTER = 1;
  static const int ALIGN_RIGHT = 2;
  static const int ALIGN_LEFTRIGHT = 3;

  /// print type ,inculde['text','barcode','qrcode','image']
  final String? type;

  /// ['text','barcode','qrcode','image'] need print content
  final String? content;

  /// ['text','barcode','qrcode','image'] need print content
  final String? content2;

  /// ['qrcode'] qrcode size ,only when type is qrcode
  final int? size;

  /// ['text'] text align
  final int? align;

  /// ['text'] double
  final int? weight;
  final int? width;
  final int? height;

  /// ['text'] font zoom level, 1 normal, >1 double size
  final int? fontZoom;

  /// ['text'] show underline
  final int? underline;

  /// ['text'] print linebreak
  final int? linefeed;

  /// ['text'] absolute position from line begin
  final int? x;

  /// ['text'] relative position from last content
  final int? relativeX;

  final int? y;

  factory LineText.fromJson(Map<String, dynamic> json) =>
      _$LineTextFromJson(json);
  Map<String, dynamic> toJson() => _$LineTextToJson(this);
}
