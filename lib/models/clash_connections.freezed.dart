// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_connections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashConnections _$ClashConnectionsFromJson(Map<String, dynamic> json) {
  return _ClashConnections.fromJson(json);
}

/// @nodoc
mixin _$ClashConnections {
  @JsonKey(name: 'downloadTotal')
  int? get downloadTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploadTotal')
  int? get uploadTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections')
  List<Connections>? get connections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashConnectionsCopyWith<ClashConnections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashConnectionsCopyWith<$Res> {
  factory $ClashConnectionsCopyWith(
          ClashConnections value, $Res Function(ClashConnections) then) =
      _$ClashConnectionsCopyWithImpl<$Res, ClashConnections>;
  @useResult
  $Res call(
      {@JsonKey(name: 'downloadTotal') int? downloadTotal,
      @JsonKey(name: 'uploadTotal') int? uploadTotal,
      @JsonKey(name: 'connections') List<Connections>? connections});
}

/// @nodoc
class _$ClashConnectionsCopyWithImpl<$Res, $Val extends ClashConnections>
    implements $ClashConnectionsCopyWith<$Res> {
  _$ClashConnectionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadTotal = freezed,
    Object? uploadTotal = freezed,
    Object? connections = freezed,
  }) {
    return _then(_value.copyWith(
      downloadTotal: freezed == downloadTotal
          ? _value.downloadTotal
          : downloadTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTotal: freezed == uploadTotal
          ? _value.uploadTotal
          : uploadTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      connections: freezed == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connections>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClashConnectionsImplCopyWith<$Res>
    implements $ClashConnectionsCopyWith<$Res> {
  factory _$$ClashConnectionsImplCopyWith(_$ClashConnectionsImpl value,
          $Res Function(_$ClashConnectionsImpl) then) =
      __$$ClashConnectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'downloadTotal') int? downloadTotal,
      @JsonKey(name: 'uploadTotal') int? uploadTotal,
      @JsonKey(name: 'connections') List<Connections>? connections});
}

