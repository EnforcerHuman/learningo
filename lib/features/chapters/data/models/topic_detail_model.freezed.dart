// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizedTextModel {

 String? get hi; String? get en;
/// Create a copy of LocalizedTextModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<LocalizedTextModel> get copyWith => _$LocalizedTextModelCopyWithImpl<LocalizedTextModel>(this as LocalizedTextModel, _$identity);

  /// Serializes this LocalizedTextModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedTextModel&&(identical(other.hi, hi) || other.hi == hi)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hi,en);

@override
String toString() {
  return 'LocalizedTextModel(hi: $hi, en: $en)';
}


}

/// @nodoc
abstract mixin class $LocalizedTextModelCopyWith<$Res>  {
  factory $LocalizedTextModelCopyWith(LocalizedTextModel value, $Res Function(LocalizedTextModel) _then) = _$LocalizedTextModelCopyWithImpl;
@useResult
$Res call({
 String? hi, String? en
});




}
/// @nodoc
class _$LocalizedTextModelCopyWithImpl<$Res>
    implements $LocalizedTextModelCopyWith<$Res> {
  _$LocalizedTextModelCopyWithImpl(this._self, this._then);

  final LocalizedTextModel _self;
  final $Res Function(LocalizedTextModel) _then;

/// Create a copy of LocalizedTextModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hi = freezed,Object? en = freezed,}) {
  return _then(_self.copyWith(
hi: freezed == hi ? _self.hi : hi // ignore: cast_nullable_to_non_nullable
as String?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedTextModel].
extension LocalizedTextModelPatterns on LocalizedTextModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedTextModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedTextModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedTextModel value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedTextModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedTextModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedTextModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? hi,  String? en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedTextModel() when $default != null:
return $default(_that.hi,_that.en);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? hi,  String? en)  $default,) {final _that = this;
switch (_that) {
case _LocalizedTextModel():
return $default(_that.hi,_that.en);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? hi,  String? en)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedTextModel() when $default != null:
return $default(_that.hi,_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedTextModel implements LocalizedTextModel {
  const _LocalizedTextModel({this.hi, this.en});
  factory _LocalizedTextModel.fromJson(Map<String, dynamic> json) => _$LocalizedTextModelFromJson(json);

@override final  String? hi;
@override final  String? en;

/// Create a copy of LocalizedTextModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedTextModelCopyWith<_LocalizedTextModel> get copyWith => __$LocalizedTextModelCopyWithImpl<_LocalizedTextModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedTextModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedTextModel&&(identical(other.hi, hi) || other.hi == hi)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hi,en);

@override
String toString() {
  return 'LocalizedTextModel(hi: $hi, en: $en)';
}


}

/// @nodoc
abstract mixin class _$LocalizedTextModelCopyWith<$Res> implements $LocalizedTextModelCopyWith<$Res> {
  factory _$LocalizedTextModelCopyWith(_LocalizedTextModel value, $Res Function(_LocalizedTextModel) _then) = __$LocalizedTextModelCopyWithImpl;
@override @useResult
$Res call({
 String? hi, String? en
});




}
/// @nodoc
class __$LocalizedTextModelCopyWithImpl<$Res>
    implements _$LocalizedTextModelCopyWith<$Res> {
  __$LocalizedTextModelCopyWithImpl(this._self, this._then);

  final _LocalizedTextModel _self;
  final $Res Function(_LocalizedTextModel) _then;

/// Create a copy of LocalizedTextModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hi = freezed,Object? en = freezed,}) {
  return _then(_LocalizedTextModel(
hi: freezed == hi ? _self.hi : hi // ignore: cast_nullable_to_non_nullable
as String?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubjectModel {

 String? get id;@JsonKey(name: 'name_en') String? get nameEn;@JsonKey(name: 'name_hi') String? get nameHi;@JsonKey(name: 'hue_key') String? get hueKey;
/// Create a copy of SubjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectModelCopyWith<SubjectModel> get copyWith => _$SubjectModelCopyWithImpl<SubjectModel>(this as SubjectModel, _$identity);

  /// Serializes this SubjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameHi, nameHi) || other.nameHi == nameHi)&&(identical(other.hueKey, hueKey) || other.hueKey == hueKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nameEn,nameHi,hueKey);

@override
String toString() {
  return 'SubjectModel(id: $id, nameEn: $nameEn, nameHi: $nameHi, hueKey: $hueKey)';
}


}

/// @nodoc
abstract mixin class $SubjectModelCopyWith<$Res>  {
  factory $SubjectModelCopyWith(SubjectModel value, $Res Function(SubjectModel) _then) = _$SubjectModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'name_hi') String? nameHi,@JsonKey(name: 'hue_key') String? hueKey
});




}
/// @nodoc
class _$SubjectModelCopyWithImpl<$Res>
    implements $SubjectModelCopyWith<$Res> {
  _$SubjectModelCopyWithImpl(this._self, this._then);

  final SubjectModel _self;
  final $Res Function(SubjectModel) _then;

/// Create a copy of SubjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nameEn = freezed,Object? nameHi = freezed,Object? hueKey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameHi: freezed == nameHi ? _self.nameHi : nameHi // ignore: cast_nullable_to_non_nullable
as String?,hueKey: freezed == hueKey ? _self.hueKey : hueKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectModel].
extension SubjectModelPatterns on SubjectModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectModel value)  $default,){
final _that = this;
switch (_that) {
case _SubjectModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi, @JsonKey(name: 'hue_key')  String? hueKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectModel() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameHi,_that.hueKey);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi, @JsonKey(name: 'hue_key')  String? hueKey)  $default,) {final _that = this;
switch (_that) {
case _SubjectModel():
return $default(_that.id,_that.nameEn,_that.nameHi,_that.hueKey);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi, @JsonKey(name: 'hue_key')  String? hueKey)?  $default,) {final _that = this;
switch (_that) {
case _SubjectModel() when $default != null:
return $default(_that.id,_that.nameEn,_that.nameHi,_that.hueKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectModel implements SubjectModel {
  const _SubjectModel({this.id, @JsonKey(name: 'name_en') this.nameEn, @JsonKey(name: 'name_hi') this.nameHi, @JsonKey(name: 'hue_key') this.hueKey});
  factory _SubjectModel.fromJson(Map<String, dynamic> json) => _$SubjectModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'name_en') final  String? nameEn;
@override@JsonKey(name: 'name_hi') final  String? nameHi;
@override@JsonKey(name: 'hue_key') final  String? hueKey;

/// Create a copy of SubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectModelCopyWith<_SubjectModel> get copyWith => __$SubjectModelCopyWithImpl<_SubjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameHi, nameHi) || other.nameHi == nameHi)&&(identical(other.hueKey, hueKey) || other.hueKey == hueKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nameEn,nameHi,hueKey);

@override
String toString() {
  return 'SubjectModel(id: $id, nameEn: $nameEn, nameHi: $nameHi, hueKey: $hueKey)';
}


}

/// @nodoc
abstract mixin class _$SubjectModelCopyWith<$Res> implements $SubjectModelCopyWith<$Res> {
  factory _$SubjectModelCopyWith(_SubjectModel value, $Res Function(_SubjectModel) _then) = __$SubjectModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'name_hi') String? nameHi,@JsonKey(name: 'hue_key') String? hueKey
});




}
/// @nodoc
class __$SubjectModelCopyWithImpl<$Res>
    implements _$SubjectModelCopyWith<$Res> {
  __$SubjectModelCopyWithImpl(this._self, this._then);

  final _SubjectModel _self;
  final $Res Function(_SubjectModel) _then;

/// Create a copy of SubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nameEn = freezed,Object? nameHi = freezed,Object? hueKey = freezed,}) {
  return _then(_SubjectModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameHi: freezed == nameHi ? _self.nameHi : nameHi // ignore: cast_nullable_to_non_nullable
as String?,hueKey: freezed == hueKey ? _self.hueKey : hueKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TopicTotalsModel {

 int? get concepts;@JsonKey(name: 'questions_in_run') int? get questionsInRun;@JsonKey(name: 'match_round') int? get matchRound;@JsonKey(name: 'question_batches') List<int>? get questionBatches;@JsonKey(name: 'cards_with_image') int? get cardsWithImage;@JsonKey(name: 'cards_with_audio') int? get cardsWithAudio;
/// Create a copy of TopicTotalsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicTotalsModelCopyWith<TopicTotalsModel> get copyWith => _$TopicTotalsModelCopyWithImpl<TopicTotalsModel>(this as TopicTotalsModel, _$identity);

  /// Serializes this TopicTotalsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicTotalsModel&&(identical(other.concepts, concepts) || other.concepts == concepts)&&(identical(other.questionsInRun, questionsInRun) || other.questionsInRun == questionsInRun)&&(identical(other.matchRound, matchRound) || other.matchRound == matchRound)&&const DeepCollectionEquality().equals(other.questionBatches, questionBatches)&&(identical(other.cardsWithImage, cardsWithImage) || other.cardsWithImage == cardsWithImage)&&(identical(other.cardsWithAudio, cardsWithAudio) || other.cardsWithAudio == cardsWithAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,concepts,questionsInRun,matchRound,const DeepCollectionEquality().hash(questionBatches),cardsWithImage,cardsWithAudio);

@override
String toString() {
  return 'TopicTotalsModel(concepts: $concepts, questionsInRun: $questionsInRun, matchRound: $matchRound, questionBatches: $questionBatches, cardsWithImage: $cardsWithImage, cardsWithAudio: $cardsWithAudio)';
}


}

/// @nodoc
abstract mixin class $TopicTotalsModelCopyWith<$Res>  {
  factory $TopicTotalsModelCopyWith(TopicTotalsModel value, $Res Function(TopicTotalsModel) _then) = _$TopicTotalsModelCopyWithImpl;
@useResult
$Res call({
 int? concepts,@JsonKey(name: 'questions_in_run') int? questionsInRun,@JsonKey(name: 'match_round') int? matchRound,@JsonKey(name: 'question_batches') List<int>? questionBatches,@JsonKey(name: 'cards_with_image') int? cardsWithImage,@JsonKey(name: 'cards_with_audio') int? cardsWithAudio
});




}
/// @nodoc
class _$TopicTotalsModelCopyWithImpl<$Res>
    implements $TopicTotalsModelCopyWith<$Res> {
  _$TopicTotalsModelCopyWithImpl(this._self, this._then);

  final TopicTotalsModel _self;
  final $Res Function(TopicTotalsModel) _then;

/// Create a copy of TopicTotalsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? concepts = freezed,Object? questionsInRun = freezed,Object? matchRound = freezed,Object? questionBatches = freezed,Object? cardsWithImage = freezed,Object? cardsWithAudio = freezed,}) {
  return _then(_self.copyWith(
concepts: freezed == concepts ? _self.concepts : concepts // ignore: cast_nullable_to_non_nullable
as int?,questionsInRun: freezed == questionsInRun ? _self.questionsInRun : questionsInRun // ignore: cast_nullable_to_non_nullable
as int?,matchRound: freezed == matchRound ? _self.matchRound : matchRound // ignore: cast_nullable_to_non_nullable
as int?,questionBatches: freezed == questionBatches ? _self.questionBatches : questionBatches // ignore: cast_nullable_to_non_nullable
as List<int>?,cardsWithImage: freezed == cardsWithImage ? _self.cardsWithImage : cardsWithImage // ignore: cast_nullable_to_non_nullable
as int?,cardsWithAudio: freezed == cardsWithAudio ? _self.cardsWithAudio : cardsWithAudio // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicTotalsModel].
extension TopicTotalsModelPatterns on TopicTotalsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicTotalsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicTotalsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicTotalsModel value)  $default,){
final _that = this;
switch (_that) {
case _TopicTotalsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicTotalsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopicTotalsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? concepts, @JsonKey(name: 'questions_in_run')  int? questionsInRun, @JsonKey(name: 'match_round')  int? matchRound, @JsonKey(name: 'question_batches')  List<int>? questionBatches, @JsonKey(name: 'cards_with_image')  int? cardsWithImage, @JsonKey(name: 'cards_with_audio')  int? cardsWithAudio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicTotalsModel() when $default != null:
return $default(_that.concepts,_that.questionsInRun,_that.matchRound,_that.questionBatches,_that.cardsWithImage,_that.cardsWithAudio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? concepts, @JsonKey(name: 'questions_in_run')  int? questionsInRun, @JsonKey(name: 'match_round')  int? matchRound, @JsonKey(name: 'question_batches')  List<int>? questionBatches, @JsonKey(name: 'cards_with_image')  int? cardsWithImage, @JsonKey(name: 'cards_with_audio')  int? cardsWithAudio)  $default,) {final _that = this;
switch (_that) {
case _TopicTotalsModel():
return $default(_that.concepts,_that.questionsInRun,_that.matchRound,_that.questionBatches,_that.cardsWithImage,_that.cardsWithAudio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? concepts, @JsonKey(name: 'questions_in_run')  int? questionsInRun, @JsonKey(name: 'match_round')  int? matchRound, @JsonKey(name: 'question_batches')  List<int>? questionBatches, @JsonKey(name: 'cards_with_image')  int? cardsWithImage, @JsonKey(name: 'cards_with_audio')  int? cardsWithAudio)?  $default,) {final _that = this;
switch (_that) {
case _TopicTotalsModel() when $default != null:
return $default(_that.concepts,_that.questionsInRun,_that.matchRound,_that.questionBatches,_that.cardsWithImage,_that.cardsWithAudio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicTotalsModel implements TopicTotalsModel {
  const _TopicTotalsModel({this.concepts, @JsonKey(name: 'questions_in_run') this.questionsInRun, @JsonKey(name: 'match_round') this.matchRound, @JsonKey(name: 'question_batches') final  List<int>? questionBatches, @JsonKey(name: 'cards_with_image') this.cardsWithImage, @JsonKey(name: 'cards_with_audio') this.cardsWithAudio}): _questionBatches = questionBatches;
  factory _TopicTotalsModel.fromJson(Map<String, dynamic> json) => _$TopicTotalsModelFromJson(json);

@override final  int? concepts;
@override@JsonKey(name: 'questions_in_run') final  int? questionsInRun;
@override@JsonKey(name: 'match_round') final  int? matchRound;
 final  List<int>? _questionBatches;
@override@JsonKey(name: 'question_batches') List<int>? get questionBatches {
  final value = _questionBatches;
  if (value == null) return null;
  if (_questionBatches is EqualUnmodifiableListView) return _questionBatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'cards_with_image') final  int? cardsWithImage;
@override@JsonKey(name: 'cards_with_audio') final  int? cardsWithAudio;

/// Create a copy of TopicTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicTotalsModelCopyWith<_TopicTotalsModel> get copyWith => __$TopicTotalsModelCopyWithImpl<_TopicTotalsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicTotalsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicTotalsModel&&(identical(other.concepts, concepts) || other.concepts == concepts)&&(identical(other.questionsInRun, questionsInRun) || other.questionsInRun == questionsInRun)&&(identical(other.matchRound, matchRound) || other.matchRound == matchRound)&&const DeepCollectionEquality().equals(other._questionBatches, _questionBatches)&&(identical(other.cardsWithImage, cardsWithImage) || other.cardsWithImage == cardsWithImage)&&(identical(other.cardsWithAudio, cardsWithAudio) || other.cardsWithAudio == cardsWithAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,concepts,questionsInRun,matchRound,const DeepCollectionEquality().hash(_questionBatches),cardsWithImage,cardsWithAudio);

@override
String toString() {
  return 'TopicTotalsModel(concepts: $concepts, questionsInRun: $questionsInRun, matchRound: $matchRound, questionBatches: $questionBatches, cardsWithImage: $cardsWithImage, cardsWithAudio: $cardsWithAudio)';
}


}

/// @nodoc
abstract mixin class _$TopicTotalsModelCopyWith<$Res> implements $TopicTotalsModelCopyWith<$Res> {
  factory _$TopicTotalsModelCopyWith(_TopicTotalsModel value, $Res Function(_TopicTotalsModel) _then) = __$TopicTotalsModelCopyWithImpl;
@override @useResult
$Res call({
 int? concepts,@JsonKey(name: 'questions_in_run') int? questionsInRun,@JsonKey(name: 'match_round') int? matchRound,@JsonKey(name: 'question_batches') List<int>? questionBatches,@JsonKey(name: 'cards_with_image') int? cardsWithImage,@JsonKey(name: 'cards_with_audio') int? cardsWithAudio
});




}
/// @nodoc
class __$TopicTotalsModelCopyWithImpl<$Res>
    implements _$TopicTotalsModelCopyWith<$Res> {
  __$TopicTotalsModelCopyWithImpl(this._self, this._then);

  final _TopicTotalsModel _self;
  final $Res Function(_TopicTotalsModel) _then;

/// Create a copy of TopicTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? concepts = freezed,Object? questionsInRun = freezed,Object? matchRound = freezed,Object? questionBatches = freezed,Object? cardsWithImage = freezed,Object? cardsWithAudio = freezed,}) {
  return _then(_TopicTotalsModel(
concepts: freezed == concepts ? _self.concepts : concepts // ignore: cast_nullable_to_non_nullable
as int?,questionsInRun: freezed == questionsInRun ? _self.questionsInRun : questionsInRun // ignore: cast_nullable_to_non_nullable
as int?,matchRound: freezed == matchRound ? _self.matchRound : matchRound // ignore: cast_nullable_to_non_nullable
as int?,questionBatches: freezed == questionBatches ? _self._questionBatches : questionBatches // ignore: cast_nullable_to_non_nullable
as List<int>?,cardsWithImage: freezed == cardsWithImage ? _self.cardsWithImage : cardsWithImage // ignore: cast_nullable_to_non_nullable
as int?,cardsWithAudio: freezed == cardsWithAudio ? _self.cardsWithAudio : cardsWithAudio // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TopicInfoModel {

@JsonKey(name: 'unit_index') int? get unitIndex; String? get id;@JsonKey(name: 'name_en') String? get nameEn;@JsonKey(name: 'name_hi') String? get nameHi; String? get icon; String? get subtitle; TopicTotalsModel? get totals;
/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicInfoModelCopyWith<TopicInfoModel> get copyWith => _$TopicInfoModelCopyWithImpl<TopicInfoModel>(this as TopicInfoModel, _$identity);

  /// Serializes this TopicInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicInfoModel&&(identical(other.unitIndex, unitIndex) || other.unitIndex == unitIndex)&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameHi, nameHi) || other.nameHi == nameHi)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitIndex,id,nameEn,nameHi,icon,subtitle,totals);

@override
String toString() {
  return 'TopicInfoModel(unitIndex: $unitIndex, id: $id, nameEn: $nameEn, nameHi: $nameHi, icon: $icon, subtitle: $subtitle, totals: $totals)';
}


}

/// @nodoc
abstract mixin class $TopicInfoModelCopyWith<$Res>  {
  factory $TopicInfoModelCopyWith(TopicInfoModel value, $Res Function(TopicInfoModel) _then) = _$TopicInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'unit_index') int? unitIndex, String? id,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'name_hi') String? nameHi, String? icon, String? subtitle, TopicTotalsModel? totals
});


$TopicTotalsModelCopyWith<$Res>? get totals;

}
/// @nodoc
class _$TopicInfoModelCopyWithImpl<$Res>
    implements $TopicInfoModelCopyWith<$Res> {
  _$TopicInfoModelCopyWithImpl(this._self, this._then);

  final TopicInfoModel _self;
  final $Res Function(TopicInfoModel) _then;

/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitIndex = freezed,Object? id = freezed,Object? nameEn = freezed,Object? nameHi = freezed,Object? icon = freezed,Object? subtitle = freezed,Object? totals = freezed,}) {
  return _then(_self.copyWith(
unitIndex: freezed == unitIndex ? _self.unitIndex : unitIndex // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameHi: freezed == nameHi ? _self.nameHi : nameHi // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TopicTotalsModel?,
  ));
}
/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicTotalsModelCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $TopicTotalsModelCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicInfoModel].
extension TopicInfoModelPatterns on TopicInfoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicInfoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _TopicInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopicInfoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'unit_index')  int? unitIndex,  String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi,  String? icon,  String? subtitle,  TopicTotalsModel? totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicInfoModel() when $default != null:
return $default(_that.unitIndex,_that.id,_that.nameEn,_that.nameHi,_that.icon,_that.subtitle,_that.totals);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'unit_index')  int? unitIndex,  String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi,  String? icon,  String? subtitle,  TopicTotalsModel? totals)  $default,) {final _that = this;
switch (_that) {
case _TopicInfoModel():
return $default(_that.unitIndex,_that.id,_that.nameEn,_that.nameHi,_that.icon,_that.subtitle,_that.totals);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'unit_index')  int? unitIndex,  String? id, @JsonKey(name: 'name_en')  String? nameEn, @JsonKey(name: 'name_hi')  String? nameHi,  String? icon,  String? subtitle,  TopicTotalsModel? totals)?  $default,) {final _that = this;
switch (_that) {
case _TopicInfoModel() when $default != null:
return $default(_that.unitIndex,_that.id,_that.nameEn,_that.nameHi,_that.icon,_that.subtitle,_that.totals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicInfoModel implements TopicInfoModel {
  const _TopicInfoModel({@JsonKey(name: 'unit_index') this.unitIndex, this.id, @JsonKey(name: 'name_en') this.nameEn, @JsonKey(name: 'name_hi') this.nameHi, this.icon, this.subtitle, this.totals});
  factory _TopicInfoModel.fromJson(Map<String, dynamic> json) => _$TopicInfoModelFromJson(json);

@override@JsonKey(name: 'unit_index') final  int? unitIndex;
@override final  String? id;
@override@JsonKey(name: 'name_en') final  String? nameEn;
@override@JsonKey(name: 'name_hi') final  String? nameHi;
@override final  String? icon;
@override final  String? subtitle;
@override final  TopicTotalsModel? totals;

/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicInfoModelCopyWith<_TopicInfoModel> get copyWith => __$TopicInfoModelCopyWithImpl<_TopicInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicInfoModel&&(identical(other.unitIndex, unitIndex) || other.unitIndex == unitIndex)&&(identical(other.id, id) || other.id == id)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameHi, nameHi) || other.nameHi == nameHi)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitIndex,id,nameEn,nameHi,icon,subtitle,totals);

@override
String toString() {
  return 'TopicInfoModel(unitIndex: $unitIndex, id: $id, nameEn: $nameEn, nameHi: $nameHi, icon: $icon, subtitle: $subtitle, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$TopicInfoModelCopyWith<$Res> implements $TopicInfoModelCopyWith<$Res> {
  factory _$TopicInfoModelCopyWith(_TopicInfoModel value, $Res Function(_TopicInfoModel) _then) = __$TopicInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'unit_index') int? unitIndex, String? id,@JsonKey(name: 'name_en') String? nameEn,@JsonKey(name: 'name_hi') String? nameHi, String? icon, String? subtitle, TopicTotalsModel? totals
});


