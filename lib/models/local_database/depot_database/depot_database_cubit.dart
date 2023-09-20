import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'depot_database_state.dart';

class DepotDatabaseCubit extends Cubit<DepotDatabaseCubitState> {
  DepotDatabaseCubit() : super(DepotDatabaseCubitInitialState());

  // this is for doing CRUD operation
  late Database database;

  // all depot save here when getting data
  List<Map> newDepotList = [];

  // this for getting method and variable
  static DepotDatabaseCubit get(BuildContext context) =>
      BlocProvider.of(context);

  // this for creating
  Future<void> createDepotDatabase() async {
    await openDatabase('depot.db', version: 1, onCreate: (database, version) {
      database
          .execute(
        'CREATE TABLE yaffetDepot (id INTEGER PRIMARY KEY ,name TEXT, depotType TEXT , weightValue Integer , weightUnit TEXT , pureGold Text , currency TEXT)',
      )
          .then(
        (value) {
          print('database created');
        },
      ).catchError(
        (error) {
          print('error is ${error.toString()}');
        },
      );
    }, onOpen: (database) {
      getDataFromDepotDatabase(database: database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppDepotCreateDatabaseState());
    });
  }

  // this for inserting
  Future<void> insertDepotDatabase({
    required String? name,
    required String? depotType,
    required String? weightValue,
    required String? weightUnit,
    required String? pureGold,
    required String? currency,
  }) async {
    database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO yaffetDepot(name,depotType,weightValue,weightUnit,pureGold,currency) VALUES("$name" , "$depotType","$weightValue","$weightUnit","$pureGold" , "$currency")',
      )
          .then((value) {
        print('the id is ($value)');
        emit(AppDepotInsertDatabaseState());
        getDataFromDepotDatabase(database: database);
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
      return null;
    }).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

  //this for getting database
  Future<void> getDataFromDepotDatabase({required Database database}) async {
    // this to not add on old item
    newDepotList = [];
    await database.rawQuery("SELECT * FROM yaffetDepot").then((value) {
      // this for when get data add in newDepotList
      for (var element in value) {
        newDepotList.add(element);
      }
      print("database content \n new yaffetDepot list: \n [ $newDepotList ]");
      emit(AppDepotGetDatabaseState());
    }).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

  // this for updating
  // the parameter in this method
  Future<void> updateDepotDatabase({
    required int id,
    required String name,
    required String depotType,
    // String? weightValue,
    // String? weightUnit,
    required String pureGold,
    required String currency,
  }) async {
    await database.rawUpdate(
        'UPDATE yaffetDepot SET name = ? SET depotType = ?  SET pureGold ? SET currency ? WHERE id = ?',

        /**
         *  SET weightValue = ? SET weightUnit = ?
         */
        [
          name,
          depotType,
          // '$weightValue',
          // '$weightUnit',
          pureGold,
          currency,
          id,
        ]).then(
      (value) {
        getDataFromDepotDatabase(database: database);
        emit(AppDepotUpdateDatabaseState());
      },
    ).catchError(
      (error) {
        print('error is ${error.toString()}');
      },
    );
  }

// and this for deleting
  Future<void> deleteData({
    required int id,
  }) async {
    await database.rawDelete('DELETE FROM yaffetDepot WHERE id = ?', [
      id,
    ]).then(
      (value) {
        getDataFromDepotDatabase(database: database);
        emit(AppDepotDeleteDatabaseState());
        print('the deleted item : \n $newDepotList');
      },
    ).catchError(
      (error) {
        print('error is \n ${error.toString()}');
      },
    );
  }

  Future<void> updateItemDepot({
    required int id,
    required String? name,
    required String? depotType,
    required String? pureGold,
    required String? currency,
    required String? weightValue,
    required String? weightUnit,
  }) async {
    await database.transaction((txn) async {
      await txn.update(
        'yaffetDepot',
        {
          'id': id,
          'name': '$name',
          'depotType': '$depotType',
          'pureGold': '$pureGold',
          'currency': '$currency',
          'weightValue': '$weightValue',
          'weightUnit': '$weightUnit'
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      getDataFromDepotDatabase(database: database);
      emit(AppDepotUpdateDatabaseState());
    });
  }


  Future<void> insertedItemDepot({
    required String? name,
    required String? depotType,
    required String? pureGold,
    required String? currency,
    required String? weightValue,
    required String? weightUnit,
  }) async {
    await database.transaction((txn) async {
      await txn.insert(
        'yaffetDepot',
        {
          'name': '$name',
          'depotType': '$depotType',
          'pureGold': '$pureGold',
          'currency': '$currency',
          'weightValue': '$weightValue',
          'weightUnit': '$weightUnit'
        },
      );
      getDataFromDepotDatabase(database: database);
      emit(AppDepotUpdateDatabaseState());
    });
  }

}
