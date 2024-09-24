// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helpers.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DBUser extends DataClass implements Insertable<DBUser> {
  final String name;
  final String email;
  final String dob;
  DBUser({required this.name, required this.email, required this.dob});
  factory DBUser.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBUser(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['dob'] = Variable<String>(dob);
    return map;
  }

  DBUsersCompanion toCompanion(bool nullToAbsent) {
    return DBUsersCompanion(
      name: Value(name),
      email: Value(email),
      dob: Value(dob),
    );
  }

  factory DBUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBUser(
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      dob: serializer.fromJson<String>(json['dob']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'dob': serializer.toJson<String>(dob),
    };
  }

  DBUser copyWith({String? name, String? email, String? dob}) => DBUser(
        name: name ?? this.name,
        email: email ?? this.email,
        dob: dob ?? this.dob,
      );
  @override
  String toString() {
    return (StringBuffer('DBUser(')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, email, dob);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBUser &&
          other.name == this.name &&
          other.email == this.email &&
          other.dob == this.dob);
}

class DBUsersCompanion extends UpdateCompanion<DBUser> {
  final Value<String> name;
  final Value<String> email;
  final Value<String> dob;
  const DBUsersCompanion({
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.dob = const Value.absent(),
  });
  DBUsersCompanion.insert({
    required String name,
    required String email,
    required String dob,
  })  : name = Value(name),
        email = Value(email),
        dob = Value(dob);
  static Insertable<DBUser> custom({
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? dob,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (dob != null) 'dob': dob,
    });
  }

  DBUsersCompanion copyWith(
      {Value<String>? name, Value<String>? email, Value<String>? dob}) {
    return DBUsersCompanion(
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String>(dob.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBUsersCompanion(')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }
}

class $DBUsersTable extends DBUsers with TableInfo<$DBUsersTable, DBUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, email, dob];
  @override
  String get aliasedName => _alias ?? 'd_b_users';
  @override
  String get actualTableName => 'd_b_users';
  @override
  VerificationContext validateIntegrity(Insertable<DBUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  DBUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBUser.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBUsersTable createAlias(String alias) {
    return $DBUsersTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DBUsersTable dBUsers = $DBUsersTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBUsers];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UsersDaoMixin on DatabaseAccessor<AppDatabase> {
  $DBUsersTable get dBUsers => attachedDatabase.dBUsers;
}