/// @nodoc
class __$$ClashConnectionsImplCopyWithImpl<$Res>
    extends _$ClashConnectionsCopyWithImpl<$Res, _$ClashConnectionsImpl>
    implements _$$ClashConnectionsImplCopyWith<$Res> {
  __$$ClashConnectionsImplCopyWithImpl(_$ClashConnectionsImpl _value,
      $Res Function(_$ClashConnectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadTotal = freezed,
    Object? uploadTotal = freezed,
    Object? connections = freezed,
  }) {
    return _then(_$ClashConnectionsImpl(
      downloadTotal: freezed == downloadTotal
          ? _value.downloadTotal
          : downloadTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTotal: freezed == uploadTotal
          ? _value.uploadTotal
          : uploadTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      connections: freezed == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connections>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ClashConnectionsImpl
    with DiagnosticableTreeMixin
    implements _ClashConnections {
  const _$ClashConnectionsImpl(
      {@JsonKey(name: 'downloadTotal') this.downloadTotal,
      @JsonKey(name: 'uploadTotal') this.uploadTotal,
      @JsonKey(name: 'connections') final List<Connections>? connections})
      : _connections = connections;

  factory _$ClashConnectionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashConnectionsImplFromJson(json);

  @override
  @JsonKey(name: 'downloadTotal')
  final int? downloadTotal;
  @override
  @JsonKey(name: 'uploadTotal')
  final int? uploadTotal;
  final List<Connections>? _connections;
  @override
  @JsonKey(name: 'connections')
  List<Connections>? get connections {
    final value = _connections;
    if (value == null) return null;
    if (_connections is EqualUnmodifiableListView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClashConnections(downloadTotal: $downloadTotal, uploadTotal: $uploadTotal, connections: $connections)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClashConnections'))
      ..add(DiagnosticsProperty('downloadTotal', downloadTotal))
      ..add(DiagnosticsProperty('uploadTotal', uploadTotal))
      ..add(DiagnosticsProperty('connections', connections));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashConnectionsImpl &&
            (identical(other.downloadTotal, downloadTotal) ||
                other.downloadTotal == downloadTotal) &&
            (identical(other.uploadTotal, uploadTotal) ||
                other.uploadTotal == uploadTotal) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, downloadTotal, uploadTotal,
      const DeepCollectionEquality().hash(_connections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashConnectionsImplCopyWith<_$ClashConnectionsImpl> get copyWith =>
      __$$ClashConnectionsImplCopyWithImpl<_$ClashConnectionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashConnectionsImplToJson(
      this,
    );
  }
}

abstract class _ClashConnections implements ClashConnections {
  const factory _ClashConnections(
          {@JsonKey(name: 'downloadTotal') final int? downloadTotal,
          @JsonKey(name: 'uploadTotal') final int? uploadTotal,
          @JsonKey(name: 'connections') final List<Connections>? connections}) =
      _$ClashConnectionsImpl;

  factory _ClashConnections.fromJson(Map<String, dynamic> json) =
      _$ClashConnectionsImpl.fromJson;

  @override
  @JsonKey(name: 'downloadTotal')
  int? get downloadTotal;
  @override
  @JsonKey(name: 'uploadTotal')
  int? get uploadTotal;
  @override
  @JsonKey(name: 'connections')
  List<Connections>? get connections;
  @override
  @JsonKey(ignore: true)
  _$$ClashConnectionsImplCopyWith<_$ClashConnectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Connections _$ConnectionsFromJson(Map<String, dynamic> json) {
  return _Connections.fromJson(json);
}

/// @nodoc
mixin _$Connections {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  Metadata? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'upload')
  int? get upload => throw _privateConstructorUsedError;
  @JsonKey(name: 'download')
  int? get download => throw _privateConstructorUsedError;
  @JsonKey(name: 'start')
  String? get start => throw _privateConstructorUsedError;
  @JsonKey(name: 'chains')
  List<String>? get chains => throw _privateConstructorUsedError;
  @JsonKey(name: 'rule')
  String? get rule => throw _privateConstructorUsedError;
  @JsonKey(name: 'rulePayload')
  String? get rulePayload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionsCopyWith<Connections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionsCopyWith<$Res> {
  factory $ConnectionsCopyWith(
          Connections value, $Res Function(Connections) then) =
      _$ConnectionsCopyWithImpl<$Res, Connections>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'metadata') Metadata? metadata,
      @JsonKey(name: 'upload') int? upload,
      @JsonKey(name: 'download') int? download,
      @JsonKey(name: 'start') String? start,
      @JsonKey(name: 'chains') List<String>? chains,
      @JsonKey(name: 'rule') String? rule,
      @JsonKey(name: 'rulePayload') String? rulePayload});

  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ConnectionsCopyWithImpl<$Res, $Val extends Connections>
    implements $ConnectionsCopyWith<$Res> {
  _$ConnectionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? metadata = freezed,
    Object? upload = freezed,
    Object? download = freezed,
    Object? start = freezed,
    Object? chains = freezed,
    Object? rule = freezed,
    Object? rulePayload = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      upload: freezed == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int?,
      download: freezed == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      chains: freezed == chains
          ? _value.chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rule: freezed == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String?,
      rulePayload: freezed == rulePayload
          ? _value.rulePayload
          : rulePayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConnectionsImplCopyWith<$Res>
    implements $ConnectionsCopyWith<$Res> {
  factory _$$ConnectionsImplCopyWith(
          _$ConnectionsImpl value, $Res Function(_$ConnectionsImpl) then) =
      __$$ConnectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'metadata') Metadata? metadata,
      @JsonKey(name: 'upload') int? upload,
      @JsonKey(name: 'download') int? download,
      @JsonKey(name: 'start') String? start,
      @JsonKey(name: 'chains') List<String>? chains,
      @JsonKey(name: 'rule') String? rule,
      @JsonKey(name: 'rulePayload') String? rulePayload});

  @override
  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ConnectionsImplCopyWithImpl<$Res>
    extends _$ConnectionsCopyWithImpl<$Res, _$ConnectionsImpl>
    implements _$$ConnectionsImplCopyWith<$Res> {
  __$$ConnectionsImplCopyWithImpl(
      _$ConnectionsImpl _value, $Res Function(_$ConnectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? metadata = freezed,
    Object? upload = freezed,
    Object? download = freezed,
    Object? start = freezed,
    Object? chains = freezed,
    Object? rule = freezed,
    Object? rulePayload = freezed,
  }) {
    return _then(_$ConnectionsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      upload: freezed == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int?,
      download: freezed == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      chains: freezed == chains
          ? _value._chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rule: freezed == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String?,
      rulePayload: freezed == rulePayload
          ? _value.rulePayload
          : rulePayload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectionsImpl with DiagnosticableTreeMixin implements _Connections {
  const _$ConnectionsImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'metadata') this.metadata,
      @JsonKey(name: 'upload') this.upload,
      @JsonKey(name: 'download') this.download,
      @JsonKey(name: 'start') this.start,
      @JsonKey(name: 'chains') final List<String>? chains,
      @JsonKey(name: 'rule') this.rule,
      @JsonKey(name: 'rulePayload') this.rulePayload})
      : _chains = chains;

  factory _$ConnectionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @override
  @JsonKey(name: 'upload')
  final int? upload;
  @override
  @JsonKey(name: 'download')
  final int? download;
  @override
  @JsonKey(name: 'start')
  final String? start;
  final List<String>? _chains;
  @override
  @JsonKey(name: 'chains')
  List<String>? get chains {
    final value = _chains;
    if (value == null) return null;
    if (_chains is EqualUnmodifiableListView) return _chains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'rule')
  final String? rule;
  @override
  @JsonKey(name: 'rulePayload')
  final String? rulePayload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Connections(id: $id, metadata: $metadata, upload: $upload, download: $download, start: $start, chains: $chains, rule: $rule, rulePayload: $rulePayload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Connections'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('metadata', metadata))
      ..add(DiagnosticsProperty('upload', upload))
      ..add(DiagnosticsProperty('download', download))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('chains', chains))
      ..add(DiagnosticsProperty('rule', rule))
      ..add(DiagnosticsProperty('rulePayload', rulePayload));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download) &&
            (identical(other.start, start) || other.start == start) &&
            const DeepCollectionEquality().equals(other._chains, _chains) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.rulePayload, rulePayload) ||
                other.rulePayload == rulePayload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, metadata, upload, download,
      start, const DeepCollectionEquality().hash(_chains), rule, rulePayload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionsImplCopyWith<_$ConnectionsImpl> get copyWith =>
      __$$ConnectionsImplCopyWithImpl<_$ConnectionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionsImplToJson(
      this,
    );
  }
}

abstract class _Connections implements Connections {
  const factory _Connections(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'metadata') final Metadata? metadata,
          @JsonKey(name: 'upload') final int? upload,
          @JsonKey(name: 'download') final int? download,
          @JsonKey(name: 'start') final String? start,
          @JsonKey(name: 'chains') final List<String>? chains,
          @JsonKey(name: 'rule') final String? rule,
          @JsonKey(name: 'rulePayload') final String? rulePayload}) =
      _$ConnectionsImpl;

  factory _Connections.fromJson(Map<String, dynamic> json) =
      _$ConnectionsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'metadata')
  Metadata? get metadata;
  @override
  @JsonKey(name: 'upload')
  int? get upload;
  @override
  @JsonKey(name: 'download')
  int? get download;
  @override
  @JsonKey(name: 'start')
  String? get start;
  @override
  @JsonKey(name: 'chains')
  List<String>? get chains;
  @override
  @JsonKey(name: 'rule')
  String? get rule;
  @override
  @JsonKey(name: 'rulePayload')
  String? get rulePayload;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionsImplCopyWith<_$ConnectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  @JsonKey(name: 'network')
  String? get network => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'sourceIP')
  String? get sourceIP => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinationIP')
  String? get destinationIP => throw _privateConstructorUsedError;
  @JsonKey(name: 'sourcePort')
  String? get sourcePort => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinationPort')
  String? get destinationPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'host')
  String? get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'dnsMode')
  String? get dnsMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'processPath')
  String? get processPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialProxy')
  String? get specialProxy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetadataCopyWith<Metadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataCopyWith<$Res> {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) then) =
      _$MetadataCopyWithImpl<$Res, Metadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'network') String? network,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'sourceIP') String? sourceIP,
      @JsonKey(name: 'destinationIP') String? destinationIP,
      @JsonKey(name: 'sourcePort') String? sourcePort,
      @JsonKey(name: 'destinationPort') String? destinationPort,
      @JsonKey(name: 'host') String? host,
      @JsonKey(name: 'dnsMode') String? dnsMode,
      @JsonKey(name: 'processPath') String? processPath,
      @JsonKey(name: 'specialProxy') String? specialProxy});
}