@override $TopicTotalsModelCopyWith<$Res>? get totals;

}
/// @nodoc
class __$TopicInfoModelCopyWithImpl<$Res>
    implements _$TopicInfoModelCopyWith<$Res> {
  __$TopicInfoModelCopyWithImpl(this._self, this._then);

  final _TopicInfoModel _self;
  final $Res Function(_TopicInfoModel) _then;

/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitIndex = freezed,Object? id = freezed,Object? nameEn = freezed,Object? nameHi = freezed,Object? icon = freezed,Object? subtitle = freezed,Object? totals = freezed,}) {
  return _then(_TopicInfoModel(
unitIndex: freezed == unitIndex ? _self.unitIndex : unitIndex // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameHi: freezed == nameHi ? _self.nameHi : nameHi // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TopicTotalsModel?,
  ));
}

/// Create a copy of TopicInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicTotalsModelCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $TopicTotalsModelCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$ConceptQuestionModel {

 String? get type; LocalizedTextModel? get prompt; dynamic get answer; Map<String, List<String>?>? get options;
/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConceptQuestionModelCopyWith<ConceptQuestionModel> get copyWith => _$ConceptQuestionModelCopyWithImpl<ConceptQuestionModel>(this as ConceptQuestionModel, _$identity);

  /// Serializes this ConceptQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConceptQuestionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.answer, answer)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,prompt,const DeepCollectionEquality().hash(answer),const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ConceptQuestionModel(type: $type, prompt: $prompt, answer: $answer, options: $options)';
}


}

