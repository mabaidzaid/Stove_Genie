// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(fromJson: _stringFromAny)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get email => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get number => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get city => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get licenseId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get service => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get image => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromAny)
  bool get notifications => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get pushToken => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get state => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromAny)
  bool get online => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get experience => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny)
  int get orderCompleted => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromAny)
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromAny)
  List<String> get skills => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny)
  int get followers => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny)
  int get following => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny)
  int get uploadedRecipesCount => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _stringFromAny) String id,
      @JsonKey(fromJson: _stringFromAny) String name,
      @JsonKey(fromJson: _stringFromAny) String email,
      @JsonKey(fromJson: _stringFromAny) String number,
      @JsonKey(fromJson: _stringFromAny) String city,
      @JsonKey(fromJson: _stringFromAny) String licenseId,
      @JsonKey(fromJson: _stringFromAny) String service,
      @JsonKey(fromJson: _stringFromAny) String image,
      @JsonKey(fromJson: _boolFromAny) bool notifications,
      @JsonKey(fromJson: _stringFromAny) String pushToken,
      @JsonKey(fromJson: _stringFromAny) String state,
      @JsonKey(fromJson: _boolFromAny) bool online,
      @JsonKey(fromJson: _stringFromAny) String createdAt,
      @JsonKey(fromJson: _doubleFromAny) double price,
      @JsonKey(fromJson: _doubleFromAny) double experience,
      @JsonKey(fromJson: _intFromAny) int orderCompleted,
      @JsonKey(fromJson: _stringFromAny) String bio,
      @JsonKey(fromJson: _doubleFromAny) double rating,
      @JsonKey(fromJson: _stringListFromAny) List<String> skills,
      @JsonKey(fromJson: _intFromAny) int followers,
      @JsonKey(fromJson: _intFromAny) int following,
      @JsonKey(fromJson: _intFromAny) int uploadedRecipesCount});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? number = null,
    Object? city = null,
    Object? licenseId = null,
    Object? service = null,
    Object? image = null,
    Object? notifications = null,
    Object? pushToken = null,
    Object? state = null,
    Object? online = null,
    Object? createdAt = null,
    Object? price = null,
    Object? experience = null,
    Object? orderCompleted = null,
    Object? bio = null,
    Object? rating = null,
    Object? skills = null,
    Object? followers = null,
    Object? following = null,
    Object? uploadedRecipesCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      orderCompleted: null == orderCompleted
          ? _value.orderCompleted
          : orderCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedRecipesCount: null == uploadedRecipesCount
          ? _value.uploadedRecipesCount
          : uploadedRecipesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _stringFromAny) String id,
      @JsonKey(fromJson: _stringFromAny) String name,
      @JsonKey(fromJson: _stringFromAny) String email,
      @JsonKey(fromJson: _stringFromAny) String number,
      @JsonKey(fromJson: _stringFromAny) String city,
      @JsonKey(fromJson: _stringFromAny) String licenseId,
      @JsonKey(fromJson: _stringFromAny) String service,
      @JsonKey(fromJson: _stringFromAny) String image,
      @JsonKey(fromJson: _boolFromAny) bool notifications,
      @JsonKey(fromJson: _stringFromAny) String pushToken,
      @JsonKey(fromJson: _stringFromAny) String state,
      @JsonKey(fromJson: _boolFromAny) bool online,
      @JsonKey(fromJson: _stringFromAny) String createdAt,
      @JsonKey(fromJson: _doubleFromAny) double price,
      @JsonKey(fromJson: _doubleFromAny) double experience,
      @JsonKey(fromJson: _intFromAny) int orderCompleted,
      @JsonKey(fromJson: _stringFromAny) String bio,
      @JsonKey(fromJson: _doubleFromAny) double rating,
      @JsonKey(fromJson: _stringListFromAny) List<String> skills,
      @JsonKey(fromJson: _intFromAny) int followers,
      @JsonKey(fromJson: _intFromAny) int following,
      @JsonKey(fromJson: _intFromAny) int uploadedRecipesCount});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? number = null,
    Object? city = null,
    Object? licenseId = null,
    Object? service = null,
    Object? image = null,
    Object? notifications = null,
    Object? pushToken = null,
    Object? state = null,
    Object? online = null,
    Object? createdAt = null,
    Object? price = null,
    Object? experience = null,
    Object? orderCompleted = null,
    Object? bio = null,
    Object? rating = null,
    Object? skills = null,
    Object? followers = null,
    Object? following = null,
    Object? uploadedRecipesCount = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      orderCompleted: null == orderCompleted
          ? _value.orderCompleted
          : orderCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedRecipesCount: null == uploadedRecipesCount
          ? _value.uploadedRecipesCount
          : uploadedRecipesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(fromJson: _stringFromAny) this.id = "",
      @JsonKey(fromJson: _stringFromAny) this.name = "",
      @JsonKey(fromJson: _stringFromAny) this.email = "",
      @JsonKey(fromJson: _stringFromAny) this.number = "",
      @JsonKey(fromJson: _stringFromAny) this.city = "",
      @JsonKey(fromJson: _stringFromAny) this.licenseId = "",
      @JsonKey(fromJson: _stringFromAny) this.service = "",
      @JsonKey(fromJson: _stringFromAny) this.image = "",
      @JsonKey(fromJson: _boolFromAny) this.notifications = false,
      @JsonKey(fromJson: _stringFromAny) this.pushToken = "",
      @JsonKey(fromJson: _stringFromAny) this.state = "",
      @JsonKey(fromJson: _boolFromAny) this.online = false,
      @JsonKey(fromJson: _stringFromAny) this.createdAt = "",
      @JsonKey(fromJson: _doubleFromAny) this.price = 0.0,
      @JsonKey(fromJson: _doubleFromAny) this.experience = 0.0,
      @JsonKey(fromJson: _intFromAny) this.orderCompleted = 0,
      @JsonKey(fromJson: _stringFromAny) this.bio = "",
      @JsonKey(fromJson: _doubleFromAny) this.rating = 0.0,
      @JsonKey(fromJson: _stringListFromAny)
      final List<String> skills = const <String>[],
      @JsonKey(fromJson: _intFromAny) this.followers = 0,
      @JsonKey(fromJson: _intFromAny) this.following = 0,
      @JsonKey(fromJson: _intFromAny) this.uploadedRecipesCount = 0})
      : _skills = skills;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringFromAny)
  final String id;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String name;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String email;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String number;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String city;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String licenseId;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String service;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String image;
  @override
  @JsonKey(fromJson: _boolFromAny)
  final bool notifications;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String pushToken;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String state;
  @override
  @JsonKey(fromJson: _boolFromAny)
  final bool online;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String createdAt;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double price;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double experience;
  @override
  @JsonKey(fromJson: _intFromAny)
  final int orderCompleted;
  @override
  @JsonKey(fromJson: _stringFromAny)
  final String bio;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double rating;
  final List<String> _skills;
  @override
  @JsonKey(fromJson: _stringListFromAny)
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey(fromJson: _intFromAny)
  final int followers;
  @override
  @JsonKey(fromJson: _intFromAny)
  final int following;
  @override
  @JsonKey(fromJson: _intFromAny)
  final int uploadedRecipesCount;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, number: $number, city: $city, licenseId: $licenseId, service: $service, image: $image, notifications: $notifications, pushToken: $pushToken, state: $state, online: $online, createdAt: $createdAt, price: $price, experience: $experience, orderCompleted: $orderCompleted, bio: $bio, rating: $rating, skills: $skills, followers: $followers, following: $following, uploadedRecipesCount: $uploadedRecipesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.orderCompleted, orderCompleted) ||
                other.orderCompleted == orderCompleted) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.uploadedRecipesCount, uploadedRecipesCount) ||
                other.uploadedRecipesCount == uploadedRecipesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        number,
        city,
        licenseId,
        service,
        image,
        notifications,
        pushToken,
        state,
        online,
        createdAt,
        price,
        experience,
        orderCompleted,
        bio,
        rating,
        const DeepCollectionEquality().hash(_skills),
        followers,
        following,
        uploadedRecipesCount
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@JsonKey(fromJson: _stringFromAny) final String id,
          @JsonKey(fromJson: _stringFromAny) final String name,
          @JsonKey(fromJson: _stringFromAny) final String email,
          @JsonKey(fromJson: _stringFromAny) final String number,
          @JsonKey(fromJson: _stringFromAny) final String city,
          @JsonKey(fromJson: _stringFromAny) final String licenseId,
          @JsonKey(fromJson: _stringFromAny) final String service,
          @JsonKey(fromJson: _stringFromAny) final String image,
          @JsonKey(fromJson: _boolFromAny) final bool notifications,
          @JsonKey(fromJson: _stringFromAny) final String pushToken,
          @JsonKey(fromJson: _stringFromAny) final String state,
          @JsonKey(fromJson: _boolFromAny) final bool online,
          @JsonKey(fromJson: _stringFromAny) final String createdAt,
          @JsonKey(fromJson: _doubleFromAny) final double price,
          @JsonKey(fromJson: _doubleFromAny) final double experience,
          @JsonKey(fromJson: _intFromAny) final int orderCompleted,
          @JsonKey(fromJson: _stringFromAny) final String bio,
          @JsonKey(fromJson: _doubleFromAny) final double rating,
          @JsonKey(fromJson: _stringListFromAny) final List<String> skills,
          @JsonKey(fromJson: _intFromAny) final int followers,
          @JsonKey(fromJson: _intFromAny) final int following,
          @JsonKey(fromJson: _intFromAny) final int uploadedRecipesCount}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringFromAny)
  String get id;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get name;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get email;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get number;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get city;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get licenseId;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get service;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get image;
  @override
  @JsonKey(fromJson: _boolFromAny)
  bool get notifications;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get pushToken;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get state;
  @override
  @JsonKey(fromJson: _boolFromAny)
  bool get online;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get createdAt;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get price;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get experience;
  @override
  @JsonKey(fromJson: _intFromAny)
  int get orderCompleted;
  @override
  @JsonKey(fromJson: _stringFromAny)
  String get bio;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get rating;
  @override
  @JsonKey(fromJson: _stringListFromAny)
  List<String> get skills;
  @override
  @JsonKey(fromJson: _intFromAny)
  int get followers;
  @override
  @JsonKey(fromJson: _intFromAny)
  int get following;
  @override
  @JsonKey(fromJson: _intFromAny)
  int get uploadedRecipesCount;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
