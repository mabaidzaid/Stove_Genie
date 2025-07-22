// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) {
  return _RecipeModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get calories => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get reviews => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeModelCopyWith<RecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeModelCopyWith<$Res> {
  factory $RecipeModelCopyWith(
          RecipeModel value, $Res Function(RecipeModel) then) =
      _$RecipeModelCopyWithImpl<$Res, RecipeModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String image,
      String time,
      String calories,
      double rating,
      String backgroundColor,
      String description,
      String category,
      List<Map<String, dynamic>> reviews,
      List<String> steps,
      List<String> ingredients});
}

/// @nodoc
class _$RecipeModelCopyWithImpl<$Res, $Val extends RecipeModel>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? image = null,
    Object? time = null,
    Object? calories = null,
    Object? rating = null,
    Object? backgroundColor = null,
    Object? description = null,
    Object? category = null,
    Object? reviews = null,
    Object? steps = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeModelImplCopyWith<$Res>
    implements $RecipeModelCopyWith<$Res> {
  factory _$$RecipeModelImplCopyWith(
          _$RecipeModelImpl value, $Res Function(_$RecipeModelImpl) then) =
      __$$RecipeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String image,
      String time,
      String calories,
      double rating,
      String backgroundColor,
      String description,
      String category,
      List<Map<String, dynamic>> reviews,
      List<String> steps,
      List<String> ingredients});
}

/// @nodoc
class __$$RecipeModelImplCopyWithImpl<$Res>
    extends _$RecipeModelCopyWithImpl<$Res, _$RecipeModelImpl>
    implements _$$RecipeModelImplCopyWith<$Res> {
  __$$RecipeModelImplCopyWithImpl(
      _$RecipeModelImpl _value, $Res Function(_$RecipeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? image = null,
    Object? time = null,
    Object? calories = null,
    Object? rating = null,
    Object? backgroundColor = null,
    Object? description = null,
    Object? category = null,
    Object? reviews = null,
    Object? steps = null,
    Object? ingredients = null,
  }) {
    return _then(_$RecipeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeModelImpl implements _RecipeModel {
  _$RecipeModelImpl(
      {this.id = "",
      this.userId = "",
      this.title = "",
      this.image = "",
      this.time = "",
      this.calories = "",
      this.rating = 0.0,
      this.backgroundColor = "",
      this.description = "",
      this.category = "",
      final List<Map<String, dynamic>> reviews = const [],
      final List<String> steps = const [],
      final List<String> ingredients = const []})
      : _reviews = reviews,
        _steps = steps,
        _ingredients = ingredients;

  factory _$RecipeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final String calories;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String backgroundColor;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String category;
  final List<Map<String, dynamic>> _reviews;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<String> _steps;
  @override
  @JsonKey()
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  final List<String> _ingredients;
  @override
  @JsonKey()
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'RecipeModel(id: $id, userId: $userId, title: $title, image: $image, time: $time, calories: $calories, rating: $rating, backgroundColor: $backgroundColor, description: $description, category: $category, reviews: $reviews, steps: $steps, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      image,
      time,
      calories,
      rating,
      backgroundColor,
      description,
      category,
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_ingredients));

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      __$$RecipeModelImplCopyWithImpl<_$RecipeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeModel implements RecipeModel {
  factory _RecipeModel(
      {final String id,
      final String userId,
      final String title,
      final String image,
      final String time,
      final String calories,
      final double rating,
      final String backgroundColor,
      final String description,
      final String category,
      final List<Map<String, dynamic>> reviews,
      final List<String> steps,
      final List<String> ingredients}) = _$RecipeModelImpl;

  factory _RecipeModel.fromJson(Map<String, dynamic> json) =
      _$RecipeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get image;
  @override
  String get time;
  @override
  String get calories;
  @override
  double get rating;
  @override
  String get backgroundColor;
  @override
  String get description;
  @override
  String get category;
  @override
  List<Map<String, dynamic>> get reviews;
  @override
  List<String> get steps;
  @override
  List<String> get ingredients;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