/// @nodoc
abstract mixin class $ConceptQuestionModelCopyWith<$Res>  {
  factory $ConceptQuestionModelCopyWith(ConceptQuestionModel value, $Res Function(ConceptQuestionModel) _then) = _$ConceptQuestionModelCopyWithImpl;
@useResult
$Res call({
 String? type, LocalizedTextModel? prompt, dynamic answer, Map<String, List<String>?>? options
});


$LocalizedTextModelCopyWith<$Res>? get prompt;

}
/// @nodoc
class _$ConceptQuestionModelCopyWithImpl<$Res>
    implements $ConceptQuestionModelCopyWith<$Res> {
  _$ConceptQuestionModelCopyWithImpl(this._self, this._then);

  final ConceptQuestionModel _self;
  final $Res Function(ConceptQuestionModel) _then;

/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? prompt = freezed,Object? answer = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as dynamic,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>?>?,
  ));
}
/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get prompt {
    if (_self.prompt == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.prompt!, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConceptQuestionModel].
extension ConceptQuestionModelPatterns on ConceptQuestionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConceptQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConceptQuestionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConceptQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _ConceptQuestionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConceptQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConceptQuestionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  LocalizedTextModel? prompt,  dynamic answer,  Map<String, List<String>?>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConceptQuestionModel() when $default != null:
return $default(_that.type,_that.prompt,_that.answer,_that.options);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  LocalizedTextModel? prompt,  dynamic answer,  Map<String, List<String>?>? options)  $default,) {final _that = this;
switch (_that) {
case _ConceptQuestionModel():
return $default(_that.type,_that.prompt,_that.answer,_that.options);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  LocalizedTextModel? prompt,  dynamic answer,  Map<String, List<String>?>? options)?  $default,) {final _that = this;
switch (_that) {
case _ConceptQuestionModel() when $default != null:
return $default(_that.type,_that.prompt,_that.answer,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConceptQuestionModel implements ConceptQuestionModel {
  const _ConceptQuestionModel({this.type, this.prompt, this.answer, final  Map<String, List<String>?>? options}): _options = options;
  factory _ConceptQuestionModel.fromJson(Map<String, dynamic> json) => _$ConceptQuestionModelFromJson(json);

@override final  String? type;
@override final  LocalizedTextModel? prompt;
@override final  dynamic answer;
 final  Map<String, List<String>?>? _options;
@override Map<String, List<String>?>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConceptQuestionModelCopyWith<_ConceptQuestionModel> get copyWith => __$ConceptQuestionModelCopyWithImpl<_ConceptQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConceptQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConceptQuestionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.answer, answer)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,prompt,const DeepCollectionEquality().hash(answer),const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ConceptQuestionModel(type: $type, prompt: $prompt, answer: $answer, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ConceptQuestionModelCopyWith<$Res> implements $ConceptQuestionModelCopyWith<$Res> {
  factory _$ConceptQuestionModelCopyWith(_ConceptQuestionModel value, $Res Function(_ConceptQuestionModel) _then) = __$ConceptQuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String? type, LocalizedTextModel? prompt, dynamic answer, Map<String, List<String>?>? options
});


@override $LocalizedTextModelCopyWith<$Res>? get prompt;

}
/// @nodoc
class __$ConceptQuestionModelCopyWithImpl<$Res>
    implements _$ConceptQuestionModelCopyWith<$Res> {
  __$ConceptQuestionModelCopyWithImpl(this._self, this._then);

  final _ConceptQuestionModel _self;
  final $Res Function(_ConceptQuestionModel) _then;

/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? prompt = freezed,Object? answer = freezed,Object? options = freezed,}) {
  return _then(_ConceptQuestionModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as dynamic,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>?>?,
  ));
}

