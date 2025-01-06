// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingStateCopyWith<$Res> {
  factory $ListingStateCopyWith(
          ListingState value, $Res Function(ListingState) then) =
      _$ListingStateCopyWithImpl<$Res, ListingState>;
}

/// @nodoc
class _$ListingStateCopyWithImpl<$Res, $Val extends ListingState>
    implements $ListingStateCopyWith<$Res> {
  _$ListingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$ListingStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'ListingState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ListingState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ListingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ListingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ListingState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ListingModel>? listings,
      List<ListingModel>? offerList,
      List<ListingModel>? rentList,
      List<ListingModel>? saleList,
      List<ListingModel>? hotDealsList});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ListingStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = freezed,
    Object? offerList = freezed,
    Object? rentList = freezed,
    Object? saleList = freezed,
    Object? hotDealsList = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
      freezed == offerList
          ? _value._offerList
          : offerList // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
      freezed == rentList
          ? _value._rentList
          : rentList // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
      freezed == saleList
          ? _value._saleList
          : saleList // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
      freezed == hotDealsList
          ? _value._hotDealsList
          : hotDealsList // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      final List<ListingModel>? listings,
      final List<ListingModel>? offerList,
      final List<ListingModel>? rentList,
      final List<ListingModel>? saleList,
      final List<ListingModel>? hotDealsList)
      : _listings = listings,
        _offerList = offerList,
        _rentList = rentList,
        _saleList = saleList,
        _hotDealsList = hotDealsList;

  final List<ListingModel>? _listings;
  @override
  List<ListingModel>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ListingModel>? _offerList;
  @override
  List<ListingModel>? get offerList {
    final value = _offerList;
    if (value == null) return null;
    if (_offerList is EqualUnmodifiableListView) return _offerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ListingModel>? _rentList;
  @override
  List<ListingModel>? get rentList {
    final value = _rentList;
    if (value == null) return null;
    if (_rentList is EqualUnmodifiableListView) return _rentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ListingModel>? _saleList;
  @override
  List<ListingModel>? get saleList {
    final value = _saleList;
    if (value == null) return null;
    if (_saleList is EqualUnmodifiableListView) return _saleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ListingModel>? _hotDealsList;
  @override
  List<ListingModel>? get hotDealsList {
    final value = _hotDealsList;
    if (value == null) return null;
    if (_hotDealsList is EqualUnmodifiableListView) return _hotDealsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListingState.success(listings: $listings, offerList: $offerList, rentList: $rentList, saleList: $saleList, hotDealsList: $hotDealsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            const DeepCollectionEquality()
                .equals(other._offerList, _offerList) &&
            const DeepCollectionEquality().equals(other._rentList, _rentList) &&
            const DeepCollectionEquality().equals(other._saleList, _saleList) &&
            const DeepCollectionEquality()
                .equals(other._hotDealsList, _hotDealsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listings),
      const DeepCollectionEquality().hash(_offerList),
      const DeepCollectionEquality().hash(_rentList),
      const DeepCollectionEquality().hash(_saleList),
      const DeepCollectionEquality().hash(_hotDealsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) {
    return success(listings, offerList, rentList, saleList, hotDealsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) {
    return success?.call(listings, offerList, rentList, saleList, hotDealsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(listings, offerList, rentList, saleList, hotDealsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ListingState {
  const factory _Success(
      final List<ListingModel>? listings,
      final List<ListingModel>? offerList,
      final List<ListingModel>? rentList,
      final List<ListingModel>? saleList,
      final List<ListingModel>? hotDealsList) = _$SuccessImpl;

  List<ListingModel>? get listings;
  List<ListingModel>? get offerList;
  List<ListingModel>? get rentList;
  List<ListingModel>? get saleList;
  List<ListingModel>? get hotDealsList;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserListingsImplCopyWith<$Res> {
  factory _$$UserListingsImplCopyWith(
          _$UserListingsImpl value, $Res Function(_$UserListingsImpl) then) =
      __$$UserListingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ListingModel>? listings});
}

/// @nodoc
class __$$UserListingsImplCopyWithImpl<$Res>
    extends _$ListingStateCopyWithImpl<$Res, _$UserListingsImpl>
    implements _$$UserListingsImplCopyWith<$Res> {
  __$$UserListingsImplCopyWithImpl(
      _$UserListingsImpl _value, $Res Function(_$UserListingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = freezed,
  }) {
    return _then(_$UserListingsImpl(
      freezed == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<ListingModel>?,
    ));
  }
}

/// @nodoc

class _$UserListingsImpl implements _UserListings {
  const _$UserListingsImpl(final List<ListingModel>? listings)
      : _listings = listings;

  final List<ListingModel>? _listings;
  @override
  List<ListingModel>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListingState.userListings(listings: $listings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListingsImpl &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_listings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListingsImplCopyWith<_$UserListingsImpl> get copyWith =>
      __$$UserListingsImplCopyWithImpl<_$UserListingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) {
    return userListings(listings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) {
    return userListings?.call(listings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (userListings != null) {
      return userListings(listings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) {
    return userListings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) {
    return userListings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (userListings != null) {
      return userListings(this);
    }
    return orElse();
  }
}

abstract class _UserListings implements ListingState {
  const factory _UserListings(final List<ListingModel>? listings) =
      _$UserListingsImpl;

  List<ListingModel>? get listings;
  @JsonKey(ignore: true)
  _$$UserListingsImplCopyWith<_$UserListingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ListingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ListingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)
        success,
    required TResult Function(List<ListingModel>? listings) userListings,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult? Function(List<ListingModel>? listings)? userListings,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(
            List<ListingModel>? listings,
            List<ListingModel>? offerList,
            List<ListingModel>? rentList,
            List<ListingModel>? saleList,
            List<ListingModel>? hotDealsList)?
        success,
    TResult Function(List<ListingModel>? listings)? userListings,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_UserListings value) userListings,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_UserListings value)? userListings,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_UserListings value)? userListings,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ListingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
