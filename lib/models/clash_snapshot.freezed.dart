// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Snapshot _$SnapshotFromJson(Map<String, dynamic> json) {
  return _Snapshot.fromJson(json);
}

/// @nodoc
mixin _$Snapshot {
  int get downloadTotal => throw _privateConstructorUsedError;
  int get uploadTotal => throw _privateConstructorUsedError;
  List<Connection>? get connections => throw _privateConstructorUsedError;
  int get memory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapshotCopyWith<Snapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapshotCopyWith<$Res> {
  factory $SnapshotCopyWith(Snapshot value, $Res Function(Snapshot) then) =
      _$SnapshotCopyWithImpl<$Res, Snapshot>;
  @useResult
  $Res call(
      {int downloadTotal,
      int uploadTotal,
      List<Connection>? connections,
      int memory});
}

/// @nodoc
class _$SnapshotCopyWithImpl<$Res, $Val extends Snapshot>
    implements $SnapshotCopyWith<$Res> {
  _$SnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadTotal = null,
    Object? uploadTotal = null,
    Object? connections = freezed,
    Object? memory = null,
  }) {
    return _then(_value.copyWith(
      downloadTotal: null == downloadTotal
          ? _value.downloadTotal
          : downloadTotal // ignore: cast_nullable_to_non_nullable
              as int,
      uploadTotal: null == uploadTotal
          ? _value.uploadTotal
          : uploadTotal // ignore: cast_nullable_to_non_nullable
              as int,
      connections: freezed == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connection>?,
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnapshotImplCopyWith<$Res>
    implements $SnapshotCopyWith<$Res> {
  factory _$$SnapshotImplCopyWith(
          _$SnapshotImpl value, $Res Function(_$SnapshotImpl) then) =
      __$$SnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int downloadTotal,
      int uploadTotal,
      List<Connection>? connections,
      int memory});
}

/// @nodoc
class __$$SnapshotImplCopyWithImpl<$Res>
    extends _$SnapshotCopyWithImpl<$Res, _$SnapshotImpl>
    implements _$$SnapshotImplCopyWith<$Res> {
  __$$SnapshotImplCopyWithImpl(
      _$SnapshotImpl _value, $Res Function(_$SnapshotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadTotal = null,
    Object? uploadTotal = null,
    Object? connections = freezed,
    Object? memory = null,
  }) {
    return _then(_$SnapshotImpl(
      downloadTotal: null == downloadTotal
          ? _value.downloadTotal
          : downloadTotal // ignore: cast_nullable_to_non_nullable
              as int,
      uploadTotal: null == uploadTotal
          ? _value.uploadTotal
          : uploadTotal // ignore: cast_nullable_to_non_nullable
              as int,
      connections: freezed == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connection>?,
      memory: null == memory
          ? _value.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnapshotImpl extends _Snapshot {
  const _$SnapshotImpl(
      {required this.downloadTotal,
      required this.uploadTotal,
      final List<Connection>? connections,
      this.memory = 0})
      : _connections = connections,
        super._();

  factory _$SnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnapshotImplFromJson(json);

  @override
  final int downloadTotal;
  @override
  final int uploadTotal;
  final List<Connection>? _connections;
  @override
  List<Connection>? get connections {
    final value = _connections;
    if (value == null) return null;
    if (_connections is EqualUnmodifiableListView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int memory;

  @override
  String toString() {
    return 'Snapshot(downloadTotal: $downloadTotal, uploadTotal: $uploadTotal, connections: $connections, memory: $memory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnapshotImpl &&
            (identical(other.downloadTotal, downloadTotal) ||
                other.downloadTotal == downloadTotal) &&
            (identical(other.uploadTotal, uploadTotal) ||
                other.uploadTotal == uploadTotal) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            (identical(other.memory, memory) || other.memory == memory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, downloadTotal, uploadTotal,
      const DeepCollectionEquality().hash(_connections), memory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapshotImplCopyWith<_$SnapshotImpl> get copyWith =>
      __$$SnapshotImplCopyWithImpl<_$SnapshotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnapshotImplToJson(
      this,
    );
  }
}

abstract class _Snapshot extends Snapshot {
  const factory _Snapshot(
      {required final int downloadTotal,
      required final int uploadTotal,
      final List<Connection>? connections,
      final int memory}) = _$SnapshotImpl;
  const _Snapshot._() : super._();

  factory _Snapshot.fromJson(Map<String, dynamic> json) =
      _$SnapshotImpl.fromJson;

  @override
  int get downloadTotal;
  @override
  int get uploadTotal;
  @override
  List<Connection>? get connections;
  @override
  int get memory;
  @override
  @JsonKey(ignore: true)
  _$$SnapshotImplCopyWith<_$SnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return _Connection.fromJson(json);
}

/// @nodoc
mixin _$Connection {
  String get id => throw _privateConstructorUsedError;
  int get upload => throw _privateConstructorUsedError;
  int get download => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  List<String> get chains => throw _privateConstructorUsedError;
  String get rule => throw _privateConstructorUsedError;
  String get rulePayload => throw _privateConstructorUsedError;
  Metadata get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionCopyWith<Connection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionCopyWith<$Res> {
  factory $ConnectionCopyWith(
          Connection value, $Res Function(Connection) then) =
      _$ConnectionCopyWithImpl<$Res, Connection>;
  @useResult
  $Res call(
      {String id,
      int upload,
      int download,
      String start,
      List<String> chains,
      String rule,
      String rulePayload,
      Metadata metadata});

  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$ConnectionCopyWithImpl<$Res, $Val extends Connection>
    implements $ConnectionCopyWith<$Res> {
  _$ConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upload = null,
    Object? download = null,
    Object? start = null,
    Object? chains = null,
    Object? rule = null,
    Object? rulePayload = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      chains: null == chains
          ? _value.chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      rulePayload: null == rulePayload
          ? _value.rulePayload
          : rulePayload // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConnectionImplCopyWith<$Res>
    implements $ConnectionCopyWith<$Res> {
  factory _$$ConnectionImplCopyWith(
          _$ConnectionImpl value, $Res Function(_$ConnectionImpl) then) =
      __$$ConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int upload,
      int download,
      String start,
      List<String> chains,
      String rule,
      String rulePayload,
      Metadata metadata});

  @override
  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$ConnectionImplCopyWithImpl<$Res>
    extends _$ConnectionCopyWithImpl<$Res, _$ConnectionImpl>
    implements _$$ConnectionImplCopyWith<$Res> {
  __$$ConnectionImplCopyWithImpl(
      _$ConnectionImpl _value, $Res Function(_$ConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upload = null,
    Object? download = null,
    Object? start = null,
    Object? chains = null,
    Object? rule = null,
    Object? rulePayload = null,
    Object? metadata = null,
  }) {
    return _then(_$ConnectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      chains: null == chains
          ? _value._chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      rulePayload: null == rulePayload
          ? _value.rulePayload
          : rulePayload // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ConnectionImpl extends _Connection {
  const _$ConnectionImpl(
      {required this.id,
      required this.upload,
      required this.download,
      required this.start,
      required final List<String> chains,
      required this.rule,
      required this.rulePayload,
      required this.metadata})
      : _chains = chains,
        super._();

  factory _$ConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionImplFromJson(json);

  @override
  final String id;
  @override
  final int upload;
  @override
  final int download;
  @override
  final String start;
  final List<String> _chains;
  @override
  List<String> get chains {
    if (_chains is EqualUnmodifiableListView) return _chains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chains);
  }

  @override
  final String rule;
  @override
  final String rulePayload;
  @override
  final Metadata metadata;

  @override
  String toString() {
    return 'Connection(id: $id, upload: $upload, download: $download, start: $start, chains: $chains, rule: $rule, rulePayload: $rulePayload, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download) &&
            (identical(other.start, start) || other.start == start) &&
            const DeepCollectionEquality().equals(other._chains, _chains) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.rulePayload, rulePayload) ||
                other.rulePayload == rulePayload) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      upload,
      download,
      start,
      const DeepCollectionEquality().hash(_chains),
      rule,
      rulePayload,
      metadata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      __$$ConnectionImplCopyWithImpl<_$ConnectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionImplToJson(
      this,
    );
  }
}

abstract class _Connection extends Connection {
  const factory _Connection(
      {required final String id,
      required final int upload,
      required final int download,
      required final String start,
      required final List<String> chains,
      required final String rule,
      required final String rulePayload,
      required final Metadata metadata}) = _$ConnectionImpl;
  const _Connection._() : super._();

  factory _Connection.fromJson(Map<String, dynamic> json) =
      _$ConnectionImpl.fromJson;

  @override
  String get id;
  @override
  int get upload;
  @override
  int get download;
  @override
  String get start;
  @override
  List<String> get chains;
  @override
  String get rule;
  @override
  String get rulePayload;
  @override
  Metadata get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  String get network => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get sourceIP => throw _privateConstructorUsedError;
  String get destinationIP => throw _privateConstructorUsedError;
  String get sourcePort => throw _privateConstructorUsedError;
  String get destinationPort => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  String get dnsMode => throw _privateConstructorUsedError;
  String get processPath => throw _privateConstructorUsedError;
  String get specialProxy => throw _privateConstructorUsedError;

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
      {String network,
      String type,
      String sourceIP,
      String destinationIP,
      String sourcePort,
      String destinationPort,
      String host,
      String dnsMode,
      String processPath,
      String specialProxy});
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
    Object? network = null,
    Object? type = null,
    Object? sourceIP = null,
    Object? destinationIP = null,
    Object? sourcePort = null,
    Object? destinationPort = null,
    Object? host = null,
    Object? dnsMode = null,
    Object? processPath = null,
    Object? specialProxy = null,
  }) {
    return _then(_value.copyWith(
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sourceIP: null == sourceIP
          ? _value.sourceIP
          : sourceIP // ignore: cast_nullable_to_non_nullable
              as String,
      destinationIP: null == destinationIP
          ? _value.destinationIP
          : destinationIP // ignore: cast_nullable_to_non_nullable
              as String,
      sourcePort: null == sourcePort
          ? _value.sourcePort
          : sourcePort // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPort: null == destinationPort
          ? _value.destinationPort
          : destinationPort // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      dnsMode: null == dnsMode
          ? _value.dnsMode
          : dnsMode // ignore: cast_nullable_to_non_nullable
              as String,
      processPath: null == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String,
      specialProxy: null == specialProxy
          ? _value.specialProxy
          : specialProxy // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String network,
      String type,
      String sourceIP,
      String destinationIP,
      String sourcePort,
      String destinationPort,
      String host,
      String dnsMode,
      String processPath,
      String specialProxy});
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
    Object? network = null,
    Object? type = null,
    Object? sourceIP = null,
    Object? destinationIP = null,
    Object? sourcePort = null,
    Object? destinationPort = null,
    Object? host = null,
    Object? dnsMode = null,
    Object? processPath = null,
    Object? specialProxy = null,
  }) {
    return _then(_$MetadataImpl(
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sourceIP: null == sourceIP
          ? _value.sourceIP
          : sourceIP // ignore: cast_nullable_to_non_nullable
              as String,
      destinationIP: null == destinationIP
          ? _value.destinationIP
          : destinationIP // ignore: cast_nullable_to_non_nullable
              as String,
      sourcePort: null == sourcePort
          ? _value.sourcePort
          : sourcePort // ignore: cast_nullable_to_non_nullable
              as String,
      destinationPort: null == destinationPort
          ? _value.destinationPort
          : destinationPort // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      dnsMode: null == dnsMode
          ? _value.dnsMode
          : dnsMode // ignore: cast_nullable_to_non_nullable
              as String,
      processPath: null == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String,
      specialProxy: null == specialProxy
          ? _value.specialProxy
          : specialProxy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataImpl extends _Metadata {
  const _$MetadataImpl(
      {required this.network,
      required this.type,
      required this.sourceIP,
      required this.destinationIP,
      required this.sourcePort,
      required this.destinationPort,
      required this.host,
      required this.dnsMode,
      required this.processPath,
      required this.specialProxy})
      : super._();

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  @override
  final String network;
  @override
  final String type;
  @override
  final String sourceIP;
  @override
  final String destinationIP;
  @override
  final String sourcePort;
  @override
  final String destinationPort;
  @override
  final String host;
  @override
  final String dnsMode;
  @override
  final String processPath;
  @override
  final String specialProxy;

  @override
  String toString() {
    return 'Metadata(network: $network, type: $type, sourceIP: $sourceIP, destinationIP: $destinationIP, sourcePort: $sourcePort, destinationPort: $destinationPort, host: $host, dnsMode: $dnsMode, processPath: $processPath, specialProxy: $specialProxy)';
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

abstract class _Metadata extends Metadata {
  const factory _Metadata(
      {required final String network,
      required final String type,
      required final String sourceIP,
      required final String destinationIP,
      required final String sourcePort,
      required final String destinationPort,
      required final String host,
      required final String dnsMode,
      required final String processPath,
      required final String specialProxy}) = _$MetadataImpl;
  const _Metadata._() : super._();

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override
  String get network;
  @override
  String get type;
  @override
  String get sourceIP;
  @override
  String get destinationIP;
  @override
  String get sourcePort;
  @override
  String get destinationPort;
  @override
  String get host;
  @override
  String get dnsMode;
  @override
  String get processPath;
  @override
  String get specialProxy;
  @override
  @JsonKey(ignore: true)
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