/// Create a copy of ConceptQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get prompt {
    if (_self.prompt == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.prompt!, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}
}


/// @nodoc
mixin _$ConceptItemModel {

 int? get no; String? get id; LocalizedTextModel? get title; LocalizedTextModel? get fact; ConceptQuestionModel? get question; LocalizedTextModel? get image; LocalizedTextModel? get audio;
/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConceptItemModelCopyWith<ConceptItemModel> get copyWith => _$ConceptItemModelCopyWithImpl<ConceptItemModel>(this as ConceptItemModel, _$identity);

  /// Serializes this ConceptItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConceptItemModel&&(identical(other.no, no) || other.no == no)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fact, fact) || other.fact == fact)&&(identical(other.question, question) || other.question == question)&&(identical(other.image, image) || other.image == image)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,id,title,fact,question,image,audio);

@override
String toString() {
  return 'ConceptItemModel(no: $no, id: $id, title: $title, fact: $fact, question: $question, image: $image, audio: $audio)';
}


}

/// @nodoc
abstract mixin class $ConceptItemModelCopyWith<$Res>  {
  factory $ConceptItemModelCopyWith(ConceptItemModel value, $Res Function(ConceptItemModel) _then) = _$ConceptItemModelCopyWithImpl;
@useResult
$Res call({
 int? no, String? id, LocalizedTextModel? title, LocalizedTextModel? fact, ConceptQuestionModel? question, LocalizedTextModel? image, LocalizedTextModel? audio
});


$LocalizedTextModelCopyWith<$Res>? get title;$LocalizedTextModelCopyWith<$Res>? get fact;$ConceptQuestionModelCopyWith<$Res>? get question;$LocalizedTextModelCopyWith<$Res>? get image;$LocalizedTextModelCopyWith<$Res>? get audio;

}
/// @nodoc
class _$ConceptItemModelCopyWithImpl<$Res>
    implements $ConceptItemModelCopyWith<$Res> {
  _$ConceptItemModelCopyWithImpl(this._self, this._then);

  final ConceptItemModel _self;
  final $Res Function(ConceptItemModel) _then;

/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? no = freezed,Object? id = freezed,Object? title = freezed,Object? fact = freezed,Object? question = freezed,Object? image = freezed,Object? audio = freezed,}) {
  return _then(_self.copyWith(
no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,fact: freezed == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as ConceptQuestionModel?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,
  ));
}
/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get fact {
    if (_self.fact == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.fact!, (value) {
    return _then(_self.copyWith(fact: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConceptQuestionModelCopyWith<$Res>? get question {
    if (_self.question == null) {
    return null;
  }

  return $ConceptQuestionModelCopyWith<$Res>(_self.question!, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get audio {
    if (_self.audio == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.audio!, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConceptItemModel].
extension ConceptItemModelPatterns on ConceptItemModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConceptItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConceptItemModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConceptItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ConceptItemModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConceptItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConceptItemModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? no,  String? id,  LocalizedTextModel? title,  LocalizedTextModel? fact,  ConceptQuestionModel? question,  LocalizedTextModel? image,  LocalizedTextModel? audio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConceptItemModel() when $default != null:
return $default(_that.no,_that.id,_that.title,_that.fact,_that.question,_that.image,_that.audio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? no,  String? id,  LocalizedTextModel? title,  LocalizedTextModel? fact,  ConceptQuestionModel? question,  LocalizedTextModel? image,  LocalizedTextModel? audio)  $default,) {final _that = this;
switch (_that) {
case _ConceptItemModel():
return $default(_that.no,_that.id,_that.title,_that.fact,_that.question,_that.image,_that.audio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? no,  String? id,  LocalizedTextModel? title,  LocalizedTextModel? fact,  ConceptQuestionModel? question,  LocalizedTextModel? image,  LocalizedTextModel? audio)?  $default,) {final _that = this;
switch (_that) {
case _ConceptItemModel() when $default != null:
return $default(_that.no,_that.id,_that.title,_that.fact,_that.question,_that.image,_that.audio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConceptItemModel implements ConceptItemModel {
  const _ConceptItemModel({this.no, this.id, this.title, this.fact, this.question, this.image, this.audio});
  factory _ConceptItemModel.fromJson(Map<String, dynamic> json) => _$ConceptItemModelFromJson(json);

@override final  int? no;
@override final  String? id;
@override final  LocalizedTextModel? title;
@override final  LocalizedTextModel? fact;
@override final  ConceptQuestionModel? question;
@override final  LocalizedTextModel? image;
@override final  LocalizedTextModel? audio;

/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConceptItemModelCopyWith<_ConceptItemModel> get copyWith => __$ConceptItemModelCopyWithImpl<_ConceptItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConceptItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConceptItemModel&&(identical(other.no, no) || other.no == no)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fact, fact) || other.fact == fact)&&(identical(other.question, question) || other.question == question)&&(identical(other.image, image) || other.image == image)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,no,id,title,fact,question,image,audio);

@override
String toString() {
  return 'ConceptItemModel(no: $no, id: $id, title: $title, fact: $fact, question: $question, image: $image, audio: $audio)';
}


}

/// @nodoc
abstract mixin class _$ConceptItemModelCopyWith<$Res> implements $ConceptItemModelCopyWith<$Res> {
  factory _$ConceptItemModelCopyWith(_ConceptItemModel value, $Res Function(_ConceptItemModel) _then) = __$ConceptItemModelCopyWithImpl;
@override @useResult
$Res call({
 int? no, String? id, LocalizedTextModel? title, LocalizedTextModel? fact, ConceptQuestionModel? question, LocalizedTextModel? image, LocalizedTextModel? audio
});


@override $LocalizedTextModelCopyWith<$Res>? get title;@override $LocalizedTextModelCopyWith<$Res>? get fact;@override $ConceptQuestionModelCopyWith<$Res>? get question;@override $LocalizedTextModelCopyWith<$Res>? get image;@override $LocalizedTextModelCopyWith<$Res>? get audio;

}
/// @nodoc
class __$ConceptItemModelCopyWithImpl<$Res>
    implements _$ConceptItemModelCopyWith<$Res> {
  __$ConceptItemModelCopyWithImpl(this._self, this._then);

  final _ConceptItemModel _self;
  final $Res Function(_ConceptItemModel) _then;

/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? no = freezed,Object? id = freezed,Object? title = freezed,Object? fact = freezed,Object? question = freezed,Object? image = freezed,Object? audio = freezed,}) {
  return _then(_ConceptItemModel(
no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,fact: freezed == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as ConceptQuestionModel?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as LocalizedTextModel?,
  ));
}

/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get fact {
    if (_self.fact == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.fact!, (value) {
    return _then(_self.copyWith(fact: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConceptQuestionModelCopyWith<$Res>? get question {
    if (_self.question == null) {
    return null;
  }

  return $ConceptQuestionModelCopyWith<$Res>(_self.question!, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of ConceptItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextModelCopyWith<$Res>? get audio {
    if (_self.audio == null) {
    return null;
  }

  return $LocalizedTextModelCopyWith<$Res>(_self.audio!, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// @nodoc
mixin _$TopicDetailResponseModel {

 String? get schema; SubjectModel? get subject; TopicInfoModel? get topic; List<ConceptItemModel>? get concepts;
/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDetailResponseModelCopyWith<TopicDetailResponseModel> get copyWith => _$TopicDetailResponseModelCopyWithImpl<TopicDetailResponseModel>(this as TopicDetailResponseModel, _$identity);

  /// Serializes this TopicDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetailResponseModel&&(identical(other.schema, schema) || other.schema == schema)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other.concepts, concepts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schema,subject,topic,const DeepCollectionEquality().hash(concepts));

@override
String toString() {
  return 'TopicDetailResponseModel(schema: $schema, subject: $subject, topic: $topic, concepts: $concepts)';
}


}

/// @nodoc
abstract mixin class $TopicDetailResponseModelCopyWith<$Res>  {
  factory $TopicDetailResponseModelCopyWith(TopicDetailResponseModel value, $Res Function(TopicDetailResponseModel) _then) = _$TopicDetailResponseModelCopyWithImpl;
@useResult
$Res call({
 String? schema, SubjectModel? subject, TopicInfoModel? topic, List<ConceptItemModel>? concepts
});


$SubjectModelCopyWith<$Res>? get subject;$TopicInfoModelCopyWith<$Res>? get topic;

}
/// @nodoc
class _$TopicDetailResponseModelCopyWithImpl<$Res>
    implements $TopicDetailResponseModelCopyWith<$Res> {
  _$TopicDetailResponseModelCopyWithImpl(this._self, this._then);

  final TopicDetailResponseModel _self;
  final $Res Function(TopicDetailResponseModel) _then;

/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schema = freezed,Object? subject = freezed,Object? topic = freezed,Object? concepts = freezed,}) {
  return _then(_self.copyWith(
schema: freezed == schema ? _self.schema : schema // ignore: cast_nullable_to_non_nullable
as String?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as SubjectModel?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as TopicInfoModel?,concepts: freezed == concepts ? _self.concepts : concepts // ignore: cast_nullable_to_non_nullable
as List<ConceptItemModel>?,
  ));
}
/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectModelCopyWith<$Res>? get subject {
    if (_self.subject == null) {
    return null;
  }

  return $SubjectModelCopyWith<$Res>(_self.subject!, (value) {
    return _then(_self.copyWith(subject: value));
  });
}/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicInfoModelCopyWith<$Res>? get topic {
    if (_self.topic == null) {
    return null;
  }

  return $TopicInfoModelCopyWith<$Res>(_self.topic!, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicDetailResponseModel].
extension TopicDetailResponseModelPatterns on TopicDetailResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDetailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDetailResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDetailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TopicDetailResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDetailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDetailResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? schema,  SubjectModel? subject,  TopicInfoModel? topic,  List<ConceptItemModel>? concepts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetailResponseModel() when $default != null:
return $default(_that.schema,_that.subject,_that.topic,_that.concepts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? schema,  SubjectModel? subject,  TopicInfoModel? topic,  List<ConceptItemModel>? concepts)  $default,) {final _that = this;
switch (_that) {
case _TopicDetailResponseModel():
return $default(_that.schema,_that.subject,_that.topic,_that.concepts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? schema,  SubjectModel? subject,  TopicInfoModel? topic,  List<ConceptItemModel>? concepts)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetailResponseModel() when $default != null:
return $default(_that.schema,_that.subject,_that.topic,_that.concepts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicDetailResponseModel implements TopicDetailResponseModel {
  const _TopicDetailResponseModel({this.schema, this.subject, this.topic, final  List<ConceptItemModel>? concepts}): _concepts = concepts;
  factory _TopicDetailResponseModel.fromJson(Map<String, dynamic> json) => _$TopicDetailResponseModelFromJson(json);

@override final  String? schema;
@override final  SubjectModel? subject;
@override final  TopicInfoModel? topic;
 final  List<ConceptItemModel>? _concepts;
@override List<ConceptItemModel>? get concepts {
  final value = _concepts;
  if (value == null) return null;
  if (_concepts is EqualUnmodifiableListView) return _concepts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDetailResponseModelCopyWith<_TopicDetailResponseModel> get copyWith => __$TopicDetailResponseModelCopyWithImpl<_TopicDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetailResponseModel&&(identical(other.schema, schema) || other.schema == schema)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other._concepts, _concepts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schema,subject,topic,const DeepCollectionEquality().hash(_concepts));

@override
String toString() {
  return 'TopicDetailResponseModel(schema: $schema, subject: $subject, topic: $topic, concepts: $concepts)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailResponseModelCopyWith<$Res> implements $TopicDetailResponseModelCopyWith<$Res> {
  factory _$TopicDetailResponseModelCopyWith(_TopicDetailResponseModel value, $Res Function(_TopicDetailResponseModel) _then) = __$TopicDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? schema, SubjectModel? subject, TopicInfoModel? topic, List<ConceptItemModel>? concepts
});


@override $SubjectModelCopyWith<$Res>? get subject;@override $TopicInfoModelCopyWith<$Res>? get topic;

}
/// @nodoc
class __$TopicDetailResponseModelCopyWithImpl<$Res>
    implements _$TopicDetailResponseModelCopyWith<$Res> {
  __$TopicDetailResponseModelCopyWithImpl(this._self, this._then);

  final _TopicDetailResponseModel _self;
  final $Res Function(_TopicDetailResponseModel) _then;

/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schema = freezed,Object? subject = freezed,Object? topic = freezed,Object? concepts = freezed,}) {
  return _then(_TopicDetailResponseModel(
schema: freezed == schema ? _self.schema : schema // ignore: cast_nullable_to_non_nullable
as String?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as SubjectModel?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as TopicInfoModel?,concepts: freezed == concepts ? _self._concepts : concepts // ignore: cast_nullable_to_non_nullable
as List<ConceptItemModel>?,
  ));
}

/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectModelCopyWith<$Res>? get subject {
    if (_self.subject == null) {
    return null;
  }

  return $SubjectModelCopyWith<$Res>(_self.subject!, (value) {
    return _then(_self.copyWith(subject: value));
  });
}/// Create a copy of TopicDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicInfoModelCopyWith<$Res>? get topic {
    if (_self.topic == null) {
    return null;
  }

  return $TopicInfoModelCopyWith<$Res>(_self.topic!, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}

// dart format on
