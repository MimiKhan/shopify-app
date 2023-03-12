// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopify_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopifyImage _$ShopifyImageFromJson(Map<String, dynamic> json) {
  return _ShopifyImage.fromJson(json);
}

/// @nodoc
mixin _$ShopifyImage {
  String get originalSrc => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopifyImageCopyWith<ShopifyImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopifyImageCopyWith<$Res> {
  factory $ShopifyImageCopyWith(
          ShopifyImage value, $Res Function(ShopifyImage) then) =
      _$ShopifyImageCopyWithImpl<$Res, ShopifyImage>;
  @useResult
  $Res call({String originalSrc, String? url, String id});
}

/// @nodoc
class _$ShopifyImageCopyWithImpl<$Res, $Val extends ShopifyImage>
    implements $ShopifyImageCopyWith<$Res> {
  _$ShopifyImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalSrc = null,
    Object? url = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      originalSrc: null == originalSrc
          ? _value.originalSrc
          : originalSrc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopifyImageCopyWith<$Res>
    implements $ShopifyImageCopyWith<$Res> {
  factory _$$_ShopifyImageCopyWith(
          _$_ShopifyImage value, $Res Function(_$_ShopifyImage) then) =
      __$$_ShopifyImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String originalSrc, String? url, String id});
}

/// @nodoc
class __$$_ShopifyImageCopyWithImpl<$Res>
    extends _$ShopifyImageCopyWithImpl<$Res, _$_ShopifyImage>
    implements _$$_ShopifyImageCopyWith<$Res> {
  __$$_ShopifyImageCopyWithImpl(
      _$_ShopifyImage _value, $Res Function(_$_ShopifyImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalSrc = null,
    Object? url = freezed,
    Object? id = null,
  }) {
    return _then(_$_ShopifyImage(
      originalSrc: null == originalSrc
          ? _value.originalSrc
          : originalSrc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopifyImage extends _ShopifyImage {
  _$_ShopifyImage({required this.originalSrc, this.url, required this.id})
      : super._();

  factory _$_ShopifyImage.fromJson(Map<String, dynamic> json) =>
      _$$_ShopifyImageFromJson(json);

  @override
  final String originalSrc;
  @override
  final String? url;
  @override
  final String id;

  @override
  String toString() {
    return 'ShopifyImage(originalSrc: $originalSrc, url: $url, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopifyImage &&
            (identical(other.originalSrc, originalSrc) ||
                other.originalSrc == originalSrc) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, originalSrc, url, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopifyImageCopyWith<_$_ShopifyImage> get copyWith =>
      __$$_ShopifyImageCopyWithImpl<_$_ShopifyImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopifyImageToJson(
      this,
    );
  }
}

abstract class _ShopifyImage extends ShopifyImage {
  factory _ShopifyImage(
      {required final String originalSrc,
      final String? url,
      required final String id}) = _$_ShopifyImage;
  _ShopifyImage._() : super._();

  factory _ShopifyImage.fromJson(Map<String, dynamic> json) =
      _$_ShopifyImage.fromJson;

  @override
  String get originalSrc;
  @override
  String? get url;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ShopifyImageCopyWith<_$_ShopifyImage> get copyWith =>
      throw _privateConstructorUsedError;
}