/// @nodoc
class _$MetadataCopyWithImpl<$Res, $Val extends Metadata>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = freezed,
    Object? type = freezed,
    Object? sourceIP = freezed,
    Object? destinationIP = freezed,
    Object? sourcePort = freezed,
    Object? destinationPort = freezed,
    Object? host = freezed,
    Object? dnsMode = freezed,
    Object? processPath = freezed,
    Object? specialProxy = freezed,
  }) {
    return _then(_value.copyWith(
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIP: freezed == sourceIP
          ? _value.sourceIP
          : sourceIP // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationIP: freezed == destinationIP
          ? _value.destinationIP
          : destinationIP // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePort: freezed == sourcePort
          ? _value.sourcePort
          : sourcePort // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationPort: freezed == destinationPort
          ? _value.destinationPort
          : destinationPort // ignore: cast_nullable_to_non_nullable
              as String?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      dnsMode: freezed == dnsMode
          ? _value.dnsMode
          : dnsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      processPath: freezed == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String?,
      specialProxy: freezed == specialProxy
          ? _value.specialProxy
          : specialProxy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataImplCopyWith<$Res>
    implements $MetadataCopyWith<$Res> {
  factory _$$MetadataImplCopyWith(
          _$MetadataImpl value, $Res Function(_$MetadataImpl) then) =
      __$$MetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'network') String? network,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'sourceIP') String? sourceIP,
      @JsonKey(name: 'destinationIP') String? destinationIP,
      @JsonKey(name: 'sourcePort') String? sourcePort,
      @JsonKey(name: 'destinationPort') String? destinationPort,
      @JsonKey(name: 'host') String? host,
      @JsonKey(name: 'dnsMode') String? dnsMode,
      @JsonKey(name: 'processPath') String? processPath,
      @JsonKey(name: 'specialProxy') String? specialProxy});
}

