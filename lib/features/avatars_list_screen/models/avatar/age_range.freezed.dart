// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'age_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgeRange _$AgeRangeFromJson(Map<String, dynamic> json) {
  return _AgeRange.fromJson(json);
}

/// @nodoc
mixin _$AgeRange {
  String get label => throw _privateConstructorUsedError;
  int get minAge => throw _privateConstructorUsedError;
  int get maxAge => throw _privateConstructorUsedError;

  /// Serializes this AgeRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgeRangeCopyWith<AgeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeRangeCopyWith<$Res> {
  factory $AgeRangeCopyWith(AgeRange value, $Res Function(AgeRange) then) =
      _$AgeRangeCopyWithImpl<$Res, AgeRange>;
  @useResult
  $Res call({String label, int minAge, int maxAge});
}

/// @nodoc
class _$AgeRangeCopyWithImpl<$Res, $Val extends AgeRange>
    implements $AgeRangeCopyWith<$Res> {
  _$AgeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? minAge = null,
    Object? maxAge = null,
  }) {
    return _then(
      _value.copyWith(
            label:
                null == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String,
            minAge:
                null == minAge
                    ? _value.minAge
                    : minAge // ignore: cast_nullable_to_non_nullable
                        as int,
            maxAge:
                null == maxAge
                    ? _value.maxAge
                    : maxAge // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgeRangeImplCopyWith<$Res>
    implements $AgeRangeCopyWith<$Res> {
  factory _$$AgeRangeImplCopyWith(
    _$AgeRangeImpl value,
    $Res Function(_$AgeRangeImpl) then,
  ) = __$$AgeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int minAge, int maxAge});
}

/// @nodoc
class __$$AgeRangeImplCopyWithImpl<$Res>
    extends _$AgeRangeCopyWithImpl<$Res, _$AgeRangeImpl>
    implements _$$AgeRangeImplCopyWith<$Res> {
  __$$AgeRangeImplCopyWithImpl(
    _$AgeRangeImpl _value,
    $Res Function(_$AgeRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? minAge = null,
    Object? maxAge = null,
  }) {
    return _then(
      _$AgeRangeImpl(
        label:
            null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String,
        minAge:
            null == minAge
                ? _value.minAge
                : minAge // ignore: cast_nullable_to_non_nullable
                    as int,
        maxAge:
            null == maxAge
                ? _value.maxAge
                : maxAge // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgeRangeImpl extends _AgeRange {
  const _$AgeRangeImpl({
    required this.label,
    required this.minAge,
    required this.maxAge,
  }) : super._();

  factory _$AgeRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgeRangeImplFromJson(json);

  @override
  final String label;
  @override
  final int minAge;
  @override
  final int maxAge;

  @override
  String toString() {
    return 'AgeRange(label: $label, minAge: $minAge, maxAge: $maxAge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgeRangeImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, minAge, maxAge);

  /// Create a copy of AgeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgeRangeImplCopyWith<_$AgeRangeImpl> get copyWith =>
      __$$AgeRangeImplCopyWithImpl<_$AgeRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgeRangeImplToJson(this);
  }
}

abstract class _AgeRange extends AgeRange {
  const factory _AgeRange({
    required final String label,
    required final int minAge,
    required final int maxAge,
  }) = _$AgeRangeImpl;
  const _AgeRange._() : super._();

  factory _AgeRange.fromJson(Map<String, dynamic> json) =
      _$AgeRangeImpl.fromJson;

  @override
  String get label;
  @override
  int get minAge;
  @override
  int get maxAge;

  /// Create a copy of AgeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgeRangeImplCopyWith<_$AgeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