/// @nodoc
class __$$MetadataImplCopyWithImpl<$Res>
    extends _$MetadataCopyWithImpl<$Res, _$MetadataImpl>
    implements _$$MetadataImplCopyWith<$Res> {
  __$$MetadataImplCopyWithImpl(
      _$MetadataImpl _value, $Res Function(_$MetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = freezed,
    Object? type = freezed,
    Object? sourceIP = freezed,
    Object? destinationIP = freezed,
    Object? sourcePort = freezed,
    Object? destinationPort = freezed,
    Object? host = freezed,
    Object? dnsMode = freezed,
    Object? processPath = freezed,
    Object? specialProxy = freezed,
  }) {
    return _then(_$MetadataImpl(
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIP: freezed == sourceIP
          ? _value.sourceIP
          : sourceIP // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationIP: freezed == destinationIP
          ? _value.destinationIP
          : destinationIP // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePort: freezed == sourcePort
          ? _value.sourcePort
          : sourcePort // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationPort: freezed == destinationPort
          ? _value.destinationPort
          : destinationPort // ignore: cast_nullable_to_non_nullable
              as String?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      dnsMode: freezed == dnsMode
          ? _value.dnsMode
          : dnsMode // ignore: cast_nullable_to_non_nullable
              as String?,
      processPath: freezed == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String?,
      specialProxy: freezed == specialProxy
          ? _value.specialProxy
          : specialProxy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataImpl with DiagnosticableTreeMixin implements _Metadata {
  const _$MetadataImpl(
      {@JsonKey(name: 'network') this.network,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'sourceIP') this.sourceIP,
      @JsonKey(name: 'destinationIP') this.destinationIP,
      @JsonKey(name: 'sourcePort') this.sourcePort,
      @JsonKey(name: 'destinationPort') this.destinationPort,
      @JsonKey(name: 'host') this.host,
      @JsonKey(name: 'dnsMode') this.dnsMode,
      @JsonKey(name: 'processPath') this.processPath,
      @JsonKey(name: 'specialProxy') this.specialProxy});

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  @override
  @JsonKey(name: 'network')
  final String? network;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'sourceIP')
  final String? sourceIP;
  @override
  @JsonKey(name: 'destinationIP')
  final String? destinationIP;
  @override
  @JsonKey(name: 'sourcePort')
  final String? sourcePort;
  @override
  @JsonKey(name: 'destinationPort')
  final String? destinationPort;
  @override
  @JsonKey(name: 'host')
  final String? host;
  @override
  @JsonKey(name: 'dnsMode')
  final String? dnsMode;
  @override
  @JsonKey(name: 'processPath')
  final String? processPath;
  @override
  @JsonKey(name: 'specialProxy')
  final String? specialProxy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Metadata(network: $network, type: $type, sourceIP: $sourceIP, destinationIP: $destinationIP, sourcePort: $sourcePort, destinationPort: $destinationPort, host: $host, dnsMode: $dnsMode, processPath: $processPath, specialProxy: $specialProxy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Metadata'))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('sourceIP', sourceIP))
      ..add(DiagnosticsProperty('destinationIP', destinationIP))
      ..add(DiagnosticsProperty('sourcePort', sourcePort))
      ..add(DiagnosticsProperty('destinationPort', destinationPort))
      ..add(DiagnosticsProperty('host', host))
      ..add(DiagnosticsProperty('dnsMode', dnsMode))
      ..add(DiagnosticsProperty('processPath', processPath))
      ..add(DiagnosticsProperty('specialProxy', specialProxy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataImpl &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sourceIP, sourceIP) ||
                other.sourceIP == sourceIP) &&
            (identical(other.destinationIP, destinationIP) ||
                other.destinationIP == destinationIP) &&
            (identical(other.sourcePort, sourcePort) ||
                other.sourcePort == sourcePort) &&
            (identical(other.destinationPort, destinationPort) ||
                other.destinationPort == destinationPort) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.dnsMode, dnsMode) || other.dnsMode == dnsMode) &&
            (identical(other.processPath, processPath) ||
                other.processPath == processPath) &&
            (identical(other.specialProxy, specialProxy) ||
                other.specialProxy == specialProxy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      network,
      type,
      sourceIP,
      destinationIP,
      sourcePort,
      destinationPort,
      host,
      dnsMode,
      processPath,
      specialProxy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      __$$MetadataImplCopyWithImpl<_$MetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataImplToJson(
      this,
    );
  }
}

abstract class _Metadata implements Metadata {
  const factory _Metadata(
          {@JsonKey(name: 'network') final String? network,
          @JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'sourceIP') final String? sourceIP,
          @JsonKey(name: 'destinationIP') final String? destinationIP,
          @JsonKey(name: 'sourcePort') final String? sourcePort,
          @JsonKey(name: 'destinationPort') final String? destinationPort,
          @JsonKey(name: 'host') final String? host,
          @JsonKey(name: 'dnsMode') final String? dnsMode,
          @JsonKey(name: 'processPath') final String? processPath,
          @JsonKey(name: 'specialProxy') final String? specialProxy}) =
      _$MetadataImpl;

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override
  @JsonKey(name: 'network')
  String? get network;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'sourceIP')
  String? get sourceIP;
  @override
  @JsonKey(name: 'destinationIP')
  String? get destinationIP;
  @override
  @JsonKey(name: 'sourcePort')
  String? get sourcePort;
  @override
  @JsonKey(name: 'destinationPort')
  String? get destinationPort;
  @override
  @JsonKey(name: 'host')
  String? get host;
  @override
  @JsonKey(name: 'dnsMode')
  String? get dnsMode;
  @override
  @JsonKey(name: 'processPath')
  String? get processPath;
  @override
  @JsonKey(name: 'specialProxy')
  String? get specialProxy;
  @override
  @JsonKey(ignore: true)
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
